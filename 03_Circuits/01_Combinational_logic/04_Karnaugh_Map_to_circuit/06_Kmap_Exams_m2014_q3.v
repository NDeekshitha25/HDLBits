/*
============================================================
HDLBits Problem: exams/m2014_q3

Description:
Implement the logic function described
by the Karnaugh map.

The K-map contains don't-care conditions,
which may be used for simplification.

============================================================
Theory

Don't-care states allow larger groupings
inside the Karnaugh map, producing simpler
Boolean expressions.

The minimized SOP expression is:

    f = (x[3] & ~x[1])
      | (x[4] & x[2])

------------------------------------------------------------
Concepts Used

- Karnaugh Map Simplification
- Don't-Care Conditions
- Sum-of-Products (SOP)
- Boolean Algebra

============================================================
*/

module top_module (
    input [4:1] x,
    output f
);

    assign f =
        (x[3] & ~x[1]) |
        (x[4] & x[2]);

endmodule
