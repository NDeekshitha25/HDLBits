/*
============================================================
HDLBits Problem: Dff8p

Description:
Create 8 D Flip-Flops with:
    - synchronous reset
    - negative-edge triggering

Reset value:
    8'h34

============================================================
Theory

Synchronous reset:
    reset is checked only on the
    clock edge.

Negative-edge triggering:

    @(negedge clk)

means the flip-flops update when:
    clk changes from 1 -> 0

If reset = 1:
    q = 8'h34

Else:
    q = d

============================================================
*/

module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output reg [7:0] q
);

    always @(negedge clk) begin
        if (reset)
            q <= 8'h34;
        else
            q <= d;
    end

endmodule
