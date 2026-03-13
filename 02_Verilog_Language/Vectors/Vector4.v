/*
HDLBits Problem: Vector4

Goal:
Sign-extend an 8-bit input number to a 32-bit output.

Concept Used:
Replication operator {}

Replication syntax:
{N{value}}

Example:
{5{1'b1}} = 5'b11111

Sign Extension:
Replicate the sign bit (MSB) to fill the higher bits.

Bit structure:
out[31:8] = replicated sign bits
out[7:0]  = original input
*/

`default_nettype none

module top_module (
    input [7:0] in,
    output [31:0] out
);

    // Replicate sign bit 24 times and concatenate with input
    assign out = {{24{in[7]}}, in};

endmodule
