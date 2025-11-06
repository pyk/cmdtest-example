const std = @import("std");
const exetest = @import("exetest");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    // Your executable
    const exe = b.addExecutable(.{
        .name = "exetest-example",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
        }),
    });
    b.installArtifact(exe);

    // Register new test
    const exe_test = exetest.add(b, .{
        .name = "exetest-example",
        .test_file = b.path("test/exetest-example.zig"),
    });
    const echo_test = exetest.add(b, .{
        .name = "echo",
        .test_file = b.path("test/echo.zig"),
    });

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&exe_test.step);
    test_step.dependOn(&echo_test.step);
}
