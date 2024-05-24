export var kstack: [1024 * 16]u8 align(16) linksection(".bss") = undefined;
export fn _start() callconv(.Naked) noreturn {
    asm volatile ("mov %[stack], %%rsp"
        :
        : [stack] "r" (kstack),
    );
    asm volatile ("call kernel_main");
    while (true) {}
}
export fn kernel_main() callconv(.C) void {}
