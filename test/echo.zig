const std = @import("std");
const cmdtest = @import("cmdtest");
const testing = std.testing;

test "echo" {
    const argv = &[_][]const u8{ "echo", "hello" };
    var result = try cmdtest.run(.{ .argv = argv });
    defer result.deinit();

    try testing.expectEqualStrings("hello\n", result.stdout);
}
