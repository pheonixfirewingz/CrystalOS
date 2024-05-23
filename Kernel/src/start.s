/* Declare constants for the multiboot header. */
.set ALIGN,      1<<0           /* align loaded modules on page boundaries */
.set MEMINFO,    1<<1           /* provide memory map */
.set MMAP,       1<<6           /* provide memory map (v2) */
.set DRIVE_INFO, 1<<2           /* provide drive info */
.set CONFIG,     1<<3           /* provide boot config table */
.set LOADER_NAME,1<<9           /* provide boot loader name */
.set AOUT_SYMS,  1<<4           /* provide aout symbol table */
.set ELF_SYMS,   1<<5           /* provide ELF symbol table */
.set FLAGS_ALL,  ALIGN | MEMINFO | MMAP | DRIVE_INFO | CONFIG | LOADER_NAME | AOUT_SYMS | ELF_SYMS
.set MAGIC,      0x1BADB002     /* 'magic number' lets bootloader find the header */
.set CHECKSUM,   -(MAGIC + FLAGS_ALL) /* checksum of above, to prove we are multiboot */

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:
.section .text
.global _start
.type _start, @function
_start:
	mov $stack_top, %esp
    push %eax    /* Multiboot magic */
    push %ebx    /* Multiboot info pointer */
	call kernel_main
	cli
1:	hlt
	jmp 1b
.size _start, . - _start