/*
============================================================
HDLBits Problem: Rotate100
============================================================

Design:
100-bit rotator with:
    - synchronous load
    - rotate left
    - rotate right

Behavior:
- load = 1:
    load data[99:0] into q

- ena = 2'b01:
    rotate right by 1 bit

- ena = 2'b10:
    rotate left by 1 bit

- ena = 2'b00 or 2'b11:
    hold current value

Difference from a shifter:
- Shifter discards bits and inserts 0 (or sign bit)
- Rotator preserves all bits by wrapping around

Examples:

Right rotate:
    10110 -> 01011

Left rotate:
    10110 -> 01101

Priority:
    load > rotate

============================================================
*/

module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q
);

    always @(posedge clk) begin
        if (load)
            q <= data;
        else begin
            case (ena)
                2'b01: q <= {q[0], q[99:1]};
                2'b10: q <= {q[98:0], q[99]};
                default: q <= q;
            endcase
        end
    end

endmodule
