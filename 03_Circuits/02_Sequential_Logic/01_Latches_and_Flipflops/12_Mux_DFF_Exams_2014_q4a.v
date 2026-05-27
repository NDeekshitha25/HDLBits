/*
============================================================
HDLBits Problem: Exams/2014_q4a
============================================================

Theory:

    L = 1 -> parallel load R
    L = 0 and E = 1 -> shift in w
    L = 0 and E = 0 -> hold value

Updated on:
    posedge clk

============================================================
*/

module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);

    always @(posedge clk) begin

        if (L)
            Q <= R;

        else if (E)
            Q <= w;

    end

endmodule
