/*
HDLBits Problem: Vectorr

Goal:
Reverse the bit order of an 8-bit input vector.

Example:
in  = 8'b11010010
out = 8'b01001011

Concept Used:
Vector concatenation {} to reorder bits.

Bit Mapping:
out[0] = in[7]
out[1] = in[6]
out[2] = in[5]
out[3] = in[4]
out[4] = in[3]
out[5] = in[2]
out[6] = in[1]
out[7] = in[0]
*/

`default_nettype none

module top_module( 
    input [7:0] in,
    output [7:0] out
);

    // Reverse bit order
    assign {out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7]} = in;

endmodule
