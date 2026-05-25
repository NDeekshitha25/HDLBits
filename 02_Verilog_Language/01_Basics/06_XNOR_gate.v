/*
HDLBits Problem: XNOR Gate

Create a module that implements an XNOR gate.

XNOR is the inverse of XOR.
The output is 1 when both inputs are the same.

Truth Table:
a b | out
0 0 | 1
0 1 | 0
1 0 | 0
1 1 | 1

Operator explanation:

^  -> XOR (exclusive OR)
~  -> Bitwise NOT (inversion)

The expression ~(a ^ b) means:
1. Compute XOR of a and b
2. Invert the result
*/

module top_module(
    input a,
    input b,
    output out
);

    assign out = ~(a ^ b);

endmodule
