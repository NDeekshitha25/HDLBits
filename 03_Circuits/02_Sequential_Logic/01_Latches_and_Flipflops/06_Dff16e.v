/*
============================================================
HDLBits Problem: Dff16e

Description:
Create 16 D Flip-Flops with:
    - synchronous active-low reset
    - byte enable control

============================================================
Theory

Byte Enable:

    byteena[0] -> controls lower byte
                  q[7:0]

    byteena[1] -> controls upper byte
                  q[15:8]

Only enabled bytes are updated.

------------------------------------------------------------
Active-Low Reset

    resetn = 0

resets all flip-flops to 0.

------------------------------------------------------------
Behavior

On positive clock edge:

    if resetn == 0
        q <= 0

    else
        update enabled bytes only

============================================================
*/

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);

    always @(posedge clk) begin

        if (!resetn)
            q <= 16'b0;

        else begin

            if (byteena[0])
                q[7:0] <= d[7:0];

            if (byteena[1])
                q[15:8] <= d[15:8];

        end
    end

endmodule
