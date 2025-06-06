## Async

`Future` Trait will be given with a `poll` to check pending or ready. And the ability to prod `Waker` to poll again in the future.

`Runtime/Exectutor`: The real implementation to dispatch/poll `Future`.

`async/await` is the simplification workflow of callback. Which `await` will pause and return control to the executor until the production of output. But the whole workflow requires no need for manual callback handling.

Whole process doesn't require multiple independent stack which will grows in heavy concurrency.

However, it suitable only for I/O intensive rather CPU intensive operations, because there's no need to "wait" in the latter situation. Even the runtime dispatch each task, the total time won't be reduced by jumping off `block/wait` period because you still need to finish all.

## Embedded

`embassy` is a light runtime for embedded system.

Expansion of `#[embassy_executor::task]`
```rust
#[doc(hidden)]
async fn __run1_task() {
    loop {
        log::info!("tick for 1 sec");
        embassy_time::Timer::after_secs(1).await;
    }
}
fn run1() -> ::embassy_executor::SpawnToken<impl Sized> {
    type Fut = impl ::core::future::Future + 'static;
    const POOL_SIZE: usize = 1;
    static POOL: ::embassy_executor::raw::TaskPool<Fut, POOL_SIZE> =
        ::embassy_executor::raw::TaskPool::new();
    unsafe { POOL._spawn_async_fn(move || __run1_task()) }
}
```

`TaskPool` is a fixed size array with same type of the `Fut`, with length 1. So if you spawn the same function, it will be contaminated, resulting error.

Another design is `TaskStorage` which is the raw `Executor` should be alive throughout the program life time.

- `const/static`
- `Box::leak()`
- `transmute()` with a static lifetime notation

Struct:
- `TaskStorage`/`TaskPool ~ [TaskStorage;N]` spawn task.
- `AvailableTask` reuse `TaskStorage` by `claim` to recycle and `initialize` to spawn new function.

## Attempt of U-Level Embassy

- implement simple `CondVar`(`axsync` module).
    - implement `FUTEX_WAIT_QUEUES`:
    ```rust
    pub type Futex = AtomicU32
    fn futex_wake(futex:&Futex);
    fn futex_wake_all(futex:&Futex);
    fn futex_wait(futex: &Futex, expected: u32, timeout: Option<Duration>) -> bool;
    ```
    - implement S-level code:
    ```rust
        fn wait_optional_timeout<'a, T>(
        &self,
        guard: MutexGuard<'a, T>,
        timeout: Option<Duration>,
    ) -> Option<MutexGuard<'a, T>> {
        let expected = self.futex.load(core::sync::atomic::Ordering::Relaxed);
        let mutex = guard.mutex();

        let suc = futex_wait(&self.futex, expected, timeout);

        let new_guard = mutex.lock();

        if !suc && timeout.is_some() {
            None
        } else {
            Some(new_guard)
        }
    }
    ```
    - implement U-level, roughly same.
- implement `embassy_executor::Executor` with style same like `features = std`. Which use `CondVar` as `Signaler`.

There's no timer logic here, so we can't wait.

## Timer Queue

```toml
[dependencies]
embassy-time-driver = { version = "...", features = ["tick-hz-1000"] } # Driver fixes embassy TICK_HZ
embassy-time-queue-utils = { version = "..." }
```

- `schedule_wake(at: u64, waker: &Waker)`: Adds a new timer event to the queue. It merges wakers if a timer for the same task already exists (to avoid multiple queue entries for one task). It returns `true` if the newly added event becomes the earliest event in the queue, indicating operations by retrieving hardware timer's time.
- `poll(current_time: u64)`: This method is called by the driver's interrupt handler. It iterates through the queue and identifies all timer events whose target time (at) is less than or equal to `current_time`. For each expired event, it calls `waker.wake_by_ref()`. It removes expired events from the queue.

- `next_expiration(current_time: u64) -> u64`: Returns the target time of the earliest event still remaining in the queue whose time is strictly greater than `current_time`. Returns `u64::MAX` or a similar indicator if the queue is empty or all events are in the past/current.

Workflow:
- An `async` task in your application calls an `embassy-time` function like `Delay::delay_ms(1000).await`
- The `embassy-time` calculates the absolute target wake-up time in embassy ticks (`current_embassy_ticks + duration_in_embassy_ticks`).
- `embassy-time` calls your driver's `Driver::schedule_wake(target_time, task_waker)`.
- Your schedule_wake implementation (within a critical section) calls `queue.schedule_wake(target_time, task_waker)`.
- If `queue.schedule_wake(...)` returns `true`(because the new timer is the earliest), your `schedule_wake` gets the new earliest time from the queue using queue.next_expiration(`self.now()`). It then calls hardware timer's API (custom:`set_alarm_at`) to set the next interrupt to fire at this time (converting the time from embassy ticks to hardware timer units using `axconfig::devices::TIMER_FREQUENCY`).
- Eventually, the hardware timer reaches the programmed value and triggers an interrupt,the handler gets the current time (`Driver::now()`).
- The handler calls `queue.next_expiration(current_time)`. This iterates the queue, finds expired timers, and calls `waker.wake_by_ref()` for each, marking the associated tasks as ready.
- The `embassy-executor`, having been woken by the interrupt, polls the tasks that were just woken up.
- The task that was waiting on the timer is polled, sees its waker was woken, and resumes execution past the `.await` point.

---

## Embassy Executor

- embassy executor in os, should **park** to yield cpu until be waken due to specific event.
- axtask should wake specific future in specific task. Then executor will rerun to poll.

Executor Workflow:
- keeps a queue of tasks
- poll task sequentially until it blocks and yielding
- enqueue the block task and proceed to poll next
- repeat...

Interrupts Workflow:
- polled task will trigger peripherals to make a interruption
- interruption will be received by handler
- handler will update peripherals state
- handler will notify executor to poll the task.


## Embassy Preempt

Thread: Owns a private stack
Coroutine: Owns a shared stack

We don't know which is real sync or which is async, we only know the poll reason and wether it has stack or not.

We follow the rule of the reason:
- await poll for no stack no matter task has or not. After await poll, it has no stack no matter previous.
- interrupt poll for stack no matter task has or not, if not, we make one. After interrupt poll, it has private stack no matter previous.

---

- Common
  - Find highest prio task
  - Set alarm call back
---
- await poll(cooperative)
  - common
  - poll the highest priority
  - if the stack is in Thread mode or has its stack, drop and back to coroutine.
  - run task until `pending`
  - update task state to `NotReady`
  - Seek next and repeat
Stack will be reused after poll due to yielding actively.
---
- interupt poll(preemptive)
  - common
  - Here for stackless task, it will allocate a stack to mimic just as stack task.
*Comment*: We construct a "trampoline", a temporary stack to unify the workflow between stack and stackless task. Which unify and simplify workflow for `PendSV`.
  - `IntCtxSW`/`PendSV`:
    - await mode: stack/mimic-task task to take over stackless(shared stack) task yielding by `.await`.
    - interrupt mode: stackless(shared stack) is interrupted to be taken over by stack/mimic-stack task.
    - switch to new task stack, update PSP ptr to new task.
    - back to normal and execute.
  - trigger **PendSV**
Stack will be transformed to its own private stack.
  
Life Time:
- Sync:
  - Encapsulated in future as pesudo async.
  - Behavoir like a coroutine before interuption.
  - After interupted, change the shared stack to its own private stack as Thread.
  - No `.await` means it will continue as Thread as handling in interuption workflow.
- Async:
  - Same as Sync.
  - Behavoir as coroutine in `.await` before interuption.
  - After interupted, change the shared stack to its own private stack as Thread.
  - `.await` means its private stack will be dropped and behavoir as coroutine.

---

Embassy Logic:

- Initialize a `AvaialableTask` contains:
  `TaskStorage` which contains `poll_fn` and `future`:
  ```rust
    fn initialize_impl<S>(self, future: impl FnOnce() -> F) -> SpawnToken<S> {
        unsafe {
            self.task.raw.poll_fn.set(Some(TaskStorage::<F>::poll));
            self.task.future.write_in_place(future);

            let task = TaskRef::new(self.task);

            SpawnToken::new(task)
        }
    }
  ```
  Spawn token is nothing but a ptr to the raw task.
  ```rust
    pub fn spawn(&'static self, future: impl FnOnce() -> F) -> SpawnToken<impl Sized> {
        let task = AvailableTask::claim(self);
        match task {
            Some(task) => task.initialize(future),
            None => SpawnToken::new_failed(),
        }
    }
  ```
- Executor is:
  ```rust
  #[repr(transparent)]
  pub struct Executor {
      pub(crate) inner: SyncExecutor,

      _not_sync: PhantomData<*mut ()>,
  }
  ```
  Where inner will spawn, which enqueue by head to its `RunQueue` every `TaskRef`.

- `__pender` will be the context of executor to notify event.
- poll every task by execute `poll_fn` in every `TaskRef` in dequeue process.
