/*
HDLBits Problem: Vector0

Vectors allow multiple wires to be grouped together as a bus.
Instead of declaring multiple individual wires, we can declare
a multi-bit signal using vector notation.

Example:
wire [7:0] data;  // 8-bit vector (bus)

Indexing:
data[0] -> Least Significant Bit (LSB)
data[7] -> Most Significant Bit (MSB)

Problem Requirement:
- One 3-bit input vector
- Output the same vector
- Split the vector into three individual bits

Connections:
vec[2] -> o2
vec[1] -> o1
vec[0] -> o0
*/

`default_nettype none

module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0
);

    // Pass the entire vector directly
    assign outv = vec;

    // Extract individual bits from the vector
    assign o0 = vec[0];
    assign o1 = vec[1];
    assign o2 = vec[2];

endmodule
