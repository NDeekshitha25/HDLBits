/*
============================================================
HDLBits Problem: Exams/m2014_q4b

Description:
Implement a D Flip-Flop with:
    - positive edge clock
    - asynchronous reset

============================================================
Theory

D Flip-Flop

On every positive clock edge:

    q <= d

------------------------------------------------------------
Asynchronous Reset

An asynchronous reset acts immediately,
without waiting for clock edge.

    ar = 1
        q <= 0

Because reset is asynchronous,
it must appear in sensitivity list.

------------------------------------------------------------
Sensitivity List

    @(posedge clk or posedge ar)

Triggers on:
    - rising edge of clk
    - rising edge of ar

============================================================
*/

module top_module (
    input clk,
    input d,
    input ar,   // asynchronous reset
    output reg q
);

    always @(posedge clk or posedge ar) begin

        if (ar)
            q <= 1'b0;

        else
            q <= d;

    end

endmodule
