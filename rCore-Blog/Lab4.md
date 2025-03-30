## Lab4

We don't want a fixed physical addr for allocation, rather, we want a unified abstract interface for dynamic memory layout for app storage. We call it **Virtual Address**

Safety: Every app will be allocated in its own virtual memory space, so each can't interfere others.

Efficiency: Every app can coexist in same time without demand of reading outer peripherals to switch app.(With development of memory size)

We need **MMU**(Memory Management Unit) to achieve **Address Translation** for interview from virtual to physical.

Different designs occur.

### Segment Design

![alt text](/rCore-Blog/assets/Lab4-1.png)

Each app exist in one fixed slot for one segment as $[0,bound)$, with a linear map by **MMU**.

Problem: Wasteful and inflexible

We may want a different linear map for each app， for example, its allocation for heap, data, code etc... So we can dispatch memory in more finer style, but it can't resolve the problem because now even slot is dynamically allocated, it may still exist some free memory too small to reuse, cause the **External Fragment** rather than **Internal Fragment** which is the problem due to fixed slot.

### Paging Design

![alt text](/rCore-Blog/assets/Lab4-2.png)
We could set a **Protection bit** as `r` for read, `w` for write, `x` for execution.

Another way is to inverse our mind, rather take a slot on memory, we take slot on **MMU**, it can map its slot(now we call it **Page**) for real physical memory layout. To adjust, we can take slice for **Page** to form **Frame** which is a smaller unit to suit physical memory layout, each app can take many **Page Number** for a **Page Table**, record the map.


## Page Design in RISC-V

![alt text](/rCore-Blog/assets/Lab4-3.png)

**SV39** only use lower 39 bits rather whole 64 bits in design even bit width is 64 bits(it's a fairly large amount!)

In a address, $[11:0]$ called **Page Offset**, and $[38:12]$ is the **VPN** which will be used for location of page and use offset to direct in one page(with 4KiB in one page).

We should modify `satp` to open Paging for S and U-level memory.

```rust
const PAGE_SIZE:usize = 4096
const PAGE_SIZE_BIT: usize = 12
```



