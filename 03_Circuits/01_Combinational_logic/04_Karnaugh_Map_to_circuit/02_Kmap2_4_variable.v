/*
============================================================
HDLBits Problem: Kmap2

Description:
Implement the logic circuit described
by the given 4-variable Karnaugh map.

============================================================
Theory

This solution uses Product-of-Sums (POS) form.

General POS structure:

    (term1) & (term2) & ...

Each bracket represents a maxterm obtained
from grouping 0's in the Karnaugh map.

============================================================
*/

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
);

    assign out =
        ((c | ~a | ~b) &
         (~c | ~d | a | b) &
         (c | ~d | ~b) &
         (~c | d | ~a));

endmodule
