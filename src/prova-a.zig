const std = @import("std");

const maxColumns = 80;
const maxRows = 40;

pub var editor: [maxRows][maxColumns]u8 = undefined;

fn userInput() !u8 {
    const stdin = std.io.getStdIn().reader();

    var buffer: [256]u8 = undefined;
    var columns: u8 = 0;

    while ((columns < 50) or (columns > maxColumns)) {
        if (try stdin.readUntilDelimiterOrEof(buffer[0..], '\n')) |user_input| {
            columns = try std.fmt.parseInt(u8, user_input, 10);
        }
    }

    return columns;
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Digite a largura da página (valor entre 50 a 80):\n", .{});

    const columns = userInput();

    std.debug.print("{!}\n", .{columns});
}
