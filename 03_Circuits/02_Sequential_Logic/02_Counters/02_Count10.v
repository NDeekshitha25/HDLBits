/*
============================================================
HDLBits Problem: Count10
============================================================

Theory:

This is a modulo-10 counter (decade counter).

Behavior:

On every rising clock edge:
    - If reset = 1 → q = 0
    - Else if q == 9 → q = 0
    - Else → q = q + 1

Key idea:
    Counter runs: 0 → 9 → 0 → 1 → ...

So we explicitly detect terminal state (9).

============================================================
*/

module top_module (
    input clk,
    input reset,        // synchronous active-high reset
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset || q == 4'd9)
            q <= 4'd0;
        else
            q <= q + 1'b1;
    end

endmodule
