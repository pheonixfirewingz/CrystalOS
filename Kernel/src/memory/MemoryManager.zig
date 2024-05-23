const std = @import("std");
const KernelError = @import("../common/Error.zig").KERROR;
const MultiBoot = @import("../MultiBoot.zig");

pub fn init() KernelError!void {

}

pub fn deinit() KernelError!void {}

// kernel allocator act's like caloc
pub fn allocateZero(size: usize) KernelError!*const anyopaque {
    _ = size;
    var raw_ptr: *anyopaque = undefined;
    @memset(&raw_ptr, 0);
    return null;
}

pub fn free(ptr: *const anyopaque) KernelError!void {
    @memset(&ptr, 0);

}

pub fn kernelallocateZero(size: usize) KernelError!*const anyopaque {
    _ = size;
    return null;
}

pub fn kernelfree(ptr: *const anyopaque) KernelError!void {
    _ = ptr;
}
