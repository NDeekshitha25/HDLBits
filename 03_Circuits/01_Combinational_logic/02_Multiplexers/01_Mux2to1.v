/*
============================================================
HDLBits Problem: Mux2to1

Description:
Design a 1-bit 2-to-1 multiplexer.

Inputs:
    a   -> Input 0
    b   -> Input 1
    sel -> Select signal

Output:
    out -> Selected output

------------------------------------------------------------
Multiplexer Logic

If:
    sel = 0  -> choose a
    sel = 1  -> choose b

Truth Table
------------------------------------------------------------

sel | out
----|-----
 0  |  a
 1  |  b

------------------------------------------------------------
Boolean Equation

out = (~sel & a) | (sel & b)

Explanation:

1. (~sel & a)
   - Passes 'a' when sel = 0

2. (sel & b)
   - Passes 'b' when sel = 1

3. OR operation combines both cases

------------------------------------------------------------
Concepts Used

- Multiplexer Design
- Boolean Algebra
- Combinational Logic
- AND, OR, NOT Gates

============================================================
*/

module top_module( 
    input a,
    input b,
    input sel,
    output out
);

    assign out = (~sel & a) | (sel & b);

endmodule
