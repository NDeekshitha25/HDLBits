/*
============================================================
HDLBits Problem: exams/ece241_2013_q2

Description:
Find the minimum:
    1. SOP (Sum-of-Products)
    2. POS (Product-of-Sums)

for the given truth table conditions.

============================================================
Theory

Given:

Output = 1 for:
    2, 7, 15

Output = 0 for:
    0, 1, 4, 5, 6, 9, 10, 13, 14

Don't-care conditions:
    3, 8, 11, 12

------------------------------------------------------------
K-map Simplification

Minimum SOP:

    out_sop = (c & d)
            | (~a & ~b & c)

------------------------------------------------------------
Minimum POS:

    out_pos = c
            & (~a | b)
            & (d | ~b)

------------------------------------------------------------
Concepts Used

- Karnaugh Maps
- SOP Minimization
- POS Minimization
- Don't-Care Conditions
- Boolean Reduction

============================================================
*/

module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
);

    assign out_sop =
        (c & d) |
        (~a & ~b & c);

    assign out_pos =
        c &
        (~a | b) &
        (d | ~b);

endmodule
