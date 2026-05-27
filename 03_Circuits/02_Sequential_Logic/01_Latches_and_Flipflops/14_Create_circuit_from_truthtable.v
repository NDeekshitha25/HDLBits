/*
============================================================
HDLBits Problem: Exams/ece241_2013_q7
============================================================

Theory:

JK flip-flop behavior:

J K | Q(next)
0 0 | Q(old)
0 1 | 0
1 0 | 1
1 1 | ~Q(old)

Implemented using a single D flip-flop:

    Q <= (J & ~Q) | (~K & Q)

============================================================
*/

module top_module (
    input clk,
    input j,
    input k,
    output reg Q
);

    always @(posedge clk) begin
        Q <= (j & ~Q) | (~k & Q);
    end

endmodule
