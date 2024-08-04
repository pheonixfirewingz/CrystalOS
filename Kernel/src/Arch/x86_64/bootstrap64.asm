bits 64
global _start64
global setPageDirectory
global getPageDirectory
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

setPageDirectory:
    mov rax, rdi
    mov cr3, rax
    ret

getPageDirectory:
    mov rax, cr3
    ret