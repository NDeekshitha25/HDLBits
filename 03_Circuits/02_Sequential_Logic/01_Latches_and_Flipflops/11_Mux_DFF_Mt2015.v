/*
============================================================
HDLBits Problem: Mt2015_muxdff
============================================================

Theory:

    L = 1 -> load r_in
    L = 0 -> load q_in

Data is updated on:
    posedge clk

============================================================
*/

module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q
);

    always @(posedge clk) begin

        if (L)
            Q <= r_in;

        else
            Q <= q_in;

    end

endmodule
