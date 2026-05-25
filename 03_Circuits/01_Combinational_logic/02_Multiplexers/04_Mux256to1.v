/*
============================================================
HDLBits Problem: mux256to1

Description:
Design a 1-bit wide 256-to-1 multiplexer.

Inputs:
    in[255:0] -> 256 input lines packed into one vector
    sel[7:0] -> Select signal

Output:
    out -> Selected single bit

------------------------------------------------------------
Multiplexer Theory

A multiplexer (MUX) selects one input from many inputs
and forwards it to the output.

Here:
    - 256 inputs
    - 1 output
    - 8-bit select line

Because:
    2^8 = 256

------------------------------------------------------------
Selection Logic

sel value      Output
--------------------------------
0               in[0]
1               in[1]
2               in[2]
...
255             in[255]

------------------------------------------------------------
Key Verilog Concept

Vector indices can be variable.

This means:
    in[sel]

is valid Verilog.

The value of sel dynamically selects one bit
from the vector.

------------------------------------------------------------
Why This Solution Is Best

Using:
- case statements
- nested muxes

would be unnecessarily large.

Variable indexing is:
- shorter
- synthesizable
- cleaner
- scalable

------------------------------------------------------------
Concepts Used

- Multiplexers
- Vector Indexing
- Variable Bit Selection
- Combinational Logic

============================================================
*/

module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out
);

    assign out = in[sel];

endmodule
