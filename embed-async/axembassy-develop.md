# AxEmbassy-Development

## Design and Background

AxEmbassy module is the incorporation of Embassy and Arceos. Mainly for aiding Arceos by async runtime of Embassy.

We know, usually there are 3 ways for executor implementation.
- `SWI` software interrupt: Based on `InterruptExecutor`.
- Single thread: Based on `Executor` without threads interaction, immediately trapped in async process.
- Multi-thread: Based on `Executor` with threads interaction(waited to be designed)

We choose last two methods, and tackle the design for multi-thread as the priority. Rather the reason to relinquish the first is due to the complicated and tough coding for implementation basic hardware interface, which is beyond.

In order to incorporate it, we should delve to `axtask` first.

## AxTask

> **[Deprecated]**
> Indeed, task as thread has multiple states:

>```rust
>/// The possible states of a task.
>#[repr(u8)]
>#[derive(Debug, Clone, Copy, Eq, PartialEq)]
>pub(crate) enum TaskState {
>    /// Task is running on some CPU.
>    Running = 1,
>    /// Task is ready to run on some scheduler's ready queue.
>    Ready = 2,
>    /// Task is blocked (in the wait queue or timer list),
>    /// and it has finished its scheduling process, it can be wake up by `notify()` on any run queue safely.
>    Blocked = 3,
>    /// Task is Suspended,
>    /// Not in wait queue.
>    Parked = 4,
>    /// Task is exited and waiting for being dropped.
>    Exited = 5,
>}
>```

>Here we implement `Parked` state which is new for async runtime task.

>The major problem is, if `executor` is at rest, we shouldn't let it occupy any `Running` state or high priority everytime in task scheduler. We need to `park` it while at rest.

>An unfortunate news is that there's no `Id` related schedule functionality in Arceos, that's means it usually comes with `AxTaskRef` as input rather manipulating through `TaskId`.

>A given way is:

>```rust
>pub(crate) fn current_run_queue<G: BaseGuard>() -> CurrentRunQueueRef<'static, G>
>```

>But it's not enough.

>Thus we can create a `Registry` to record `TaskId`:

>```rust
>/// Task registry by task id
>static TASK_REGISTRY: SpinNoIrq<BTreeMap<u64, AxTaskRef>> = SpinNoIrq::new(BTreeMap::new());
>/// Register a task to the task registry.
>/// 
>/// Should be called in the process of task spawn.
>pub fn register_task(task: AxTaskRef) {
>    let mut tasks = TASK_REGISTRY.lock();
>    let id = task.id().as_u64();
>    tasks.insert(id, task);
>    debug!("Task {} registered", id);
>}

>/// Unregister a task from the task registry.
>/// 
>/// Should be called in the process of task exit.
>pub fn unregister_task(id: u64) {
>    let mut tasks = TASK_REGISTRY.lock();
>    tasks.remove(&id);
>    debug!("Task {} unregistered", id);
>}

>/// Find a task by its ID.
>pub fn find_task_by_id(id: u64) -> Option<AxTaskRef> {
>    let tasks = TASK_REGISTRY.lock();
>    tasks.get(&id).cloned()
>}
>```

>With simple interface.

>The next thing is to create related method to park or unpark task in scheduler.

>```rust
>impl<G: BaseGuard> AxRunQueueRef<'_, G> {
>    pub fn unpark_task(&mut self, task: AxTaskRef, resched: bool) {
>        let task_id_name = task.id_name();
>        if self
>            .inner
>            .put_task_with_state(task, TaskState::Parked, resched)
>        {
>            // Since now, the task to be unblocked is in the `Ready` state.
>            let cpu_id = self.inner.cpu_id;
>            debug!("task unpark: {} on run_queue {}", task_id_name, cpu_id);
>            // Note: when the task is unblocked on another CPU's run queue,
>            // we just ignore the `resched` flag.
>            if resched && cpu_id == this_cpu_id() {
>                #[cfg(feature = "preempt")]
>                crate::current().set_preempt_pending(true);
>            }
>        }
>    }
>}

>impl<G: BaseGuard> CurrentRunQueueRef<'_, G> {
>    pub fn park_current_task(&mut self) {
>        let curr = &self.current_task;
>        assert!(curr.is_running());
>        assert!(!curr.is_idle());

>        // Ensure preemption is disabled
>        #[cfg(feature = "preempt")]
>        assert!(curr.can_preempt(1));

>        curr.set_state(TaskState::Parked);
>        self.inner.resched();
>    }
>}
>```
>Above code is to manipulate `RunQueueRef` by `put_task_with_state` and `current_task` by ref of current task.

>Finally, it's simple to:

>```rust
>/// Unpark a task by its id.
>pub fn unpark_task(id: u64, resched: bool) {
>    if let Some(task) = find_task_by_id(id) {
>        select_run_queue::<NoPreemptIrqSave>(&task).unpark_task(task, resched);
>    } 
>}

>/// Park the current task.
>pub fn park_current_task() {
>    let mut cur_rq = current_run_queue::<NoPreemptIrqSave>();
>    cur_rq.park_current_task();
>}
>```

>To park task.

Now we use `yield_now()` and depended on the `axtask` scheduler algorithm to dispatch the order. `park` and `unpark` is too slow.

## Embassy Executor

> **[Deprecated]**
> Recall `__pender` is the waker of executor to run. We thus inject `unpark` to `__pender` to let executor located thread runs. But how to indicate that executor should rest? We use a global `SIGNAL_WORK_THREAD_MODE`, which will turn to `false` after `poll()` if it's `true` before, otherwise it should be at `rest` because there's no work signaling it to `true`.

> Another problem is how to store the information of the thread executor located, we can store in context in first initiation.

> ```rust
> #[percpu::def_percpu]
> static SIGNAL_WORK_THREAD_MODE: AtomicBool = AtomicBool::new(false);

> #[unsafe(export_name = "__pender")]
> fn __pender(_context: *mut ()) {
>     SIGNAL_WORK_THREAD_MODE.with_current(|m| {
>         m.store(true, Ordering::SeqCst);
>     });
>     let id = _context as u64;
>     unpark_task(id, true);
> }

> impl Executor {
>     pub fn new() -> Self {
>         let cur_id = axtask::current().id().as_u64();
>         Self {
>             inner: raw::Executor::new(cur_id as *mut ()),
>             not_send: PhantomData,
>         }
>     }

>     pub fn run(&'static mut self, init: impl FnOnce(embassy_executor::Spawner)) -> ! {
>         init(self.inner.spawner());

>         loop {
>             unsafe {
>                 self.inner.poll();
>                 let polled = SIGNAL_WORK_THREAD_MODE.with_current(|m| m.load(Ordering::Acquire));
>                 if polled {
>                     SIGNAL_WORK_THREAD_MODE.with_current(|m| {
>                         m.store(false, Ordering::SeqCst);
>                     });
>                 } else {
>                     park_current_task();
>                 }
>             };
>         }
>     }
> }
> ```

> Indeed, if there's no need to interact with threads, we just remove code related to threads.

`__pender()` is the waker of executor to poll task. User should inject its own signal logic to adapt various system. We use a global atomic boolean to achieve this[^embassy_design].

```rust
#[unsafe(export_name = "__pender")]
fn __pender(_context: *mut ()) {
    #[cfg(feature = "executor-thread")]
    SINGAL_THREAD.with_current(|m| {
        m.store(true, Ordering::SeqCst);
    });
}
```

After polling task, executor rely on the information suggested by the boolean, if there's `true`, we turn it to `false` indicating we finish it. If not, it suggests that there's no need to do more, we `yield_now()` to other threads.

```rust
pub struct Executor {
    inner: raw::Executor,
    not_send: PhantomData<*mut ()>,
}

pub fn fn run(...) -> ! {
    ...
    self.inner.poll();
    if SIGNAL_SINGLE.load(Ordering::SeqCst) {
        SIGNAL_SINGLE.store(false, Ordering::SeqCst);
    } else {
        axtask::yield_now()
    }
}
```

[^embassy_design]: Actually it's a usual implementation in embassy.

## Runtime Thread Initiation

The final problem is the user-friendly interface construction. Embassy use `spawner` as a ref to executor to spawn task. Thus we can extract spawner as a global instance, and move task to the thread executor located by `spawner`. Luckily, Embassy design such struct as `SendSpawner`, allowing `Send` object to be sended.

We thus try to do this:

```rust
pub(crate) static SPAWNER: Mutex<OnceCell<SendSpawner>> = Mutex::new(OnceCell::new());

pub fn spawner() -> SendSpawner {
    let sp = SPAWNER.lock();
    *sp.get().unwrap()
}

pub(crate) fn set_spawner(spawner: SendSpawner) {
    let sp = SPAWNER.lock();
    let _ = sp.set(spawner);
}
```

However, to allow other threads to use such `spawner`, we need to let the runtime thread executing first. There's no such functionality to prominently schedule this. And the main skeleton of initiation is to load `main` function entry.

> **[Deprecated]**
> We achieve this by a dirty way, we park `main` thread first and then unpark it in `spawn` initiation.

> ```rust
>         #[cfg(feature = "executor-thread")]
>         pub fn init_spawn() {
>             use axtask::spawn_raw;
>             spawn_raw(init, "async".into(), axconfig::TASK_STACK_SIZE);
>         }

>         #[cfg(feature = "executor-thread")]
>         pub fn init() {
>             use crate::executor_thread::Executor;
>             use static_cell::StaticCell;

>             static EXECUTOR: StaticCell<Executor> = StaticCell::new();
>             EXECUTOR
>                 .init_with(Executor::new)
>                 .run(|sp| sp.must_spawn(init_task()));
>         }

>         #[cfg(feature = "executor-thread")]
>         #[embassy_executor::task]
>         async fn init_task() {
>             use axtask::unpark_task;
>             use log::info;

>             let spawner = asynch::Spawner::for_current_executor().await;
>             asynch::set_spawner(spawner.make_send());
>             info!("spawner is set, unpark the main thread.");
>             unpark_task(2, true);
>         }
> ```

> And such AxRuntime initiation process:

> ```rust
> pub extern "C" fn rust_main(cpu_id: usize, dtb: usize) -> ! {
>     #[cfg(feature = "multitask")]
>     {
>         axtask::init_scheduler();
>         axembassy::init_spawn();
>     }
> 	...
>     unsafe {
>         #[cfg(feature = "multitask")]
>         {
>             // park main task to let embassy task initialize first
>             axtask::park_current_task()
>         }
>         main()
>     };
> }
> ```

> Indeed, above code is just to spawn a thread for executor, and `unpark_task(2,...)` is to unpark main task that's parked in AxRuntime initiation process. After goes to `main` entry, scheduler will immediately switch to other task, in order to initiate `spawner` first. After that, we can `main` task be scheduled to run.

We try to initialize after user call `spawner()`, we suggests that the new initiated thread should always run first.

```rust
/// # Panics
///
/// Panics if the system executor is not initialized.
pub fn spawner() -> SendSpawner {
    let sp = SPAWNER.lock();
    if let Some(inner) = sp.get() {
        *inner
    } else {
        drop(sp);
        init_spawn();
        yield_now();
        // initialize the spawner if not
        let sp = SPAWNER.lock();
        *sp.get().expect("Reinitialize the spawner failed")
    }
}
```

We try to `yield_now()` the caller thread and hope the initiated thread will implement first. Actually we can create a loop to repeatedly `yield_now()` until the global spawer is initiated[^devise].

[^devise]: We can choose a multiple executor design, which is the future plan.

## Embassy Timer

Embassy construct a ffi interface allowing a non-generic way to register a general time driver to schedule time tasks.

Thanks to Embassy, to schedule time task, `embassy-timer-utils` provide `Queue`. 

Inspect the logic of `Timer`, it will call the ffi interface `schedule_wake` which should be implemented by user.

```rust
impl Future for Timer {
    type Output = ();
    fn poll(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        if self.yielded_once && self.expires_at <= Instant::now() {
            Poll::Ready(())
        } else {
            embassy_time_driver::schedule_wake(self.expires_at.as_ticks(), cx.waker());
            self.yielded_once = true;
            Poll::Pending
        }
    }
}
```

---

Second, Arceos provide `irq` feature to tick in a presumed period for task schedule or other `irq` logic.

We has a method to set Arceos timer by:

```rust
set_oneshot_timer(deadline_ns:u64)
```

---

That's, we need to bridge both.

So, we should check the expired timer after a short period. it's necessary to register the `schedule timer` logic into the `irq`.

```rust
struct AxDriver {
    queue: SpinNoIrq<RefCell<Queue>>,
    // static period interval
    period_nanos: AtomicU64,
}

impl AxDriver {
    pub fn ticks_now() -> u64 {
        let nanos_now = time::monotonic_time_nanos();
        nanos_to_ticks(nanos_now)
    }

    /// The function called by `Timer`
    pub fn schedule_wake(&self, at: u64, waker: &task::Waker) {
        ...
        if queue.schedule_wake(at, waker) {
            let ticks_next_at = queue.next_expiration(self.now());
            let nanos_next_at = ticks_to_nanos(ticks_next_at);
            let nanos_next_interval = nanos_next_at - Self::nanos_now();
            let nanos_period = self.period_nanos.load(Ordering::Relaxed);
            if nanos_next_interval < nanos_period {
                // only set timer if it is less than the periodic interval
                set_oneshot_timer(nanos_next_at);
            }
        }
    }

    /// The function called in irq logic
    pub fn next_expiration(&self, period: u64) -> u64 {
        ...

        let ticks_next_expired = queue.next_expiration(ticks_now);
        let nanos_next_expired = ticks_to_nanos(ticks_next_expired);
        nanos_next_expired
    }
}
```

`queue.schedule_wake` will schedule the waker and return `true` if ones need to set alarm. But due to the `irq` logic, we only set global alarm if the `next_at` time is shorter than the given period time.

Inspect `Queue` logic, we can check that it will wake task sequentially(as `TaskRef` in Embassy).

```rust
impl Queue {
   pub fn next_expiration(&mut self, now: u64) -> u64 {
        self.retain(|p| {
            ...
            if expires <= now {
                // Timer expired, process task.
                embassy_executor::raw::wake_task(p);
                false
            } else {
                // Timer didn't yet expire, or never expires.
                next_expiration = min(next_expiration, expires);
                expires != u64::MAX
            }
        });
        ...
    }
}
```

We thus register the ffi provided by Embassy.
```rust
time_driver_impl!(static AX_DRIVER: AxDriver = AxDriver::new());
```

Rather in `axruntime`, we should modify the `irq` logic, we only need to call `next_expiration` to wake task:

```rust
#[cfg(feature = "irq")]
fn init_interrupt() {
	...
    fn update_timer() {
        ...
        #[cfg(feature = "embassy-timer")]
        {
            use axembassy::AxDriverAPI;
            let next_expired = AxDriverAPI::next_expiration(PERIODIC_INTERVAL_NANOS);
            if deadline >= next_expired {
                deadline = next_expired;
            }
        }
        unsafe { NEXT_DEADLINE.write_current_raw(deadline + PERIODIC_INTERVAL_NANOS) };
        axhal::time::set_oneshot_timer(deadline);
    }
}
```

## Usuage

We can therefore pack all above thing with proper export selection.

Beside on `executor`, we also select `time`, `futures` to provide async operations. And `cell` for initiation of static life time instance.

```rust
#[cfg(any(feature = "thread", feature = "single"))]
pub mod executor {
    use arceos_api::embassy_async as api;

    pub use api::AxExecutor as Executor;
    pub use embassy_executor::*;
    pub use embassy_futures::*;

    #[cfg(feature = "thread")]
    pub use api::{ax_block_on as block_on, ax_spawner as spawner};
}
```

However, a sad news is we can't export macro `task`, `main` independently due to the fixed import path of macro definition[^path]. So if we want to use it, we should import `embassy-executor` again. Hope there's a way around it.

```rust
[dependencies]
axstd = { workspace = true, features = [
	"multitask",
	"sched_cfs",
	"alloc",
], optional = true }
axasync = { workspace = true, features = ["time"] }

embassy-executor = { git = "https://github.com/embassy-rs/embassy", branch = "main", default-features = false }
```

To spawn async tasks is simple, we denote the macro and call `spawner()` to spawn it, you should be careful that wether it's `Send`able.

```rust
    for i in 1..NUM_TASKS {
        spawner()
            .spawn(async_tick(i, i * 1000, NUM_ITERS_TASKS))
            .unwrap();
    }
```

[^path]: The path is hard coded requiring `embassy_executor` no matter the import crate is.