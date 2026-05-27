/*
============================================================
HDLBits Problem: Countslow
============================================================

Theory:

This is a decade counter (0 → 9) with an enable signal.

Key signals:

reset:
    - synchronous reset
    - q = 0

slowena:
    - when 1 → counter increments
    - when 0 → counter holds its value

Wrap condition:
    - when q == 9 and slowena == 1 → go back to 0

============================================================
*/

module top_module (
    input clk,
    input slowena,
    input reset,
    output reg [3:0] q
);

    always @(posedge clk) begin

        if (reset)
            q <= 4'd0;

        else if (slowena) begin
            if (q == 4'd9)
                q <= 4'd0;
            else
                q <= q + 1'b1;
        end

        // else: hold value implicitly

    end

endmodule
