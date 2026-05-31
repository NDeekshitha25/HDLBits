/*
============================================================
HDLBits Problem: Lfsr5
============================================================

Design:
5-bit Galois Linear Feedback Shift Register (LFSR)

Characteristics:
- Synchronous reset
- Reset state = 5'b00001
- Feedback source = q[0]
- Taps at positions 5 and 3

State Update:

    q[4] <= q[0]
    q[3] <= q[4]
    q[2] <= q[3] ^ q[0]
    q[1] <= q[2]
    q[0] <= q[1]

Key Idea:
All non-blocking assignments use OLD values
from the previous clock cycle.

Example:

    old q = abcde

    new q[4] = e
    new q[3] = a
    new q[2] = b ^ e
    new q[1] = c
    new q[0] = d

============================================================
*/

module top_module(
    input clk,
    input reset,
    output reg [4:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 5'b00001;
        else begin
            q[4] <= q[0];
            q[3] <= q[4];
            q[2] <= q[3] ^ q[0];
            q[1] <= q[2];
            q[0] <= q[1];
        end
    end

endmodule
