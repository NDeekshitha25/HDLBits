/*
============================================================
HDLBits Problem: Mux2to1v

Description:
Design a 100-bit wide 2-to-1 multiplexer.

Inputs:
    a[99:0]  -> Input 0
    b[99:0]  -> Input 1
    sel      -> Select signal

Output:
    out[99:0]

------------------------------------------------------------
Multiplexer Logic

If:
    sel = 0 -> output = a
    sel = 1 -> output = b

------------------------------------------------------------
Ternary Operator

Verilog syntax:

    condition ? value_if_true : value_if_false

Used here:

    sel ? b : a

Meaning:
    If sel is 1, choose b
    Else choose a

------------------------------------------------------------
Why This Works for 100-bit Vectors

The ternary operator works bitwise on vectors.

So:
    out[99:0] receives either:
        a[99:0]
    or
        b[99:0]

------------------------------------------------------------
Alternative Boolean Equation

This also works:

    assign out = ({100{sel}} & b) |
                 ({100{~sel}} & a);

Explanation:
- {100{sel}} replicates sel 100 times
- Creates a 100-bit mask

------------------------------------------------------------
Why This Does NOT Work

    assign out = (sel & b) | (~sel & a);

Because:
- sel is 1 bit
- b and a are 100 bits

Bit widths mismatch.

Replication is needed for proper masking.

------------------------------------------------------------
Concepts Used

- Multiplexers
- Ternary Operator
- Vector Operations
- Bit Replication
- Combinational Logic

============================================================
*/

module top_module (
    input [99:0] a,
    input [99:0] b,
    input sel,
    output [99:0] out
);

    assign out = sel ? b : a;

endmodule
