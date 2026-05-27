/*
============================================================
HDLBits Problem: Count1to10
============================================================

Theory:

This is a modulo-10 counter but shifted to start from 1.

Behavior:

On every rising clock edge:
    - If reset = 1 → q = 1
    - Else if q == 10 → wrap back to 1
    - Else → q = q + 1

Sequence:
    1 → 2 → 3 → ... → 10 → 1 → ...

Key idea:
    We explicitly detect terminal state (10).

============================================================
*/

module top_module (
    input clk,
    input reset,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset || q == 4'd10)
            q <= 4'd1;
        else
            q <= q + 1'b1;
    end

endmodule
