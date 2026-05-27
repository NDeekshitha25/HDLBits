/*
============================================================
HDLBits Problem: Edgedetect2
============================================================

Theory:

We detect ANY transition (0→1 OR 1→0) for each bit.

Key idea:
    Compare current value with previous clock cycle value.

Let:
    in_last = input sampled at previous clock edge

Then:

    anyedge[i] = 1 when in[i] changes
                = 1 when in[i] XOR in_last[i]

So:
    anyedge = in ^ in_last

------------------------------------------------------------
Why XOR works:

Truth table per bit:

in_last  in   XOR (anyedge)
   0      0       0   (no change)
   0      1       1   (rising edge)
   1      0       1   (falling edge)
   1      1       0   (no change)

So XOR naturally detects any transition.

============================================================
*/

module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    reg [7:0] in_last;

    always @(posedge clk) begin
        in_last <= in;
        anyedge <= in ^ in_last;
    end

endmodule
