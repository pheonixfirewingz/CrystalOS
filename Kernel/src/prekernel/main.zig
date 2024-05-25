// mini kernel boot strap
const MultiBoot = @import("share/MultiBoot.zig");
const flags: i32 = MultiBoot.MULTIBOOT_INFO_MEMORY | MultiBoot.MULTIBOOT_PAGE_ALIGN;

export const header: MultiBoot.struct_multiboot_elf_header align(4) linksection(".multiboot") = .{
    .magic = MultiBoot.MULTIBOOT_HEADER_MAGIC,
    .flags = flags,
    .checksum = -(@as(i32, MultiBoot.MULTIBOOT_HEADER_MAGIC) + flags),
};

export var stack_bytes: [16 * 1024]u8 align(16) linksection(".bss") = undefined;
const stack_bytes_slice = stack_bytes[0..];
export fn _start() callconv(.Naked) noreturn {
    asm volatile ("mov %[stack], %%esp"
        :
        : [stack] "r" (stack_bytes_slice),
    );
    asm volatile ("call kernel_main");
    while (true) {}
}
// main
const console = @import("share/Console.zig");
const cpu = switch (@import("builtin").cpu.arch) {
    .x86 => @import("share/common/Cpu/x86.zig"),
    .x86_64 => @import("share/common/Cpu/x86.zig"),
    else => @compileError("unsupported cpu architecture"),
};
const mm = @import("share/memory/MemoryManager.zig");

export fn kernel_main() callconv(.C) void {
    console.initialize();
    console.puts("Hello world!");
    console.puts("line 1\n");
    console.puts("line 2\n");
    console.puts("line 3\n");
    console.puts("line 4\n");
    //get cpu info
    //const cpuid: cpu.CPUID = cpu.getCpuIdFeatures();
    //print cpu info to console
    //set one enabled cpu feature sse and sse2
    //to check for SSE CPUID.01h:EDX.SSE[bit 25] needs to be set
    //if (cpu.checkIsFeatureSupported(cpuid, cpu.CPU_FEATURES.SSE)) {
    //    console.puts("Sse is supported\n");
    //} else {
    //    console.puts("Sse not supported\n");
    //}
    //if (cpu.checkIsFeatureSupported(cpuid, cpu.CPU_FEATURES.SSE2)) {
    //    console.puts("Sse2 is supported\n");
    //} else {
    //    console.puts("Sse2 not supported\n");
    //}
    //get cpu to 64bit mode

    //extract multiboot info to pass to kernel

    //load kernel

    //pass memory manager to kernel

    //call kernel main

    //hopefully kernel will yeet prekernel out of memory
}
