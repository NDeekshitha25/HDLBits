/*
============================================================
HDLBits Problem: Exams/m2014_q4a

Description:
Implement a level-sensitive D latch.

============================================================
Theory

D Latch

A D latch is level-sensitive storage.

    ena = 1
        q follows d

    ena = 0
        q holds previous value

------------------------------------------------------------
Latch Inference

A latch is inferred when:
    - assignment is conditional
    - output is not assigned in all paths

No else condition is intentionally used.

------------------------------------------------------------
Non-Blocking Assignment

Even though latches are level-sensitive,
they are still sequential storage elements.

Use:
    <=

instead of:
    =

============================================================
*/

module top_module (
    input d,
    input ena,
    output reg q
);

    always @(*) begin

        if (ena)
            q <= d;

    end

endmodule
