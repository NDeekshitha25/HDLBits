/*
HDLBits Problem: Vector2

Goal:
Reverse the byte order of a 32-bit word.

Input format:
[31:24] [23:16] [15:8] [7:0]
   A       B       C      D

Output format:
[31:24] [23:16] [15:8] [7:0]
   D       C       B      A

Concept:
This operation is called **byte swapping** and is commonly used
when converting between different endianness formats.

Endianness Example:
Little-endian systems store the least significant byte first,
while big-endian systems store the most significant byte first.

Verilog Concept Used:
Vector part-select
vector[high:low]
*/

`default_nettype none

module top_module( 
    input [31:0] in,
    output [31:0] out
);

    // Reverse byte order
    assign out[31:24] = in[7:0];
    assign out[23:16] = in[15:8];
    assign out[15:8]  = in[23:16];
    assign out[7:0]   = in[31:24];

endmodule
