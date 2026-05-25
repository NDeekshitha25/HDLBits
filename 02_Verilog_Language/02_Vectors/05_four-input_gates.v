/*
HDLBits Problem: Gates4

Goal:
Build a combinational circuit with four inputs (in[3:0]) that produces:

1. out_and  → output of a 4-input AND gate
2. out_or   → output of a 4-input OR gate
3. out_xor  → output of a 4-input XOR gate

Concept Used:
Reduction operators.

Reduction operators apply a logic operation across all bits of a vector.

Examples:
&vector  → AND all bits
|vector  → OR all bits
^vector  → XOR all bits

Example:
in = 4'b1011

&in = 1 & 0 & 1 & 1 = 0
|in = 1 | 0 | 1 | 1 = 1
^in = 1 ^ 0 ^ 1 ^ 1 = 1
*/

`default_nettype none

module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    // 4-input AND gate using reduction AND
    assign out_and = &in;

    // 4-input OR gate using reduction OR
    assign out_or = |in;

    // 4-input XOR gate using reduction XOR
    assign out_xor = ^in;

endmodule
