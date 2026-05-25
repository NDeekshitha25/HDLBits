/*
============================================================
HDLBits Problem: mux256to1v

Description:
Create a 4-bit wide 256-to-1 multiplexer.

The 256 inputs are packed inside a 1024-bit vector.

Selection Mapping:
    sel = 0   -> out = in[3:0]
    sel = 1   -> out = in[7:4]
    sel = 2   -> out = in[11:8]
    ...
    sel = 255 -> corresponding 4-bit block

------------------------------------------------------------
Theory

A multiplexer selects one input from many inputs.

Here:
    - 256 different 4-bit inputs
    - packed into one large vector
    - selected using an 8-bit select signal

Because:
    2^8 = 256

------------------------------------------------------------
Key Concept: Indexed Part Select

Syntax:

    vector[start +: width]

Meaning:
    Select 'width' bits beginning at 'start'

Used here:

    in[sel*4 +: 4]

Examples:

sel = 0
    in[0 +: 4]
    -> in[3:0]

sel = 1
    in[4 +: 4]
    -> in[7:4]

------------------------------------------------------------
Alternative Solution

This also works:

assign out = {
    in[sel*4+3],
    in[sel*4+2],
    in[sel*4+1],
    in[sel*4+0]
};

But indexed part-select is:
    - cleaner
    - shorter
    - preferred in HDLBits

------------------------------------------------------------
Concepts Used

- Multiplexers
- Packed Vectors
- Indexed Part Select
- Variable Indexing
- Combinational Logic

============================================================
*/

module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out
);

    assign out = in[sel*4 +: 4];

endmodule
