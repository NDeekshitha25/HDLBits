/*
============================================================
HDLBits Problem: Mux9to1v

Description:
Design a 16-bit wide 9-to-1 multiplexer.

Inputs:
    a, b, c, d, e, f, g, h, i  -> 16-bit inputs
    sel                        -> 4-bit select line

Output:
    out                        -> Selected 16-bit output

------------------------------------------------------------
Multiplexer Theory

A multiplexer (MUX) selects one input from multiple
inputs and forwards it to the output.

A 9-to-1 multiplexer means:
    - 9 input sources
    - 1 output
    - selection controlled using sel

------------------------------------------------------------
Selection Logic

sel value    Output
--------------------------------
0000         a
0001         b
0010         c
0011         d
0100         e
0101         f
0110         g
0111         h
1000         i

Unused Cases:
1001 to 1111 -> output all 1's

------------------------------------------------------------
Why always @(*) is Used

Since:
    - output depends on multiple conditions
    - case statement is used

Combinational always block is appropriate.

------------------------------------------------------------
Why output reg is Needed

Signals assigned inside an always block
must be declared as reg.

Example:
    output reg [15:0] out;

------------------------------------------------------------
Default Case

For invalid selections:
    sel = 9 to 15

Problem statement requires:
    all output bits = 1

16-bit all ones:
    16'hFFFF

------------------------------------------------------------
Concepts Used

- Multiplexers
- Case Statements
- Combinational Logic
- always @(*)
- reg datatype
- Hexadecimal constants

============================================================
*/

module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output reg [15:0] out
);

    always @(*) begin
        case(sel)
            4'd0: out = a;
            4'd1: out = b;
            4'd2: out = c;
            4'd3: out = d;
            4'd4: out = e;
            4'd5: out = f;
            4'd6: out = g;
            4'd7: out = h;
            4'd8: out = i;

            default: out = 16'hFFFF;
        endcase
    end

endmodule
