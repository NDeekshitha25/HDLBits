/*
============================================================
HDLBits Problem: exams/ece241_2014_q3

Description:
Implement the Karnaugh-map function using
a 4-to-1 multiplexer.

Inputs:
    c
    d

Output:
    mux_in[3:0]

------------------------------------------------------------
Theory

The external 4-to-1 mux uses:
    a,b

as select lines.

This module generates the 4 mux inputs.

------------------------------------------------------------
MUX Mapping

ab = 00 -> mux_in[0]
ab = 01 -> mux_in[1]
ab = 10 -> mux_in[2]
ab = 11 -> mux_in[3]

Each mux input is simplified using the
K-map with variables c and d.

------------------------------------------------------------
Simplified Inputs

mux_in[0] = c | d
mux_in[1] = 0
mux_in[2] = ~d
mux_in[3] = c & d

------------------------------------------------------------
Concepts Used

- Karnaugh Maps
- Multiplexer-Based Logic Design
- Boolean Simplification
- 4-to-1 Multiplexer

============================================================
*/

module top_module (
    input c,
    input d,
    output [3:0] mux_in
);

    assign mux_in[0] = c | d;

    assign mux_in[1] = 1'b0;

    assign mux_in[2] = ~d;

    assign mux_in[3] = c & d;

endmodule
