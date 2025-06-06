var a: u32 = 0;
pub fn List(comptime T: type) type {
    a += 1;
    return SmallList(T, 8);
}

pub fn SmallList(comptime T: type, comptime STATIC_SIZE: usize) type {
    return struct {
        items: []T,
        length: usize,
        prealloc_items: [STATIC_SIZE]T,
    };
}

export fn function_with_return_type_type() void {
    var list: List(i32) = undefined;
    list.length = 10;
}

// error
//
// :3:7: error: unable to evaluate comptime expression
// :3:5: note: operation is runtime due to this operand
// :16:19: note: called at comptime from here
// :16:19: note: types must be comptime-known
