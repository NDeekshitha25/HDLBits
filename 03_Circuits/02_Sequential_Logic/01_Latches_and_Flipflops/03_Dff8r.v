/*
============================================================
HDLBits Problem: Dff8r

Description:
Create 8 D Flip-Flops with synchronous reset.

Inputs:
    clk
    reset
    d[7:0]

Output:
    q[7:0]

============================================================
Theory

Synchronous reset means:
    reset is checked only at the
    positive edge of the clock.

If reset = 1:
    q becomes 0

Else:
    q stores d

============================================================
*/

module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output reg [7:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 8'b0;
        else
            q <= d;
    end

endmodule
