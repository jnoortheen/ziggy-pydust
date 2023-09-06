const py = @import("pydust");

// --8<-- [start:append]
pub fn append(args: struct { left: py.PyString }) !py.PyString {
    // Since we create right, we must also decref it.
    const right = try py.PyString.fromSlice("right");
    defer right.decref();

    // Left is given to us as a borrowed reference from the caller.
    // Since append steals the left-hand-side, we must incref first.
    args.left.incref();
    return args.left.append(right);
}
// --8<-- [end:append]

// --8<-- [start:concat]
pub fn concat(args: struct { left: py.PyString }) !py.PyString {
    return args.left.concatSlice("right");
}
// --8<-- [end:concat]

comptime {
    py.module(@This());
}
