/*
============================================================
HDLBits Problem: Exams/m2014_q4c

Description:
Implement a D Flip-Flop with:
    - positive edge clock
    - synchronous reset

============================================================
Theory

D Flip-Flop

On every positive clock edge:

    q <= d

------------------------------------------------------------
Synchronous Reset

A synchronous reset only works
on the active clock edge.

    r = 1
        q <= 0

Otherwise:
    q <= d

------------------------------------------------------------
Sensitivity List

Since reset is synchronous,
only clock edge appears in:

    @(posedge clk)

============================================================
*/

module top_module (
    input clk,
    input d,
    input r,   // synchronous reset
    output reg q
);

    always @(posedge clk) begin

        if (r)
            q <= 1'b0;

        else
            q <= d;

    end

endmodule
