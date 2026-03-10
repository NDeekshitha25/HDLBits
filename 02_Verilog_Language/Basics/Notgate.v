/*
HDLBits Problem: NOT Gate

Create a module that implements a NOT gate.
The output should always be the logical inversion of the input.

The '~' operator in Verilog is the built-in bitwise NOT operator.
It inverts the value of the input signal.

Example:
in = 0 → out = 1
in = 1 → out = 0
*/

module top_module(
    input in,
    output out
);

    assign out = ~in;

endmodule
