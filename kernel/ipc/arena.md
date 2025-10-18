+++
date = '2025-10-18T19:12:58+08:00'
draft = false
title = 'Arena Spec'
tag = ["arena", "ipc", "allocator"]
author = ["nostalgia"]
+++

# Arena

## Behavoir

```bash
Time 0: Arena created  
  - Main memory: [empty, capacity=1000]  
  - Freelist: [sentinel only]  
  - Allocation: Uses fast path ✓  
  
Time 1: Allocate 300 bytes  
  - Main memory: [used=300, remaining=700]  
  - Freelist: [sentinel only]  
  - Allocation: Uses fast path ✓  
  
Time 2: Allocate 500 bytes  
  - Main memory: [used=800, remaining=200]  
  - Freelist: [sentinel only]  
  - Allocation: Uses fast path ✓  
  
Time 3: Drop the 300-byte allocation  
  - Main memory: [used=800, remaining=200]  
  - Freelist: [sentinel → 300-byte segment]  
  - Now freelist has 1 usable segment!  
  
Time 4: Allocate 400 bytes (main memory too small)  
  - Fast path fails (want=1200 > cap=1000)  
  - Slow path: Uses 300-byte segment from freelist ✓  
```

## Core Data Structures

### 1. Memory Region

- A contiguous block of memory (from heap allocation, file mapping, or anonymous mapping)
Divided into:

```
Reserved Space → Metadata/Header → Allocation Space
```

- **Base pointer** anchors all address calculations using relative offsets.

### 2. Header (Allocation State)

- Tracks current allocation position (monotonically increasing)

- Stores freelist sentinel (entry point to recycled memory)

- Maintains statistics (discarded bytes, minimum segment size)

- Uses atomic operations for thread-safe variant, plain integers for single-threaded variant

### 3. Freelist (Recycled Memory)

- Lock-free linked list of deallocated segments
- Each node stored in-place at the deallocated location
- Three strategies:
  - None: No recycling, memory is discarded
  - Optimistic: Descending size order (largest-first)
  - Pessimistic: Ascending size order (best-fit)

### 4. Segment Node

- Compact representation (`64 bits`): upper `32 bits = size`, `lower 32 bits = next offset`
- Stored directly in deallocated memory regions
- Sentinel node uses special marker values to indicate empty list

## Allocation Logic Flow

### Phase 1: Fast Path (Main Memory)

- Load current allocation position from header

- Calculate new position = current + requested_size

- If new position ≤ capacity:
  - Atomically update allocation position (thread-safe) or directly increment (single-threaded)

  - Return offset to allocated memory
 Otherwise, proceed to **Phase 2**

### Phase 2: Slow Path (Freelist)

Check freelist strategy:

- None: Return error immediately
- Optimistic/Pessimistic: Search freelist

For Optimistic:

- Take largest segment (head of list)
- If large enough, allocate from it
- Return remainder to freelist if viable

For Pessimistic:

- Search for smallest sufficient segment
- Allocate from best-fit segment
- Return remainder to freelist if viable

Retry up to `max_retries` times (for thread-safe variant)

Return error if no suitable segment found

## Deallocation Logic Flow

### Phase 1: Fast Return (Main Memory)

- Check if deallocated region is at end of allocated space
- If yes: Simply decrement allocation position (instant reclaim)
- Otherwise, proceed to Phase 2

### Phase 2: Freelist Insertion

Check freelist strategy:

- None: Mark as discarded, no recycling.
- Optimistic: Insert in descending size order
- Pessimistic: Insert in ascending size order

Validate segment is large enough for metadata

Create segment node in-place at deallocated location

Insert into freelist using lock-free algorithm (CAS operations)

## Key Design Principles

### 1. Offset-Based Addressing

- All memory references use offsets from base pointer
- Enables cross-process sharing (offsets remain valid across different virtual address spaces)
- Supports memory backend changes (truncation, remapping)

### 2. Monotonic Main Memory

- Main allocation space only grows, never shrinks during normal operation
- Provides blazing-fast allocation when space available
- Deallocation can reclaim end-of-space memory instantly

### 3. Lock-Free Concurrency

- Thread-safe variant uses atomic operations throughout
- No mutexes or locks in allocation/deallocation paths
- Exponential backoff on contention
- Retry mechanism for transient failures

### 4. Separation of Concerns

- Memory backend (`Vec/mmap`) handles storage
- Header handles allocation state
- Freelist handles recycling
- Arena coordinates all components

### Memory Layout Abstraction

```bash
[Base Ptr] → [Reserved] → [Metadata] → [Header] → [Data Offset] → [Allocation Space]  
                                                                    ↑  
                                                            Header.allocated points here initially  
```

All allocations happen at `offsets ≥ data_offset`, with the header tracking the current end of allocated space.

### State Transitions

Arena Lifecycle:

- Initialization: Empty freelist (sentinel only), allocation position = data_offset
- Active Use: Allocations from main memory, deallocations build freelist
- Fragmented: Main memory full, allocations from freelist
- Cleanup: Discard freelist or drop arena (reference-counted cleanup)

Segment Lifecycle:

- Allocated: Memory in use by application
- Deallocated: Either returned to main memory or added to freelist
- Recycled: Removed from freelist for new allocation
- Discarded: Marked as unusable (too small or freelist disabled)
