/*
============================================================
HDLBits Problem: Rule110
============================================================

Design:
512-cell one-dimensional cellular automaton.

Rule 110:

    Left Center Right -> Next

       111 -> 0
       110 -> 1
       101 -> 1
       100 -> 0
       011 -> 1
       010 -> 1
       001 -> 1
       000 -> 0

Boundary Conditions:

    q[-1]  = 0
    q[512] = 0

Optimization:

For each cell:

    If Left = 0:
        Next = Center OR Right

    If Left = 1:
        Next = Center XOR Right

This allows the entire 512-bit next state
to be computed using vector operations.

Definitions:

    Center = q
    Right  = {q[510:0], 1'b0}
    Left   = {1'b0, q[511:1]}

Rule110:

    Next =
        ((Center ^ Right) & Left)
      | ((Center | Right) & ~Left)

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
        else begin
            q <= (
                    ((q ^ {q[510:0], 1'b0}) & {1'b0, q[511:1]})
                  | ((q | {q[510:0], 1'b0}) & ~{1'b0, q[511:1]})
                 );
        end
    end

endmodule
