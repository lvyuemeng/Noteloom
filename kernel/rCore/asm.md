## Basic Assembly

In `asm` code, there's no logic sequence restriction for definition.(you could define elsewhere)

### Register

RISC-V has 32 general purpose registers labeled `x0` to `x31`, and many symbolic names:

- `t0 -t6`: alias for `x5-x7`,`x28-x31`, caller-saved for no-need preserving data.
- `a0 - a7`: Argument for functions
- `s0 - s11`: Callee preserved across function calls(you must save them to stack before using them and restore before returning)
- `ra`: Return addr to return after function call(`ret` jump to `ra`)
- `sp`: Stack ptr track current position in memory for temporary data(hold local vars, return addr, saved regs)

### Instructions

- `ld`(load data):
  - `ld a0, 8(sp)`: Load 8 bytes from memory address `sp + 8` into register `a0`.
- `sd`(store data):
  - `sd ra, 0(sp)`: Store 8 bytes from `ra` into memory address `sp + 0`.
- `la`(load addr):
  - `la sp, boot_stack_top`: Load the addr of `boot_stack_top` into `sp`
- `call`:
  - `call rust_main`: Jump to `rust_main` and save return addr in `ra`
- `ret`:
  - `ret`: Jump to return addr of `ra`
- `<offset-number>(base)`: A register plus a offset (s.t. `8(a0)` as `a0 + 8`)
- `addi`: Add immediate value to register.(s.t. `addi sp, sp, -16` will be `sp = sp - 16`)
- `sub`: Do as `addi` but subtract. (s.t. `sub a2 a1 a0` be `a2 = a1 - a0`)
- `.set`: assign a symbol.(s.t. `.set n, 0` be `let n = 0`)
- `.rept`: repeat a block of code.
```
.rept 3
    nop  # Insert 3 `nop` instructions
.endr
```

#### CSR

- `csrrw`: CSR Read & Write (s.t. `csrrw rd, csr, rs` be read `csr` to `rd` write `rs` to `csr`)

- `csrr`: CSR Read (s.t. `csrr rd, csr` (equivalent to `csrrw rd, csr, x0`))

- `csrw`: CSR Write (s.t. `csrw csr, rs` (equivalent `csrrw x0, csr, rs`))

- `sret`: Supervisor return(s.t. return and update `CSR` related state)

- `mstatus`: Machine Status Register; Global interrupt enable, privilege mode.

- `mepc`: Machine Exception PC; PC to return to after an exception.

- `mcause`: Machine Cause Register; Cause of an exception/interrupt.

- `mtvec`: Machine Trap Vector; Address of trap handler.

- `mscratch`: Machine Scratch Register; Temporary storage for exception handlers.


#### Macro

```
.altmacro          # Enable advanced macro syntax
.macro macro_name arg1 arg2 ...
    <code using \arg1 or %n>
.endm
```

Example:
```
.altmacro
.macro SAVE_SN n
    sd s\n, (\n+2)*8(a0)  # Save s{n} to a0 + (n+2)*8
.endm

.set n, 0
.rept 12
	SAVE_SN %n   # For n=0 to 11, expands to SAVE_SN 0, SAVE_SN 1, etc.
.endr
```
  
### Memory Layout

- `.align <number>`: align data in memory with `2^n` bytes.

- `.sections`: tell linker how to organize data in memory.
  - `.text`: executable code(like `__switch`)
    - `.text.entry`: subsection as entry point
  - `.data`: initialized static data 
	- `.data.stack`: subsection for stack memory
  - `.bss`: uninitialized memory for stack(only preserved space)
  - `.<verb>.<label>`: symbolic nomination for above `<verb>` as a section (like `.text.entry`)

- `.globl`/`.global`: Makes a symbol (label) visible to the linker for Rust or C code.

- `<label-name>:`: define a symbolic name for a memory layout(like `_num_app:`)

**Memory**:

- `.space`: fill uninitialized space(like `space 1024`)

- `.quad`: store 64-bit int or addr in memory layout.(like `.quad 7`)

- `.incbin`: embed binary file in memory layout.(like `".incbin "../user/build/bin/ch2b_bad_address.bin"`)

In RISC-V, stacks grow from higher addr to lower addr(push data will decrease `sp`), so **syntax** will be logic consistent as the **memory layout**.

Example:
```
.section .text.entry     # Start of the "entry" code section
.globl _start            # Make _start visible to the linker
_start:                  # Entry point of the program
    la sp, boot_stack_top  # Load address of boot_stack_top into sp
    call rust_main       # Call rust_main (return address saved to ra)

.section .bss.stack      # Uninitialized stack memory section
.globl boot_stack_lower_bound
boot_stack_lower_bound:  # Label for the start of the stack space
    .space 4096 * 16     # Reserve 16 pages (64KB) of empty space
.globl boot_stack_top
boot_stack_top:          # Label for the top of the stack
```



