const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
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
const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):95:9
const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):101:9
const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):198:9
const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // (no file):220:9
const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):228:9
const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`"); // (no file):359:9
const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`"); // (no file):360:9
const __llvm__ = @as(c_int, 1);
const __clang__ = @as(c_int, 1);
const __clang_major__ = @as(c_int, 18);
const __clang_minor__ = @as(c_int, 1);
const __clang_patchlevel__ = @as(c_int, 5);
const __clang_version__ = "18.1.5 (https://github.com/ziglang/zig-bootstrap 1500b58191611f0d1965cf264016f28d5bcc1fd2)";
const __GNUC__ = @as(c_int, 4);
const __GNUC_MINOR__ = @as(c_int, 2);
const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
const __GXX_ABI_VERSION = @as(c_int, 1002);
const __ATOMIC_RELAXED = @as(c_int, 0);
const __ATOMIC_CONSUME = @as(c_int, 1);
const __ATOMIC_ACQUIRE = @as(c_int, 2);
const __ATOMIC_RELEASE = @as(c_int, 3);
const __ATOMIC_ACQ_REL = @as(c_int, 4);
const __ATOMIC_SEQ_CST = @as(c_int, 5);
const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
const __FPCLASS_SNAN = @as(c_int, 0x0001);
const __FPCLASS_QNAN = @as(c_int, 0x0002);
const __FPCLASS_NEGINF = @as(c_int, 0x0004);
const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
const __FPCLASS_POSZERO = @as(c_int, 0x0040);
const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
const __FPCLASS_POSINF = @as(c_int, 0x0200);
const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
const __VERSION__ = "Clang 18.1.5 (https://github.com/ziglang/zig-bootstrap 1500b58191611f0d1965cf264016f28d5bcc1fd2)";
const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
const __clang_literal_encoding__ = "UTF-8";
const __clang_wide_literal_encoding__ = "UTF-32";
const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
const __LITTLE_ENDIAN__ = @as(c_int, 1);
const _LP64 = @as(c_int, 1);
const __LP64__ = @as(c_int, 1);
const __CHAR_BIT__ = @as(c_int, 8);
const __BOOL_WIDTH__ = @as(c_int, 8);
const __SHRT_WIDTH__ = @as(c_int, 16);
const __INT_WIDTH__ = @as(c_int, 32);
const __LONG_WIDTH__ = @as(c_int, 64);
const __LLONG_WIDTH__ = @as(c_int, 64);
const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
const __SCHAR_MAX__ = @as(c_int, 127);
const __SHRT_MAX__ = @as(c_int, 32767);
const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __WCHAR_WIDTH__ = @as(c_int, 32);
const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __WINT_WIDTH__ = @as(c_int, 32);
const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
const __INTMAX_WIDTH__ = @as(c_int, 64);
const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
const __SIZE_WIDTH__ = @as(c_int, 64);
const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
const __UINTMAX_WIDTH__ = @as(c_int, 64);
const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
const __PTRDIFF_WIDTH__ = @as(c_int, 64);
const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
const __INTPTR_WIDTH__ = @as(c_int, 64);
const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
const __UINTPTR_WIDTH__ = @as(c_int, 64);
const __SIZEOF_DOUBLE__ = @as(c_int, 8);
const __SIZEOF_FLOAT__ = @as(c_int, 4);
const __SIZEOF_INT__ = @as(c_int, 4);
const __SIZEOF_LONG__ = @as(c_int, 8);
const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
const __SIZEOF_POINTER__ = @as(c_int, 8);
const __SIZEOF_SHORT__ = @as(c_int, 2);
const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
const __SIZEOF_SIZE_T__ = @as(c_int, 8);
const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
const __SIZEOF_WINT_T__ = @as(c_int, 4);
const __SIZEOF_INT128__ = @as(c_int, 16);
const __INTMAX_TYPE__ = c_long;
const __INTMAX_FMTd__ = "ld";
const __INTMAX_FMTi__ = "li";
const __UINTMAX_TYPE__ = c_ulong;
const __UINTMAX_FMTo__ = "lo";
const __UINTMAX_FMTu__ = "lu";
const __UINTMAX_FMTx__ = "lx";
const __UINTMAX_FMTX__ = "lX";
const __PTRDIFF_TYPE__ = c_long;
const __PTRDIFF_FMTd__ = "ld";
const __PTRDIFF_FMTi__ = "li";
const __INTPTR_TYPE__ = c_long;
const __INTPTR_FMTd__ = "ld";
const __INTPTR_FMTi__ = "li";
const __SIZE_TYPE__ = c_ulong;
const __SIZE_FMTo__ = "lo";
const __SIZE_FMTu__ = "lu";
const __SIZE_FMTx__ = "lx";
const __SIZE_FMTX__ = "lX";
const __WCHAR_TYPE__ = c_int;
const __WINT_TYPE__ = c_uint;
const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
const __CHAR16_TYPE__ = c_ushort;
const __CHAR32_TYPE__ = c_uint;
const __UINTPTR_TYPE__ = c_ulong;
const __UINTPTR_FMTo__ = "lo";
const __UINTPTR_FMTu__ = "lu";
const __UINTPTR_FMTx__ = "lx";
const __UINTPTR_FMTX__ = "lX";
const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
const __FLT16_HAS_DENORM__ = @as(c_int, 1);
const __FLT16_DIG__ = @as(c_int, 3);
const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
const __FLT16_MANT_DIG__ = @as(c_int, 11);
const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
const __FLT16_MAX_EXP__ = @as(c_int, 16);
const __FLT16_MAX__ = @as(f16, 6.5504e+4);
const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
const __FLT16_MIN_EXP__ = -@as(c_int, 13);
const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
const __FLT_HAS_DENORM__ = @as(c_int, 1);
const __FLT_DIG__ = @as(c_int, 6);
const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
const __FLT_HAS_INFINITY__ = @as(c_int, 1);
const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
const __FLT_MANT_DIG__ = @as(c_int, 24);
const __FLT_MAX_10_EXP__ = @as(c_int, 38);
const __FLT_MAX_EXP__ = @as(c_int, 128);
const __FLT_MAX__ = @as(f32, 3.40282347e+38);
const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
const __FLT_MIN_EXP__ = -@as(c_int, 125);
const __FLT_MIN__ = @as(f32, 1.17549435e-38);
const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
const __DBL_HAS_DENORM__ = @as(c_int, 1);
const __DBL_DIG__ = @as(c_int, 15);
const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
const __DBL_HAS_INFINITY__ = @as(c_int, 1);
const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
const __DBL_MANT_DIG__ = @as(c_int, 53);
const __DBL_MAX_10_EXP__ = @as(c_int, 308);
const __DBL_MAX_EXP__ = @as(c_int, 1024);
const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
const __DBL_MIN_EXP__ = -@as(c_int, 1021);
const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
const __LDBL_HAS_DENORM__ = @as(c_int, 1);
const __LDBL_DIG__ = @as(c_int, 18);
const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
const __LDBL_MANT_DIG__ = @as(c_int, 64);
const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
const __LDBL_MAX_EXP__ = @as(c_int, 16384);
const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
const __POINTER_WIDTH__ = @as(c_int, 64);
const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
const __WINT_UNSIGNED__ = @as(c_int, 1);
const __INT8_TYPE__ = i8;
const __INT8_FMTd__ = "hhd";
const __INT8_FMTi__ = "hhi";
const __INT8_C_SUFFIX__ = "";
const __INT16_TYPE__ = c_short;
const __INT16_FMTd__ = "hd";
const __INT16_FMTi__ = "hi";
const __INT16_C_SUFFIX__ = "";
const __INT32_TYPE__ = c_int;
const __INT32_FMTd__ = "d";
const __INT32_FMTi__ = "i";
const __INT32_C_SUFFIX__ = "";
const __INT64_TYPE__ = c_long;
const __INT64_FMTd__ = "ld";
const __INT64_FMTi__ = "li";
const __UINT8_TYPE__ = u8;
const __UINT8_FMTo__ = "hho";
const __UINT8_FMTu__ = "hhu";
const __UINT8_FMTx__ = "hhx";
const __UINT8_FMTX__ = "hhX";
const __UINT8_C_SUFFIX__ = "";
const __UINT8_MAX__ = @as(c_int, 255);
const __INT8_MAX__ = @as(c_int, 127);
const __UINT16_TYPE__ = c_ushort;
const __UINT16_FMTo__ = "ho";
const __UINT16_FMTu__ = "hu";
const __UINT16_FMTx__ = "hx";
const __UINT16_FMTX__ = "hX";
const __UINT16_C_SUFFIX__ = "";
const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
const __INT16_MAX__ = @as(c_int, 32767);
const __UINT32_TYPE__ = c_uint;
const __UINT32_FMTo__ = "o";
const __UINT32_FMTu__ = "u";
const __UINT32_FMTx__ = "x";
const __UINT32_FMTX__ = "X";
const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __UINT64_TYPE__ = c_ulong;
const __UINT64_FMTo__ = "lo";
const __UINT64_FMTu__ = "lu";
const __UINT64_FMTx__ = "lx";
const __UINT64_FMTX__ = "lX";
const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
const __INT_LEAST8_TYPE__ = i8;
const __INT_LEAST8_MAX__ = @as(c_int, 127);
const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
const __INT_LEAST8_FMTd__ = "hhd";
const __INT_LEAST8_FMTi__ = "hhi";
const __UINT_LEAST8_TYPE__ = u8;
const __UINT_LEAST8_MAX__ = @as(c_int, 255);
const __UINT_LEAST8_FMTo__ = "hho";
const __UINT_LEAST8_FMTu__ = "hhu";
const __UINT_LEAST8_FMTx__ = "hhx";
const __UINT_LEAST8_FMTX__ = "hhX";
const __INT_LEAST16_TYPE__ = c_short;
const __INT_LEAST16_MAX__ = @as(c_int, 32767);
const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
const __INT_LEAST16_FMTd__ = "hd";
const __INT_LEAST16_FMTi__ = "hi";
const __UINT_LEAST16_TYPE__ = c_ushort;
const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
const __UINT_LEAST16_FMTo__ = "ho";
const __UINT_LEAST16_FMTu__ = "hu";
const __UINT_LEAST16_FMTx__ = "hx";
const __UINT_LEAST16_FMTX__ = "hX";
const __INT_LEAST32_TYPE__ = c_int;
const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
const __INT_LEAST32_FMTd__ = "d";
const __INT_LEAST32_FMTi__ = "i";
const __UINT_LEAST32_TYPE__ = c_uint;
const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __UINT_LEAST32_FMTo__ = "o";
const __UINT_LEAST32_FMTu__ = "u";
const __UINT_LEAST32_FMTx__ = "x";
const __UINT_LEAST32_FMTX__ = "X";
const __INT_LEAST64_TYPE__ = c_long;
const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
const __INT_LEAST64_FMTd__ = "ld";
const __INT_LEAST64_FMTi__ = "li";
const __UINT_LEAST64_TYPE__ = c_ulong;
const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
const __UINT_LEAST64_FMTo__ = "lo";
const __UINT_LEAST64_FMTu__ = "lu";
const __UINT_LEAST64_FMTx__ = "lx";
const __UINT_LEAST64_FMTX__ = "lX";
const __INT_FAST8_TYPE__ = i8;
const __INT_FAST8_MAX__ = @as(c_int, 127);
const __INT_FAST8_WIDTH__ = @as(c_int, 8);
const __INT_FAST8_FMTd__ = "hhd";
const __INT_FAST8_FMTi__ = "hhi";
const __UINT_FAST8_TYPE__ = u8;
const __UINT_FAST8_MAX__ = @as(c_int, 255);
const __UINT_FAST8_FMTo__ = "hho";
const __UINT_FAST8_FMTu__ = "hhu";
const __UINT_FAST8_FMTx__ = "hhx";
const __UINT_FAST8_FMTX__ = "hhX";
const __INT_FAST16_TYPE__ = c_short;
const __INT_FAST16_MAX__ = @as(c_int, 32767);
const __INT_FAST16_WIDTH__ = @as(c_int, 16);
const __INT_FAST16_FMTd__ = "hd";
const __INT_FAST16_FMTi__ = "hi";
const __UINT_FAST16_TYPE__ = c_ushort;
const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
const __UINT_FAST16_FMTo__ = "ho";
const __UINT_FAST16_FMTu__ = "hu";
const __UINT_FAST16_FMTx__ = "hx";
const __UINT_FAST16_FMTX__ = "hX";
const __INT_FAST32_TYPE__ = c_int;
const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __INT_FAST32_WIDTH__ = @as(c_int, 32);
const __INT_FAST32_FMTd__ = "d";
const __INT_FAST32_FMTi__ = "i";
const __UINT_FAST32_TYPE__ = c_uint;
const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __UINT_FAST32_FMTo__ = "o";
const __UINT_FAST32_FMTu__ = "u";
const __UINT_FAST32_FMTx__ = "x";
const __UINT_FAST32_FMTX__ = "X";
const __INT_FAST64_TYPE__ = c_long;
const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
const __INT_FAST64_WIDTH__ = @as(c_int, 64);
const __INT_FAST64_FMTd__ = "ld";
const __INT_FAST64_FMTi__ = "li";
const __UINT_FAST64_TYPE__ = c_ulong;
const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
const __UINT_FAST64_FMTo__ = "lo";
const __UINT_FAST64_FMTu__ = "lu";
const __UINT_FAST64_FMTx__ = "lx";
const __UINT_FAST64_FMTX__ = "lX";
const __USER_LABEL_PREFIX__ = "";
const __FINITE_MATH_ONLY__ = @as(c_int, 0);
const __GNUC_STDC_INLINE__ = @as(c_int, 1);
const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
const __NO_INLINE__ = @as(c_int, 1);
const __PIC__ = @as(c_int, 2);
const __pic__ = @as(c_int, 2);
const __PIE__ = @as(c_int, 2);
const __pie__ = @as(c_int, 2);
const __FLT_RADIX__ = @as(c_int, 2);
const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
const __ELF__ = @as(c_int, 1);
const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
const __code_model_small__ = @as(c_int, 1);
const __amd64__ = @as(c_int, 1);
const __amd64 = @as(c_int, 1);
const __x86_64 = @as(c_int, 1);
const __x86_64__ = @as(c_int, 1);
const __SEG_GS = @as(c_int, 1);
const __SEG_FS = @as(c_int, 1);
const __corei7 = @as(c_int, 1);
const __corei7__ = @as(c_int, 1);
const __tune_corei7__ = @as(c_int, 1);
const __REGISTER_PREFIX__ = "";
const __NO_MATH_INLINES = @as(c_int, 1);
const __AES__ = @as(c_int, 1);
const __PCLMUL__ = @as(c_int, 1);
const __LAHF_SAHF__ = @as(c_int, 1);
const __LZCNT__ = @as(c_int, 1);
const __RDRND__ = @as(c_int, 1);
const __FSGSBASE__ = @as(c_int, 1);
const __BMI__ = @as(c_int, 1);
const __BMI2__ = @as(c_int, 1);
const __POPCNT__ = @as(c_int, 1);
const __PRFCHW__ = @as(c_int, 1);
const __RDSEED__ = @as(c_int, 1);
const __ADX__ = @as(c_int, 1);
const __MOVBE__ = @as(c_int, 1);
const __FMA__ = @as(c_int, 1);
const __F16C__ = @as(c_int, 1);
const __FXSR__ = @as(c_int, 1);
const __XSAVE__ = @as(c_int, 1);
const __XSAVEOPT__ = @as(c_int, 1);
const __XSAVEC__ = @as(c_int, 1);
const __XSAVES__ = @as(c_int, 1);
const __CLFLUSHOPT__ = @as(c_int, 1);
const __SGX__ = @as(c_int, 1);
const __INVPCID__ = @as(c_int, 1);
const __CRC32__ = @as(c_int, 1);
const __AVX2__ = @as(c_int, 1);
const __AVX__ = @as(c_int, 1);
const __SSE4_2__ = @as(c_int, 1);
const __SSE4_1__ = @as(c_int, 1);
const __SSSE3__ = @as(c_int, 1);
const __SSE3__ = @as(c_int, 1);
const __SSE2__ = @as(c_int, 1);
const __SSE2_MATH__ = @as(c_int, 1);
const __SSE__ = @as(c_int, 1);
const __SSE_MATH__ = @as(c_int, 1);
const __MMX__ = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
const __SIZEOF_FLOAT128__ = @as(c_int, 16);
const unix = @as(c_int, 1);
const __unix = @as(c_int, 1);
const __unix__ = @as(c_int, 1);
const linux = @as(c_int, 1);
const __linux = @as(c_int, 1);
const __linux__ = @as(c_int, 1);
const __gnu_linux__ = @as(c_int, 1);
const __FLOAT128__ = @as(c_int, 1);
const __STDC__ = @as(c_int, 1);
const __STDC_HOSTED__ = @as(c_int, 1);
const __STDC_VERSION__ = @as(c_long, 201710);
const __STDC_UTF_16__ = @as(c_int, 1);
const __STDC_UTF_32__ = @as(c_int, 1);
const _DEBUG = @as(c_int, 1);
const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
const MULTIBOOT_HEADER = @as(c_int, 1);
const MULTIBOOT_SEARCH = @as(c_int, 8192);
const MULTIBOOT_HEADER_ALIGN = @as(c_int, 4);
const MULTIBOOT_HEADER_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1BADB002, .hex);
const MULTIBOOT_BOOTLOADER_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x2BADB002, .hex);
const MULTIBOOT_MOD_ALIGN = @as(c_int, 0x00001000);
const MULTIBOOT_INFO_ALIGN = @as(c_int, 0x00000004);
const MULTIBOOT_PAGE_ALIGN = @as(c_int, 0x00000001);
const MULTIBOOT_MEMORY_INFO = @as(c_int, 0x00000002);
const MULTIBOOT_VIDEO_MODE = @as(c_int, 0x00000004);
const MULTIBOOT_AOUT_KLUDGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
const MULTIBOOT_INFO_MEMORY = @as(c_int, 0x00000001);
const MULTIBOOT_INFO_BOOTDEV = @as(c_int, 0x00000002);
const MULTIBOOT_INFO_CMDLINE = @as(c_int, 0x00000004);
const MULTIBOOT_INFO_MODS = @as(c_int, 0x00000008);
const MULTIBOOT_INFO_AOUT_SYMS = @as(c_int, 0x00000010);
const MULTIBOOT_INFO_ELF_SHDR = @as(c_int, 0x00000020);
const MULTIBOOT_INFO_MEM_MAP = @as(c_int, 0x00000040);
const MULTIBOOT_INFO_DRIVE_INFO = @as(c_int, 0x00000080);
const MULTIBOOT_INFO_CONFIG_TABLE = @as(c_int, 0x00000100);
const MULTIBOOT_INFO_BOOT_LOADER_NAME = @as(c_int, 0x00000200);
const MULTIBOOT_INFO_APM_TABLE = @as(c_int, 0x00000400);
const MULTIBOOT_INFO_VBE_INFO = @as(c_int, 0x00000800);
const MULTIBOOT_INFO_FRAMEBUFFER_INFO = @as(c_int, 0x00001000);
const MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED = @as(c_int, 0);
const MULTIBOOT_FRAMEBUFFER_TYPE_RGB = @as(c_int, 1);
const MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT = @as(c_int, 2);
const MULTIBOOT_MEMORY_AVAILABLE = @as(c_int, 1);
const MULTIBOOT_MEMORY_RESERVED = @as(c_int, 2);
const MULTIBOOT_MEMORY_ACPI_RECLAIMABLE = @as(c_int, 3);
const MULTIBOOT_MEMORY_NVS = @as(c_int, 4);
const MULTIBOOT_MEMORY_BADRAM = @as(c_int, 5);
pub const multiboot_header = struct_multiboot_header;
pub const multiboot_aout_symbol_table = struct_multiboot_aout_symbol_table;
pub const multiboot_elf_section_header_table = struct_multiboot_elf_section_header_table;
pub const multiboot_info = struct_multiboot_info;
pub const multiboot_color = struct_multiboot_color;
pub const multiboot_mmap_entry = struct_multiboot_mmap_entry;
pub const multiboot_mod_list = struct_multiboot_mod_list;
pub const multiboot_apm_info = struct_multiboot_apm_info;