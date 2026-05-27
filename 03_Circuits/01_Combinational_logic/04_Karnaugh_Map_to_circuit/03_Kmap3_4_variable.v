/*
============================================================
HDLBits Problem: Kmap3

Description:
Implement the logic circuit described
by the given Karnaugh map.

============================================================
Theory

Original expression:

    a | (c & ~a & ~b)

Using Boolean reduction:

    x + x'y = x + y

We get:

    a | (c & ~b)

This is the simplified Sum-of-Products form.

============================================================
*/

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
);

    assign out = a | (c & ~b);

endmodule
