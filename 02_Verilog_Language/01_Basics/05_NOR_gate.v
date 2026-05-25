/*
HDLBits Problem: NOR Gate

Create a module that implements a NOR gate.

A NOR gate is an OR gate followed by an inversion.

Truth Table:
a b | out
0 0 | 1
0 1 | 0
1 0 | 0
1 1 | 0

Operator explanation:

|  -> OR operator
~  -> Bitwise NOT operator
!  -> Logical NOT operator

Difference between ~ and ! :

~ (bitwise NOT)
    Flips every bit of a value.
    Example:
    ~1'b0 = 1'b1
    ~1'b1 = 1'b0

! (logical NOT)
    Treats the value as TRUE or FALSE and returns a single-bit result.
    Example:
    !0 = 1
    !1 = 0

In simple 1-bit logic gates both often behave the same, but in multi-bit
signals they are different.
*/

module top_module(
    input a,
    input b,
    output out
);

    assign out = !(a | b);

endmodule
