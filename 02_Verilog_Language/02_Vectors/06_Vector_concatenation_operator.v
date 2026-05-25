/*
HDLBits Problem: Vector3

Goal:
Concatenate six 5-bit input vectors (a,b,c,d,e,f) and distribute them
into four 8-bit output vectors (w,x,y,z).

Total input bits  = 30
Total output bits = 32

Therefore two additional bits (1'b1) are appended.

Concept Used:
Concatenation operator {}

Concatenation syntax:
{signal1, signal2, signal3}

Example:
{3'b111, 3'b000} = 6'b111000

Important Rule:
Every element inside {} must have a known width.
Unsized constants like {1,2,3} are illegal.

Bit Mapping Used:

w = {a, b[4:2]}
x = {b[1:0], c, d[4]}
y = {d[3:0], e[4:1]}
z = {e[0], f, 1'b1, 1'b1}
*/

`default_nettype none

module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z
);

    // Concatenate and distribute the bits
    assign w = {a, b[4:2]};
    assign x = {b[1:0], c, d[4]};
    assign y = {d[3:0], e[4:1]};
    assign z = {e[0], f, 1'b1, 1'b1};

endmodule
