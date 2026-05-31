/*
============================================================
HDLBits Problem: exams/ece241_2013_q12
============================================================

Design:
8-bit shift register used as a small memory.

Inputs:
    S      -> serial data input
    enable -> shift enable

Shift Operation:

    S -> Q[0] -> Q[1] -> ... -> Q[7]

When enable = 1:
    Q[0] receives S
    Other bits shift right

Read Operation:

    ABC selects which memory bit
    appears at output Z.

Address Mapping:

    ABC=000 -> Z=Q[0]
    ABC=001 -> Z=Q[1]
    ...
    ABC=111 -> Z=Q[7]

Equivalent Hardware:
    8-bit shift register
    +
    8-to-1 multiplexer

============================================================
*/

module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z
);

    reg [7:0] q;

    always @(posedge clk) begin
        if (enable) begin
            q[0] <= S;
            q[7:1] <= q[6:0];
        end
    end

    assign Z = q[{A,B,C}];

endmodule
