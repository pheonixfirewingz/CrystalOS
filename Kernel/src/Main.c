#include <MutliBoot.h>
#include <KTypes.h>
#include <Printf.h>
#include <Memory/MemoryManager.h>
i32 memset(void *s, i32 c, u32 n)
{
    i8 *p = (i8 *)s;
    while (n-- > 0)
        *p++ = c;
    return 0;
}

u8 is_bit_set(u32 value, u32 bit)
{
    return (value & (1 << bit)) != 0;
}

extern u32 *multiboot_info_ptr;

void print_multiboot_info(const multiboot_info_t *info)
{
    printf("Multiboot Information:\n");
    printf("  Flags: 0x%x\n", info->flags);
    printf ("mem_lower = %uKB, mem_upper = %uKB\n", (unsigned) info->mem_lower, (unsigned) info->mem_upper);
    printf("  Boot Device: 0x%x\n", info->boot_device);
    printf("  Command Line: 0x%x\n", info->cmdline);
    printf("  Modules Count: %u\n", info->mods_count);
    printf("  Modules Address: 0x%x\n", info->mods_addr);
    printf("  AOUT Symbol Table: 0x%x\n", info->u.aout_sym);
    printf("  ELF Section Header Table: 0x%x\n", info->u.elf_sec);
    // loop through memory map entries
    multiboot_memory_map_t *mmap;
    printf("mmap_addr = 0x%x, mmap_length = 0x%x\n", (unsigned)info->mmap_addr, (unsigned)info->mmap_length);
    for (mmap = (multiboot_memory_map_t *)info->mmap_addr; (unsigned long)mmap < info->mmap_addr + info->mmap_length;
         mmap = (multiboot_memory_map_t *)((unsigned long)mmap + mmap->size + sizeof(mmap->size)))
    {
        printf(" size = 0x%x (%u MB), base_addr = 0x%x%08x,"
               " length = 0x%x%08x, type = ",
               (unsigned)mmap->size,
               (unsigned)(mmap->len / (1024 * 1024)),   // Size in MB
               (unsigned)(mmap->addr >> 32),
               (unsigned)(mmap->addr & 0xffffffff),
               (unsigned)(mmap->len >> 32),
               (unsigned)(mmap->len & 0xffffffff));
        switch (mmap->type)
        {
        case MULTIBOOT_MEMORY_AVAILABLE:
            printf("Available\n");
            break;
        case MULTIBOOT_MEMORY_RESERVED:
            printf("Reserved\n");
            break;
        case MULTIBOOT_MEMORY_ACPI_RECLAIMABLE:
            printf("ACPI reclaimable\n");
            break;
        case MULTIBOOT_MEMORY_NVS:
            printf("NVS\n");
            break;
        case MULTIBOOT_MEMORY_BADRAM:
            printf("Bad RAM\n");
            break;
        default:
            printf("Unknown\n");
            break;
        }
    }
    printf("  Drives Length: %u\n", info->drives_length);
    printf("  Drives Address: 0x%x\n", info->drives_addr);
    printf("  Configuration Table: 0x%x\n", info->config_table);
    printf("  Boot Loader Name: %s\n", info->boot_loader_name);
    printf("  APM Table: 0x%x\n", info->apm_table);
    printf("  VBE Control Information: 0x%x\n", info->vbe_control_info);
    printf("  VBE Mode Information: 0x%x\n", info->vbe_mode_info);
    printf("  VBE Mode: 0x%x\n", info->vbe_mode);
    printf("  VBE Interface Segment: 0x%x\n", info->vbe_interface_seg);
    printf("  VBE Interface Offset: 0x%x\n", info->vbe_interface_off);
    printf("  VBE Interface Length: 0x%x\n", info->vbe_interface_len);
    printf("  Framebuffer Address: 0x%lx\n", (unsigned long)info->framebuffer_addr);
    printf("  Framebuffer Pitch: %u\n", info->framebuffer_pitch);
    printf("  Framebuffer Width: %u\n", info->framebuffer_width);
    printf("  Framebuffer Height: %u\n", info->framebuffer_height);
    printf("  Framebuffer BPP: %u\n", info->framebuffer_bpp);
    printf("  Framebuffer Type: %u\n", info->framebuffer_type);
    if (info->framebuffer_type == 0)
    {
        printf("    Palette Address: 0x%x\n", info->framebuffer_palette_addr);
        printf("    Palette Num Colors: %u\n", info->framebuffer_palette_num_colors);
    }
    else
    {
        printf("    Red Field Position: %u\n", info->framebuffer_red_field_position);
        printf("    Red Mask Size: %u\n", info->framebuffer_red_mask_size);
        printf("    Green Field Position: %u\n", info->framebuffer_green_field_position);
        printf("    Green Mask Size: %u\n", info->framebuffer_green_mask_size);
        printf("    Blue Field Position: %u\n", info->framebuffer_blue_field_position);
        printf("    Blue Mask Size: %u\n", info->framebuffer_blue_mask_size);
    }
}

#define outb(port,data) __asm__ volatile("outb %b0, %w1" : : "a"(data), "Nd"(port) : "memory")

void kernel_main()
{
    memset((u16 *)0xB8000, ((u16)' ' | (u16)(15 | 0 << 4) << 8), 80 * 25 * 2);
    outb(0x3f8 + 1, 0x00);
    outb(0x3f8 + 3, 0x80);
    outb(0x3f8 + 0, 0x03);
    outb(0x3f8 + 1, 0x00);
    outb(0x3f8 + 3, 0x03);
    outb(0x3f8 + 2, 0xC7);
    outb(0x3f8 + 4, 0x0B);
    multiboot_info_t *info = (multiboot_info_t *)multiboot_info_ptr;
    if (!(info->flags & (1 << 0) && info->flags & (1 << 1)))
    {
        printf("Multiboot information not found!\n");
    }
    else
    {
        print_multiboot_info(info);
    }
    memMamInit(info);
}