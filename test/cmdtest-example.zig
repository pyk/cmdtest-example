const std = @import("std");
const cmdtest = @import("cmdtest");
const testing = std.testing;

test "via exe name" {
    const argv = &[_][]const u8{"cmdtest-example"};
    var result = try cmdtest.run(testing.io, .{ .argv = argv });
    defer result.deinit();

    try testing.expectEqualStrings("project-exe\n", result.stderr);
}

test "via path" {
    const argv = &[_][]const u8{"./zig-out/bin/cmdtest-example"};
    var result = try cmdtest.run(testing.io, .{ .argv = argv });
    defer result.deinit();

    try testing.expectEqualStrings("project-exe\n", result.stderr);
}
