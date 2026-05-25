/*
HDLBits Problem: Vector Gates

Goal:
Perform bitwise OR, logical OR, and vector inversion operations.

Inputs:
a[2:0]
b[2:0]

Outputs:
out_or_bitwise  -> bitwise OR of vectors
out_or_logical  -> logical OR of vectors
out_not         -> inverted vectors

Structure of out_not:
[5:3] = ~b
[2:0] = ~a

Important Concepts:

Bitwise OR (|)
Applied independently to each bit.

Example:
a = 101
b = 011

a | b = 111

Logical OR (||)
Treats the entire vector as a boolean value.

true  = non-zero vector
false = zero vector

Example:
a = 000
b = 001

a || b = 1

Vector inversion:
~ operator flips each bit.

Example:
~101 = 010
*/

`default_nettype none

module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

    // Bitwise OR
    assign out_or_bitwise = a | b;

    // Logical OR
    assign out_or_logical = a || b;

    // Vector inversion placement
    assign out_not = {~b, ~a};

endmodule
