const std = @import("std");
const Target = @import("std").Target;
const CrossTarget = @import("std").zig.CrossTarget;
const Feature = @import("std").Target.Cpu.Feature;

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{.preferred_optimize_mode = .Debug});
    var kernel = buildPreKernel(b, optimize);
    var pre_kernel = buildKernel(b, optimize);

    const kernel_step = b.step("kernel", "Build the kernel");
    kernel_step.dependOn(&kernel.step);
    kernel_step.dependOn(&pre_kernel.step);

    const root_dir = b.fmt("{s}/zig-out", .{b.build_root.path.?});
    const iso_dir = b.fmt("{s}/iso_root", .{root_dir});
    const boot_dir = b.fmt("{s}/boot", .{iso_dir});
    const grub_dir = b.fmt("{s}/grub", .{boot_dir});
    const pre_kernel_path = b.fmt("{s}/bin/preMolton", .{root_dir});
    const kernel_path = b.fmt("{s}/bin/Molton", .{root_dir});
    const iso_path = b.fmt("{s}/disk.iso", .{b.exe_dir});

    const iso_cmd_str = &[_][]const u8{
        "/bin/sh", "-c", std.mem.concat(b.allocator, u8, &[_][]const u8{
            "mkdir -p ",         iso_dir, //
            "&& mkdir -p ",      boot_dir,
            "&& mkdir -p ",      grub_dir,
            " && ",              "cp ",
            kernel_path,         " ",
            boot_dir,            " && ",
            "cp ",               pre_kernel_path,
            " ",                 boot_dir,
            " && ",              "cp src/grub.cfg ",
            grub_dir,            " && ",
            "grub-mkrescue -o ", iso_path,
            " ",                 iso_dir,
        }) catch unreachable,
    };

    const iso_cmd = b.addSystemCommand(iso_cmd_str);
    iso_cmd.step.dependOn(kernel_step);

    const iso_step = b.step("iso", "Build an ISO image");
    iso_step.dependOn(&iso_cmd.step);
    b.default_step.dependOn(iso_step);

    const run_cmd_str = &[_][]const u8{ "qemu-system-x86_64", "-cdrom", iso_path, "-debugcon", "stdio", "-vga", "virtio", "-m", "4G", "-machine", "q35,accel=kvm:whpx:tcg", "-no-reboot", "-no-shutdown" };

    const run_cmd = b.addSystemCommand(run_cmd_str);
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the kernel");
    run_step.dependOn(&run_cmd.step);
}

pub fn buildKernel(b: *std.Build, optimize: std.builtin.OptimizeMode) *std.Build.Step.Compile {
    const features = Target.x86.Feature;

    var disabled_features = Feature.Set.empty;
    disabled_features.addFeature(@intFromEnum(features.mmx));
    disabled_features.addFeature(@intFromEnum(features.avx));
    disabled_features.addFeature(@intFromEnum(features.avx2));

    const query = CrossTarget{ .cpu_arch = Target.Cpu.Arch.x86_64, .os_tag = Target.Os.Tag.freestanding, .abi = Target.Abi.none, .cpu_features_sub = disabled_features };

    const kernel = b.addExecutable(.{
        .name = "Molton",
        .root_source_file = b.path("src/kernel/main.zig"),
        .target = b.resolveTargetQuery(query),
        .optimize = optimize,
    });
    kernel.linker_script = b.path("klinker.ld");

    b.installArtifact(kernel);
    return kernel;
}

pub fn buildPreKernel(b: *std.Build, optimize: std.builtin.OptimizeMode) *std.Build.Step.Compile {
    const features = Target.x86.Feature;

    var disabled_features = Feature.Set.empty;
    var enabled_features = Feature.Set.empty;

    disabled_features.addFeature(@intFromEnum(features.mmx));
    disabled_features.addFeature(@intFromEnum(features.sse));
    disabled_features.addFeature(@intFromEnum(features.sse2));
    disabled_features.addFeature(@intFromEnum(features.avx));
    disabled_features.addFeature(@intFromEnum(features.avx2));
    enabled_features.addFeature(@intFromEnum(features.soft_float));

    const query = CrossTarget{ .cpu_arch = Target.Cpu.Arch.x86, .os_tag = Target.Os.Tag.freestanding, .abi = Target.Abi.none, .cpu_features_sub = disabled_features, .cpu_features_add = enabled_features };

    const prekernel = b.addExecutable(.{
        .name = "preMolton",
        .root_source_file = b.path("src/prekernel/main.zig"),
        .target = b.resolveTargetQuery(query),
        .optimize = optimize,
    });
    prekernel.linker_script = b.path("klinker.ld");

    b.installArtifact(prekernel);
    return prekernel;
}
