const console = @import("console.zig");
const mm = @import("memory/MemoryManager.zig");
const MultiBoot = @import("MultiBoot.zig");
export fn kernel_main(multiboot_magic: *const u32, multiboot_info_ptr: *const MultiBoot.struct_multiboot_info) callconv(.C) void {
    _ = multiboot_magic;
    console.initialize();
    //print multiboot info to console
    console.printf("multiboot info: {}\n", .{multiboot_info_ptr});
}
