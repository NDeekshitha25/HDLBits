/*
HDLBits Problem: AND Gate

Create a module that implements an AND gate.

The '&' operator in Verilog is the built-in bitwise AND operator.
The output is 1 only when both inputs are 1.

Truth Table:
a b | out
0 0 | 0
0 1 | 0
1 0 | 0
1 1 | 1
*/

module top_module(
    input a,
    input b,
    output out
);

    assign out = a & b;

endmodule
