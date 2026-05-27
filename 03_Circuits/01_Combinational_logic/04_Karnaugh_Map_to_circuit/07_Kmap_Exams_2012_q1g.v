/*
============================================================
HDLBits Problem: exams/2012_q1g

Description:
Implement the Boolean function represented
by the given Karnaugh map.

============================================================
Theory

The minimized Sum-of-Products (SOP)
expression is:

    f = (x[3] & ~x[1])
      | (x[2] & x[3] & x[4])
      | (~x[4] & ~x[2])

Each product term corresponds to a grouped
region in the Karnaugh map.

------------------------------------------------------------
Concepts Used

- Karnaugh Maps
- SOP Simplification
- Boolean Algebra
- Logic Minimization

============================================================
*/

module top_module (
    input [4:1] x,
    output f
);

    assign f =
        (x[3] & ~x[1]) |
        (x[2] & x[3] & x[4]) |
        (~x[4] & ~x[2]);

endmodule
