pub const multiboot_uint8_t = u8;
pub const multiboot_uint16_t = c_ushort;
pub const multiboot_uint32_t = c_uint;
pub const multiboot_uint64_t = c_ulonglong;
pub const struct_multiboot_header = extern struct {
    magic: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    flags: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    checksum: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    header_addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    load_addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    load_end_addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    bss_end_addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    entry_addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    mode_type: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    width: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    height: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    depth: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
};
pub const struct_multiboot_aout_symbol_table = extern struct {
    tabsize: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    strsize: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    reserved: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
};
pub const multiboot_aout_symbol_table_t = struct_multiboot_aout_symbol_table;
pub const struct_multiboot_elf_section_header_table = extern struct {
    num: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    size: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    shndx: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
};
pub const multiboot_elf_section_header_table_t = struct_multiboot_elf_section_header_table;
const union_unnamed_1 = extern union {
    aout_sym: multiboot_aout_symbol_table_t,
    elf_sec: multiboot_elf_section_header_table_t,
};
const struct_unnamed_3 = extern struct {
    framebuffer_palette_addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    framebuffer_palette_num_colors: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
};
const struct_unnamed_4 = extern struct {
    framebuffer_red_field_position: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
    framebuffer_red_mask_size: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
    framebuffer_green_field_position: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
    framebuffer_green_mask_size: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
    framebuffer_blue_field_position: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
    framebuffer_blue_mask_size: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
};
const union_unnamed_2 = extern union {
    unnamed_0: struct_unnamed_3,
    unnamed_1: struct_unnamed_4,
};
pub const struct_multiboot_info = extern struct {
    flags: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    mem_lower: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    mem_upper: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    boot_device: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    cmdline: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    mods_count: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    mods_addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    u: union_unnamed_1 = @import("std").mem.zeroes(union_unnamed_1),
    mmap_length: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    mmap_addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    drives_length: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    drives_addr: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    config_table: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    boot_loader_name: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    apm_table: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    vbe_control_info: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    vbe_mode_info: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    vbe_mode: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    vbe_interface_seg: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    vbe_interface_off: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    vbe_interface_len: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    framebuffer_addr: multiboot_uint64_t = @import("std").mem.zeroes(multiboot_uint64_t),
    framebuffer_pitch: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    framebuffer_width: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    framebuffer_height: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    framebuffer_bpp: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
    framebuffer_type: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
    unnamed_0: union_unnamed_2 = @import("std").mem.zeroes(union_unnamed_2),
};
pub const multiboot_info_t = struct_multiboot_info;
pub const struct_multiboot_color = extern struct {
    red: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
    green: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
    blue: multiboot_uint8_t = @import("std").mem.zeroes(multiboot_uint8_t),
};
pub const struct_multiboot_mmap_entry = extern struct {
    size: multiboot_uint32_t align(1) = @import("std").mem.zeroes(multiboot_uint32_t),
    addr: multiboot_uint64_t align(1) = @import("std").mem.zeroes(multiboot_uint64_t),
    len: multiboot_uint64_t align(1) = @import("std").mem.zeroes(multiboot_uint64_t),
    type: multiboot_uint32_t align(1) = @import("std").mem.zeroes(multiboot_uint32_t),
};
pub const multiboot_memory_map_t = struct_multiboot_mmap_entry;
pub const struct_multiboot_mod_list = extern struct {
    mod_start: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    mod_end: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    cmdline: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    pad: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
};
pub const multiboot_module_t = struct_multiboot_mod_list;
pub const struct_multiboot_apm_info = extern struct {
    version: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    cseg: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    offset: multiboot_uint32_t = @import("std").mem.zeroes(multiboot_uint32_t),
    cseg_16: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    dseg: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    flags: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    cseg_len: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    cseg_16_len: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t),
    dseg_len: multiboot_uint16_t = @import("std").mem.zeroes(multiboot_uint16_t)
};
pub const MULTIBOOT_HEADER = @as(c_int, 1);
pub const MULTIBOOT_SEARCH = @as(c_int, 8192);
pub const MULTIBOOT_HEADER_ALIGN = @as(c_int, 4);
pub const MULTIBOOT_HEADER_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1BADB002, .hex);
pub const MULTIBOOT_BOOTLOADER_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x2BADB002, .hex);
pub const MULTIBOOT_MOD_ALIGN = @as(c_int, 0x00001000);
pub const MULTIBOOT_INFO_ALIGN = @as(c_int, 0x00000004);
pub const MULTIBOOT_PAGE_ALIGN = @as(c_int, 0x00000001);
pub const MULTIBOOT_MEMORY_INFO = @as(c_int, 0x00000002);
pub const MULTIBOOT_VIDEO_MODE = @as(c_int, 0x00000004);
pub const MULTIBOOT_AOUT_KLUDGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const MULTIBOOT_INFO_MEMORY = @as(c_int, 0x00000001);
pub const MULTIBOOT_INFO_BOOTDEV = @as(c_int, 0x00000002);
pub const MULTIBOOT_INFO_CMDLINE = @as(c_int, 0x00000004);
pub const MULTIBOOT_INFO_MODS = @as(c_int, 0x00000008);
pub const MULTIBOOT_INFO_AOUT_SYMS = @as(c_int, 0x00000010);
pub const MULTIBOOT_INFO_ELF_SHDR = @as(c_int, 0x00000020);
pub const MULTIBOOT_INFO_MEM_MAP = @as(c_int, 0x00000040);
pub const MULTIBOOT_INFO_DRIVE_INFO = @as(c_int, 0x00000080);
pub const MULTIBOOT_INFO_CONFIG_TABLE = @as(c_int, 0x00000100);
pub const MULTIBOOT_INFO_BOOT_LOADER_NAME = @as(c_int, 0x00000200);
pub const MULTIBOOT_INFO_APM_TABLE = @as(c_int, 0x00000400);
pub const MULTIBOOT_INFO_VBE_INFO = @as(c_int, 0x00000800);
pub const MULTIBOOT_INFO_FRAMEBUFFER_INFO = @as(c_int, 0x00001000);
pub const MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED = @as(c_int, 0);
pub const MULTIBOOT_FRAMEBUFFER_TYPE_RGB = @as(c_int, 1);
pub const MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT = @as(c_int, 2);
pub const MULTIBOOT_MEMORY_AVAILABLE = @as(c_int, 1);
pub const MULTIBOOT_MEMORY_RESERVED = @as(c_int, 2);
pub const MULTIBOOT_MEMORY_ACPI_RECLAIMABLE = @as(c_int, 3);
pub const MULTIBOOT_MEMORY_NVS = @as(c_int, 4);
pub const MULTIBOOT_MEMORY_BADRAM = @as(c_int, 5);
pub const multiboot_header = struct_multiboot_header;
pub const multiboot_aout_symbol_table = struct_multiboot_aout_symbol_table;
pub const multiboot_elf_section_header_table = struct_multiboot_elf_section_header_table;
pub const multiboot_info = struct_multiboot_info;
pub const multiboot_color = struct_multiboot_color;
pub const multiboot_mmap_entry = struct_multiboot_mmap_entry;
pub const multiboot_mod_list = struct_multiboot_mod_list;
pub const multiboot_apm_info = struct_multiboot_apm_info;