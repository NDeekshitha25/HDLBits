/*
============================================================
HDLBits Problem: Dff8ar

Description:
Create 8 D Flip-Flops with:
    - asynchronous active-high reset
    - positive-edge clock triggering

============================================================
Theory

Asynchronous reset means:
    reset works immediately,
    without waiting for the clock edge.

This is done by adding reset to the
sensitivity list.

------------------------------------------------------------
Sensitivity List

    @(posedge clk or posedge areset)

The always block runs when:
    - clk rises
    OR
    - areset rises

------------------------------------------------------------
Behavior

If areset = 1:
    q becomes 0 immediately

Else:
    q stores d on positive clock edge

============================================================
*/

module top_module (
    input clk,
    input areset,
    input [7:0] d,
    output reg [7:0] q
);

    always @(posedge clk or posedge areset) begin
        if (areset)
            q <= 8'b0;
        else
            q <= d;
    end

endmodule
