/*
============================================================
HDLBits Problem: Dff8

Description:
Create 8 D Flip-Flops triggered by the
positive edge of the clock.

Inputs:
    clk
    d[7:0]

Output:
    q[7:0]

============================================================
Theory

This is an 8-bit register made from
8 D Flip-Flops.

At every positive clock edge:
    q <= d

All 8 bits update simultaneously.

------------------------------------------------------------
posedge clk

    @(posedge clk)

Means:
    Execute the block only when the
    clock changes from:
        0 -> 1

------------------------------------------------------------
Non-Blocking Assignment

    <=

Used in sequential logic because all
flip-flops update together after the
clock edge.

------------------------------------------------------------
Why output reg is Needed

Signals assigned inside an always block
must be declared as reg.

============================================================
*/

module top_module (
    input clk,
    input [7:0] d,
    output reg [7:0] q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule
