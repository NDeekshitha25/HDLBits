/*
============================================================
HDLBits Problem: Edgecapture
============================================================

Theory:

We detect a falling edge (1 → 0) on each bit and "latch" it.

Step 1: Edge detection
    fall_event = in_last & ~in

Step 2: Capture behavior (SR flip-flop style)
    out is set when fall_event = 1
    out stays 1 until reset

Step 3: Reset behavior (synchronous, highest priority)
    if reset == 1:
        out = 0

Priority rule:
    reset overrides set event

============================================================
*/

module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);

    reg [31:0] in_last;

    always @(posedge clk) begin

        if (reset)
            out <= 32'b0;

        else begin
            in_last <= in;
            out <= out | (in_last & ~in);
        end

    end

endmodule
