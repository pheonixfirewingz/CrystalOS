// mini kernel boot strap
const MultiBoot = @import("MultiBoot.zig");
const flags: u32 = MultiBoot.MULTIBOOT_INFO_MEMORY | MultiBoot.MULTIBOOT_PAGE_ALIGN;

export const header: MultiBoot.multiboot_header linksection(".multiboot") = .{
    .magic = MultiBoot.MULTIBOOT_HEADER_MAGIC,
    .flags = flags,
    .checksum = MultiBoot.MULTIBOOT_HEADER_MAGIC & flags,
};

export var kstack: [1024 * 16]u8 align(16) linksection(".bss") = undefined;
export fn _start() callconv(.Naked) noreturn {
    asm volatile ("mov %[stack], %%rsp"
        :
        : [stack] "r" (kstack),
    );
    asm volatile ("push %[multiboot_info]"
        :
        : [multiboot_info] "r" (&header),
    );
    asm volatile ("call kernel_main");
    while (true) {}
}
// main
const console = @import("console.zig");
const mm = @import("memory/MemoryManager.zig");

export fn kernel_main(multiboot_info_ptr: *const MultiBoot.multiboot_info) callconv(.C) void {
    console.initialize();
    //print multiboot info to console
    console.printf("multiboot info: {}\n", .{multiboot_info_ptr});
}
