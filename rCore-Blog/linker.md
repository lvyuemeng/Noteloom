## Linker

### Syntax:

- Declaration
```
OUTPUT_ARCH(riscv)    /* 指定目标架构为 RISC-V */
ENTRY(_start)         /* 明确入口点为 _start 符号 */
```
- `OUTPUT_ARCH`: Architecture defined.
- `ENTRY`: Define symbolic name of `ENTRY`, usually defined as `_start` as convention.

- Basic Structure:
```
SECTIONS {
	// definition
	s<name> = .;
	e<name> = .;
	. = ALIGN(4K);
}
```
- `SECTIONS`: Main skeleton, define the layout of memory.
- `.`: Current **Location Counter**, output current addr.

- `s/e<name>`: means start(e) or end(e) of segment of `<name>`, s.t. `skernel`, `stext`, `etext` etc... but they are exception of this rule, rather as `small data` we will exposit in later.

- `. = ALIGN(<number>K)`: align current `.` with specified `<number>KB`, for example: `Sv39` of RISC-V need `4KB` alignment criterion.
---

- Load:
```
. = BASE_ADDRESS;
```
- BASE_ADDRESS: Usually defined as `0x8000_0000`(RISC-V QEMU convention).
- `.`: When it defined, it will arrange successively.

---

- `.text`(Code):
```
.text : {
    *(.text.entry)  /* 强制将 _start 函数放在最前面 */
    *(.text*)       /* 合并所有输入文件的 .text* 段 */
}
```
- `.text.entry`: Corresponding `_start` as entry.(Defined in Rust as `#[no_mangle] pub extern "C" fn _start()`)
- `*(.text*)`: Wildcard `*` will match all file with `.text` s.t `.text.foo`

---

- `.rodata`(Read Only Data)(R-X):
```
.rodata : { 
	*(.rodata .rodata.*)   /* 匹配所有 .rodata 和 .rodata.xxx 段 */
	*(.srodata .srodata.*) /* 匹配所有 .srodata 和 .srodata.xxx 段 */
}  /* 合并所有只读数据（如字符串常量） */
```
- `*(.rodata*)`: Match data s.t. `&str` or `const` in Rust.
- `.srodata`: **Small Read-Only Data** only for RISC-V.(usually access by `gp`(global ptr))
---

- `.data`(Initiated Data)(RW-):
```
.data : { *(.data*) }  /* 已初始化的全局变量（如 static mut X = 1;） */
```

- `*(.data*)`: Match data s.t. `static mut X = 1` in Rust.

---

- `.bss`(Uninitiated Data):
```
.bss : { 
    sbss = .;          /* 记录 .bss 段起始地址 */
	*(.bss.stack)		/* 内核专用段 */ 
    *(.bss*)           /* 合并所有 .bss 段 */
    *(COMMON)          /* 合并 COMMON 段（某些编译器用于未初始化全局变量） */
    ebss = .;          /* 记录 .bss 段结束地址 */
}
```
- `.bss.stack`: custom segment, used for Kernel stack allocation.

```rust
// 清零 .bss 段（通常在 _start 中调用）
unsafe {
    let sbss = &sbss as *const _ as usize;
    let ebss = &ebss as *const _ as usize;
    for addr in sbss..ebss {
        (addr as *mut u8).write_volatile(0);
    }
}
```

---

- `/DISCARD/`(discard ...):
```
/DISCARD/ : { *(.eh_frame) }  /* 丢弃调试帧信息（减少内核体积） */
```
- `.eh_frame`: used for exception handling, usually useless in bare-metal.
- Less binary size.


