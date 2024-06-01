.section .text
.globl setup_page_tables
.type setup_page_tables, @function

setup_page_tables:
    movl $page_table_l3, %eax
    orl $0b11, %eax
    movl %eax, page_table_l4
    
    movl $page_table_l2, %eax
    orl $0b11, %eax
    movl %eax, page_table_l3

    movl $0, %ecx
.loop:
    movl $0x200000, %eax
    mull %ecx
    orl $0b10000011, %eax
    movl %eax, page_table_l2(,%ecx,8)

    incl %ecx
    cmpl $512, %ecx
    jne .loop

    ret

.section .bss
.align 4096
page_table_l4:
    .space 4096
page_table_l3:
    .space 4096
page_table_l2:
    .space 4096