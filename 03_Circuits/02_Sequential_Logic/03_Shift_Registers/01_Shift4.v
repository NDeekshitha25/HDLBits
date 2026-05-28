/*
============================================================
HDLBits Problem: Shift4
============================================================

Design:
4-bit right shift register with:
    - asynchronous reset
    - synchronous load
    - shift enable

Behavior:
- areset = 1:
    immediately clears q to 0

- load = 1:
    loads data[3:0] into q

- ena = 1:
    performs logical right shift

Priority:
    reset > load > shift

Shift Example:
    q = 1011

    after shift:
    0101

Reason:
    - left side filled with 0
    - old q[0] discarded

============================================================
*/

module top_module(
    input clk,
    input areset,
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q
);

    always @(posedge clk or posedge areset) begin
        if (areset)
            q <= 4'b0000;

        else if (load)
            q <= data;

        else if (ena)
            q <= {1'b0, q[3:1]};
    end

endmodule
