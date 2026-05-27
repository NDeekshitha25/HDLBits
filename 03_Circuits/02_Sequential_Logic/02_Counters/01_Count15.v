/*
============================================================
HDLBits Problem: Count15
============================================================

Theory:

This is a simple 4-bit synchronous binary counter.

Behavior:

On every rising clock edge:
    - If reset = 1 → counter goes to 0
    - Else         → counter increments by 1

Range:
    0 → 15 (wraps automatically due to 4-bit overflow)

Key point:
    4-bit register naturally overflows:
        15 + 1 = 0 (mod 16)

============================================================
*/

module top_module (
    input clk,
    input reset,      // synchronous active-high reset
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= q + 1'b1;
    end

endmodule
