/*
============================================================
HDLBits Problem: Kmap1

Description:
Implement the circuit described by the
given 3-variable Karnaugh map.

============================================================
Theory

The K-map simplifies to:

    out = a | b | c

The output becomes 1 if any input is 1.

Only:
    a=0, b=0, c=0

produces:
    out=0

============================================================
*/

module top_module(
    input a,
    input b,
    input c,
    output out
);

    assign out = a | b | c;

endmodule
