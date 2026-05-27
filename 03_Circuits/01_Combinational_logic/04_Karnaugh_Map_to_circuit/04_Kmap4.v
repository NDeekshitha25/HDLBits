/*
============================================================
HDLBits Problem: Kmap4

Description:
Implement the logic circuit described
by the Karnaugh map.

============================================================
Theory

out = (~a&b&~c&~d) | (a&~b&~c&~d) | (~a&~b&~c&d) |  (a&b&~c&d) |  (~a&b&c&d) |  (a&~b&c&d) |  (~a&~b&c&~d) |  (a&b&c&~d)

The Karnaugh map simplifies to:

    out = a ^ b ^ c ^ d

XOR outputs 1 when there are an odd
number of 1's in the inputs.

This replaces the long canonical
Sum-of-Products expression.

============================================================
*/

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
);

    assign out = a ^ b ^ c ^ d;

endmodule
