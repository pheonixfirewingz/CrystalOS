const console = @import("console.zig");
const mm = @import("memory/MemoryManager.zig");
const MultiBoot = @import("MultiBoot.zig");

const flags: u32 = MultiBoot.MULTIBOOT_INFO_MEMORY | MultiBoot.MULTIBOOT_PAGE_ALIGN;

export const header: MultiBoot.multiboot_header linksection(".multiboot") = .{
    .magic = MultiBoot.MULTIBOOT_HEADER_MAGIC,
    .flags = flags,
    .checksum = MultiBoot.MULTIBOOT_HEADER_MAGIC & flags,
};

export fn _start() callconv(.Naked) noreturn {
    kernel_main(&header);
    while (true) {}
}

fn kernel_main(multiboot_info_ptr: *const MultiBoot.multiboot_info) void {
    console.initialize();
    //print multiboot info to console
    console.printf("multiboot info: {}\n", .{multiboot_info_ptr});
}
