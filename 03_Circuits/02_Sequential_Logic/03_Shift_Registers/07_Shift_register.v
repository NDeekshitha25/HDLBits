/*
============================================================
HDLBits Problem: 3-Stage Shift Register
============================================================

Design:
Three D flip-flops connected in series.

Behavior:
- Synchronous active-low reset
- Input shifts through three stages
- Output is taken from the last stage

Data Flow:

    in -> q[0] -> q[1] -> q[2] -> out

Delay:
    out reflects the input after
    three clock cycles.

============================================================
*/

module top_module (
    input clk,
    input resetn,
    input in,
    output out
);

    reg [2:0] q;

    always @(posedge clk) begin
        if (!resetn)
            q <= 3'b000;
        else begin
            q[0] <= in;
            q[1] <= q[0];
            q[2] <= q[1];
        end
    end

    assign out = q[2];

endmodule
