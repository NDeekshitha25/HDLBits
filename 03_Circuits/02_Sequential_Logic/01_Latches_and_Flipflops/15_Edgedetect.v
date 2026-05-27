/*
============================================================
HDLBits Problem: Edgedetect (8-bit)
============================================================

Theory:

We detect a 0 → 1 transition (positive edge) for each bit.

Key idea:
    Compare current input with previous clock cycle input.

Let:
    in_prev = value of "in" from previous clock cycle

Then for each bit i:

    pedge[i] = 1 only when:
        in_prev[i] = 0  AND  in[i] = 1

So:
    pedge = in & ~in_prev

------------------------------------------------------------
Why this works:

- If signal stays 0 → 0 : no edge → output 0
- If signal stays 1 → 1 : already high → no new edge → 0
- If signal goes 1 → 0 : falling edge → not detected here → 0
- If signal goes 0 → 1 : rising edge → detect → 1

We store previous value using a flip-flop:

    in_prev <= in   (on every clock)

============================================================
*/

module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);

    reg [7:0] in_prev;

    always @(posedge clk) begin
        in_prev <= in;
        pedge   <= in & ~in_prev;
    end

endmodule
