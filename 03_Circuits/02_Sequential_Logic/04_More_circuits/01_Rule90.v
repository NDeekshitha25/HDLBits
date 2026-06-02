/*
============================================================
HDLBits Problem: Rule90
============================================================

Design:
512-cell one-dimensional cellular automaton.

Rule 90:

    next[i] = left_neighbor ^ right_neighbor

The current cell value is NOT used.

Boundary Conditions:

    q[-1]  = 0
    q[512] = 0

Examples:

    left center right -> next

       1      1    = 0
       1      0    = 1
       0      1    = 1
       0      0    = 0

Equivalent Formula:

    next = (q << 1) ^ (q >> 1)

because:

    (q << 1) provides left neighbors
    (q >> 1) provides right neighbors

============================================================
*/

module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
);

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            q <= (q << 1) ^ (q >> 1);
    end

endmodule
