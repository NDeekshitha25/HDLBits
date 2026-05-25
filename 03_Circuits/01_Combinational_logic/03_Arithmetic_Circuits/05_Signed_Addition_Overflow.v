/*
============================================================
HDLBits Problem: exams/ece241_2014_q1c

Description:
Add two signed 8-bit 2's complement numbers
and detect signed overflow.

Inputs:
    a[7:0]
    b[7:0]

Outputs:
    s[7:0]
    overflow

------------------------------------------------------------
How To Approach This Problem

Step 1:
Perform normal binary addition.

    s = a + b

------------------------------------------------------------
Step 2:
Understand signed overflow.

In 2's complement arithmetic:

Overflow occurs when:
    - two positive numbers produce a negative result
    OR
    - two negative numbers produce a positive result

------------------------------------------------------------
Sign Bit

For 8-bit signed numbers:
    bit[7] is the sign bit

0 -> positive
1 -> negative

------------------------------------------------------------
Overflow Conditions

Case 1:
Positive + Positive = Negative

    a[7] = 0
    b[7] = 0
    s[7] = 1

------------------------------------------------------------

Case 2:
Negative + Negative = Positive

    a[7] = 1
    b[7] = 1
    s[7] = 0

------------------------------------------------------------
Combined Boolean Equation

overflow =
    (~a[7] & ~b[7] & s[7]) |
    ( a[7] &  b[7] & ~s[7])

------------------------------------------------------------
Concepts Used

- 2's Complement Arithmetic
- Signed Overflow Detection
- Binary Addition
- Boolean Logic

============================================================
*/

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);

    assign s = a + b;

    assign overflow =
        (~a[7] & ~b[7] & s[7]) |
        ( a[7] &  b[7] & ~s[7]);

endmodule
