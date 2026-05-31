/*
============================================================
HDLBits Problem: Shift18
============================================================

Design:
64-bit shift register with:
    - synchronous load
    - left shift by 1
    - left shift by 8
    - arithmetic right shift by 1
    - arithmetic right shift by 8

Behavior:
- load = 1:
    load data into q

- ena = 1:
    perform shift selected by amount

amount:
    00 -> left shift by 1
    01 -> left shift by 8
    10 -> arithmetic right shift by 1
    11 -> arithmetic right shift by 8

Arithmetic Right Shift:
    preserves sign bit (q[63])

Example:
    10010000 >>> 1
    =
    11001000

Difference from Rotate:
    - Rotate wraps bits around
    - Shift discards bits

============================================================
*/

module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q
);

    always @(posedge clk) begin
        if (load)
            q <= data;

        else if (ena) begin
            case (amount)
                2'b00: q <= q << 1;
                2'b01: q <= q << 8;
                2'b10: q <= $signed(q) >>> 1;
                2'b11: q <= $signed(q) >>> 8;
            endcase
        end
    end

endmodule
