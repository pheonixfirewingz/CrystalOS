const fmt = @import("std").fmt;
const Writer = @import("std").io.Writer;
const cpu = switch (@import("builtin").cpu.arch) {
    .x86 => @import("common/Cpu/x86.zig"),
    .x86_64 => @import("common/Cpu/x86.zig"),
    else => @compileError("unsupported cpu architecture"),
};

const VGA_WIDTH = 80;
const VGA_HEIGHT = 25;
const VGA_SIZE = VGA_WIDTH * VGA_HEIGHT;

pub const ConsoleColors = enum(u8) {
    Black = 0,
    Blue = 1,
    Green = 2,
    Cyan = 3,
    Red = 4,
    Magenta = 5,
    Brown = 6,
    LightGray = 7,
    DarkGray = 8,
    LightBlue = 9,
    LightGreen = 10,
    LightCyan = 11,
    LightRed = 12,
    LightMagenta = 13,
    LightBrown = 14,
    White = 15,
};

var row: usize = 0;
var column: usize = 0;
var color = vgaEntryColor(ConsoleColors.LightGray, ConsoleColors.Black);
var buffer = @as([*]volatile u16, @ptrFromInt(0xB8000));

inline fn vgaEntryColor(fg: ConsoleColors, bg: ConsoleColors) u8 {
    return @intFromEnum(fg) | (@intFromEnum(bg) << 4);
}

inline fn vgaEntry(uc: u8, new_color: u8) u16 {
    const c: u16 = new_color;

    return uc | (c << 8);
}

pub fn initialize() void {
    cpu.outb(0x3f8 + 1, 0x00);
    cpu.outb(0x3f8 + 3, 0x80);
    cpu.outb(0x3f8 + 0, 0x03);
    cpu.outb(0x3f8 + 1, 0x00);
    cpu.outb(0x3f8 + 3, 0x03);
    cpu.outb(0x3f8 + 2, 0xC7);
    cpu.outb(0x3f8 + 4, 0x0B);
    clear();
}

pub fn setColor(new_color: u8) void {
    color = new_color;
}

pub fn clear() void {
    @memset(buffer[0..VGA_SIZE], vgaEntry(' ', color));
}

pub fn putCharAt(c: u8, new_color: u8, x: usize, y: usize) void {
    const index = y * VGA_WIDTH + x;
    buffer[index] = vgaEntry(c, new_color);
}

pub fn putChar(c: u8) void {
    if (c == '\n') {
        column = 0;
        row += 1;
        if (row == VGA_HEIGHT)
            row = 0;
    } else {
        putCharAt(c, color, column, row);
        column += 1;
        if (column == VGA_WIDTH) {
            column = 0;
            row += 1;
            if (row == VGA_HEIGHT)
                row = 0;
        }
    }
    while ((cpu.inb(0x3f8 + 5) & 0x20) == 0) {} // Wait for empty transmit buffer
    cpu.outb(0x3f8, c);
}

pub fn puts(data: []const u8) void {
    for (data) |c|
        putChar(c);
}

pub const writer = Writer(void, error{}, callback){ .context = {} };

fn callback(_: void, string: []const u8) error{}!usize {
    puts(string);
    return string.len;
}

pub fn printf(comptime format: []const u8, args: anytype) void {
    fmt.format(writer, format, args) catch unreachable;
}
