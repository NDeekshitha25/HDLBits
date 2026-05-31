/*
============================================================
HDLBits Problem: mt2015_lfsr
============================================================

Design:
3-bit LFSR built from three D flip-flops.

Inputs:
    SW[2:0]  = parallel load data (R)
    KEY[1]   = load enable (L)
    KEY[0]   = clock

Behavior:

L = 1:
    Load SW into register

L = 0:
    Advance LFSR state

Next-State Equations:

    Q0(next) = Q2
    Q1(next) = Q0
    Q2(next) = Q1 ^ Q2

Non-blocking assignments ensure all
equations use the OLD state values.

============================================================
*/

module top_module (
    input [2:0] SW,
    input [1:0] KEY,
    output reg [2:0] LEDR
);

    always @(posedge KEY[0]) begin

        if (KEY[1])
            LEDR <= SW;

        else begin
            LEDR[0] <= LEDR[2];
            LEDR[1] <= LEDR[0];
            LEDR[2] <= LEDR[1] ^ LEDR[2];
        end

    end

endmodule
