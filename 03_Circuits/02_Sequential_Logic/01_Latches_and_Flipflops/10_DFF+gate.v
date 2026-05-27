/*
============================================================
HDLBits Problem: Exams/m2014_q4d
============================================================

Theory:

    out <= out ^ in

If:
    in = 0 -> out holds value

If:
    in = 1 -> out toggles

============================================================
*/

module top_module (
    input clk,
    input in,
    output reg out
);

    always @(posedge clk) begin
        out <= out ^ in;
    end

endmodule
