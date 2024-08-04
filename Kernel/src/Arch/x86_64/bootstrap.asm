bits 32
extern _start64
%define MULTIBOOT_PAGE_ALIGN                    0x00000001
%define MULTIBOOT_MEMORY_INFO                   0x00000002
%define MULTIBOOT_HEADER_FLAGS                  MULTIBOOT_PAGE_ALIGN | MULTIBOOT_MEMORY_INFO
section .multiboot
align 4
dd 0x1BADB002                          ; Magic number
dd MULTIBOOT_HEADER_FLAGS            ; Flags (bit 0, 1, and 6 set)
dd -(0x1BADB002 + (MULTIBOOT_HEADER_FLAGS)) ; Checksum
section .text
global _start
global print_string
global wipe_screen
wipe_screen:
    xor eax, eax        ; Clear EAX register
    mov edi, 0xb8000    ; Set destination pointer to VGA buffer address
    mov ecx, 80*25      ; Set loop counter to number of characters on screen (80 columns * 25 rows)
.fill_loop:
    mov word [edi], ax  ; Store space character (ASCII 32) and attribute (0) in VGA buffer
    add edi, 2          ; Move to next character in VGA buffer
    loop .fill_loop     ; Repeat until all characters are filled with spaces
    ret

print_string:
    mov ah, 0x0F    ; Attribute: white text on black background
    xor ebx, ebx    ; ebx = 0, to use it for offset calculation
.loop:
    lodsb           ; Load next byte from string into AL, incrementing esi
    test al, al    ; Check for null terminator
    jz .done        ; If null terminator, we're done
    mov word [0xb8000 + ebx], ax  ; Write character and attribute to VGA buffer
    add ebx, 2      ; Increment offset by 2 (each character takes 2 bytes)
    jmp .loop       ; Repeat for next character
.done:
    ret

_start:
    mov [multiboot_info_ptr], ebx
    push eax
    push ebx
    call wipe_screen
    pop ebx
    pop eax
    ; check multiboot
    cmp eax, 0x36d76289
    je .is_multiboot
    ; check multiboot2
    cmp eax, 0x2badb002
    ; error if is not multiboot2
    jne .multiboot
.is_multiboot:
    ; set up the stack
    mov esp, stack_top
    mov eax, 0x01
    cpuid
    ; check if SSE is supported
    test edx, 1<<25
    jz .sse
    ; enable SSE
    mov eax, cr0
    and ax, 0xFFFB		;clear coprocessor emulation CR0.EM
    or ax, 0x2			;set coprocessor monitoring  CR0.MP
    mov cr0, eax
    mov eax, cr4
    or ax, 3 << 9		;set CR4.OSFXSR and CR4.OSXMMEXCPT at the same time
    mov cr4, eax
    mov eax, 0x80000000    ; Set the A-register to 0x80000000.
    cpuid                  ; CPU identification.
    cmp eax, 0x80000001    ; Compare the A-register with 0x80000001.
    jb .cpuid_extended         ; It is less, there is no long mode.
    mov eax, 0x80000001    ; Set the A-register to 0x80000001.
    cpuid                  ; CPU identification.
    test edx, 1 << 29      ; Test if the LM-bit, which is bit 29, is set in the D-register.
    jz .long_mode         ; They aren't, there is no long mode.
    call setup_page_tables
	call enable_paging
    lgdt [gdt64.pointer]        ; Load the 64-bit global descriptor table.
    jmp gdt64.code_segment:_start64
.multiboot:
    mov esi, message_multiboot
    jmp .Linvalid
.sse:
    mov esi, message_sse
    jmp .Linvalid
.cpuid_extended:
    mov esi, message_cpuid_extended
    jmp .Linvalid
.long_mode:
    mov esi, message_long_mode
    jmp .Linvalid
.Linvalid:
    call print_string        ; Call the print_string function
    add esp, 8               ; Adjust the stack pointer after pushing the arguments
    cli                      ; Disable interrupts
    hlt                      ; Halt the processor

setup_page_tables:
	mov eax, page_table_l3
	or eax, 0b11 ; present, writable
	mov [page_table_l4], eax
	mov eax, page_table_l2
	or eax, 0b11 ; present, writable
	mov [page_table_l3], eax
	mov ecx, 0 ; counter
.loop:
	mov eax, 0x200000 ; 2MiB
	mul ecx
	or eax, 0b10000011 ; present, writable, huge page
	mov [page_table_l2 + ecx * 8], eax
	inc ecx ; increment counter
	cmp ecx, 512 ; checks if the whole table is mapped
	jne .loop ; if not, continue
	ret

enable_paging:
	mov eax, page_table_l4
	mov cr3, eax
	mov eax, cr4
	or eax, 1 << 5
	mov cr4, eax
	mov ecx, 0xC0000080
	rdmsr
	or eax, 1 << 8
	wrmsr
	mov eax, cr0
	or eax, 1 << 31
	mov cr0, eax
	ret
section .bss
align 16
stack_base:
    resb 1024*32
stack_top:
align 4096
page_table_l4:
	resb 4096
page_table_l3:
	resb 4096
page_table_l2:
	resb 4096
section .rodata
message_multiboot: 
    db 'boot failed in 32bit stage(no multiboot)', 0x00
message_passed: 
    db 'boot in 32bit stage(passed)', 0x00
message_sse: 
    db 'boot failed in 32bit stage(sse not supported)', 0x00
message_cpuid_extended:
    db 'boot failed in 32bit stage(cpuid extended not supported)', 0x00
message_long_mode:
    db 'boot failed in 32bit stage(long mode not supported)', 0x00
gdt64:
	dq 0 ; zero entry
.code_segment: equ $ - gdt64
	dq (1 << 43) | (1 << 44) | (1 << 47) | (1 << 53) ; code segment
.pointer:
	dw $ - gdt64 - 1 ; length
	dq gdt64 ; address
section .data
align 8
global multiboot_info_ptr
multiboot_info_ptr: resq 1 