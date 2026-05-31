/*
============================================================
HDLBits Problem: Lfsr32
============================================================

Design:
32-bit Galois Linear Feedback Shift Register

Taps:
    32, 22, 2, 1

Reset:
    q = 32'h00000001

Galois LFSR Rule:
- Feedback source is q[0]
- Non-tapped stages simply shift
- Tapped stages shift and XOR with q[0]

Tap Mapping:

    Position 32 -> q[31]
    Position 22 -> q[21]
    Position  2 -> q[1]
    Position  1 -> q[0]

Key Idea:
All non-blocking assignments use OLD values
from before the clock edge.

============================================================
*/

module top_module(
    input clk,
    input reset,
    output reg [31:0] q
);

    always @(posedge clk) begin

        if (reset)
            q <= 32'h00000001;

        else begin
            q[31]    <= q[0];
            q[30:22] <= q[31:23];

            q[21]    <= q[22] ^ q[0];
            q[20:2]  <= q[21:3];

            q[1]     <= q[2] ^ q[0];
            q[0]     <= q[1] ^ q[0];
        end

    end

endmodule
