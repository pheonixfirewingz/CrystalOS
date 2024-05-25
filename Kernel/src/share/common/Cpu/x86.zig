pub const CPUID = struct {
    eax: u32 = 0,
    ebx: u32 = 0,
    ecx: u32 = 0,
    edx: u32 = 0,
};

pub inline fn getCpuIdFeatures() CPUID {
    var eax : u32 = 0;
    var ebx : u32 = 0;
    var ecx : u32 = 0;
    var edx : u32 = 0;
    asm volatile ("cpuid;" : [eax] "={eax}" (eax), [ebx] "={ebx}" (ebx), [ecx] "={ecx}" (ecx), [edx] "={edx}" (edx));
    return .{.eax = eax, .ebx = ebx, .ecx = ecx, .edx = edx};
}

pub const CPU_FEATURES = enum(u32) {
    SSE = 1 << 25,
    SSE2 = 1 << 26,
    SSSE3 = 1 << 9,
    SSE4_1 = 1 << 19,
    SSE4_2 = 1 << 20,
    AVX = 1 << 28,
};

pub inline fn checkIsFeatureSupported(features: CPUID,feature: CPU_FEATURES) bool {
    return (features.edx & (@intFromEnum(feature))) != 0;
}

pub inline fn getCr0() u32 {
    return asm volatile ("mov %%cr0, %[ret]"
        : [ret] "=r" (-> u32),
    );
}

pub inline fn setCr0(value: u32) void {
    asm volatile ("mov %[value], %%cr0"
        :
        : [value] "r" (value),
    );
}

pub inline fn getCr4() u32 {
    return asm volatile ("mov %%cr4, %[ret]"
        : [ret] "=r" (-> u32),
    );
}

pub inline fn setCr4(value: u32) void {
    asm volatile ("mov %[value], %%cr4"
        :
        : [value] "r" (value),
    );
}

pub inline fn outb(port: u16, data: u8) void {
    asm volatile ("outb %[data], %[port]"
        :
        : [port] "{dx}" (port),
          [data] "{al}" (data),
    );
}

pub inline fn inb(port: u16) u8 {
    return asm volatile ("inb %[port], %[ret]"
        : [ret] "={al}" (-> u8),
        : [port] "N{dx}" (port),
    );
}
