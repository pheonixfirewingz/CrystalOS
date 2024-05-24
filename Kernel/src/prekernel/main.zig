// mini kernel boot strap
const MultiBoot = @import("share/MultiBoot.zig");
const flags: i32 = MultiBoot.MULTIBOOT_INFO_MEMORY | MultiBoot.MULTIBOOT_PAGE_ALIGN;

export const header: MultiBoot.struct_multiboot_elf_header align(4) linksection(".multiboot") = .{
    .magic = MultiBoot.MULTIBOOT_HEADER_MAGIC,
    .flags = flags,
    .checksum = -(@as(i32, MultiBoot.MULTIBOOT_HEADER_MAGIC) + flags),
};

export var kstack: [1024 * 16]u8 align(16) linksection(".bss") = undefined;
export fn _start() callconv(.Naked) noreturn {
    asm volatile ("mov %[stack], %%esp"
        :
        : [stack] "r" (kstack),
    );
    asm volatile ("call kernel_main");
    asm volatile ("back: hlt");
    asm volatile ("jmp back");
}
// main
const console = @import("share/Console.zig");
const mm = @import("share/memory/MemoryManager.zig");

export fn kernel_main() callconv(.C) void {
    console.initialize();
    console.clear();
    console.puts("Hello, World!\n");
    //set one enabled cpu feature sse and sse2
    asm volatile ("cpuid");
    var cpuid: u32 = undefined;
    asm volatile ("mov %%edx, %[cpuid]" : [cpuid] "=r" (cpuid) ::);
    console.printf("cpuid: {}\n", .{cpuid});

    //get cpu to 64bit mode

    //extract multiboot info to pass to kernel

    //load kernel

    //pass memory manager to kernel

    //call kernel main

    //hopefully kernel will yeet prekernel out of memory
}
