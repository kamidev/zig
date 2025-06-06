const builtin = @import("builtin");
const common = @import("./common.zig");
const floatFromInt = @import("./float_from_int.zig").floatFromInt;

pub const panic = common.panic;

comptime {
    if (common.want_aeabi) {
        @export(&__aeabi_l2d, .{ .name = "__aeabi_l2d", .linkage = common.linkage, .visibility = common.visibility });
    } else {
        @export(&__floatdidf, .{ .name = if (common.want_windows_arm_abi) "__i64tod" else "__floatdidf", .linkage = common.linkage, .visibility = common.visibility });
    }
}

pub fn __floatdidf(a: i64) callconv(.c) f64 {
    return floatFromInt(f64, a);
}

fn __aeabi_l2d(a: i64) callconv(.{ .arm_aapcs = .{} }) f64 {
    return floatFromInt(f64, a);
}
