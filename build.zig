const std = @import("std");
const cmdtest = @import("cmdtest");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    // Your executable
    const exe = b.addExecutable(.{
        .name = "cmdtest-example",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
        }),
    });
    b.installArtifact(exe);

    // Register new test
    const exe_test = cmdtest.add(b, .{
        .name = "cmdtest-example",
        .test_file = b.path("test/cmdtest-example.zig"),
    });
    const echo_test = cmdtest.add(b, .{
        .name = "echo",
        .test_file = b.path("test/echo.zig"),
    });

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&exe_test.step);
    test_step.dependOn(&echo_test.step);
}
