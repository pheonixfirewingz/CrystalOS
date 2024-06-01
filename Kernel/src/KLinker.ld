OUTPUT_FORMAT("elf32-i386")
ENTRY(_start)

SECTIONS
{
    . = 2M; /* Start address */
    .text BLOCK(4K) : ALIGN(4K)
    {
        *(._start)
        *(.multiboot)
        *(.text)
        *(.text.*)
        PROVIDE(__etext = .);
    }
    .rodata BLOCK(4K) : ALIGN(4K)
    {
        *(.rodata)
        *(.rodata.*)
    }
    .data BLOCK(4K) : ALIGN(4K)
    {
        *(.data)
        *(.data.*)
        PROVIDE(__edata = .);
    }
    .bss BLOCK(4K) : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
        *(.bss.*)
        *(COMMON)
        PROVIDE(__end = .);
    }
    .debug_aranges 0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    .debug_info     0 : { *(.debug_info) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }
    .debug_pubtypes 0 : { *(.debug_pubtypes) }
    .debug_ranges   0 : { *(.debug_ranges) }
    /DISCARD/ :
    {
        *(.note.gnu.build-id)
        *(.dynamic)
        *(.interp)
    }
}