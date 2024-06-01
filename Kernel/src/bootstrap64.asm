bits 64
global _start64
extern kernel_main
section .text

_start64:
    mov ax, 0
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    call kernel_main
Loop:
    hlt
    jmp Loop