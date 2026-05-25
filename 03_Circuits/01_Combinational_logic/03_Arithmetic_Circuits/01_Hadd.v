/*
============================================================
HDLBits Problem: Half Adder

Description:
Design a half adder.

A half adder adds two 1-bit binary inputs
and produces:
    - Sum
    - Carry-out

Inputs:
    a
    b

Outputs:
    sum
    cout

------------------------------------------------------------
Half Adder Theory

Binary Addition Rules

a b | sum cout
----------------
0 0 |  0    0
0 1 |  1    0
1 0 |  1    0
1 1 |  0    1

------------------------------------------------------------
Logic Equations

1. Sum

The sum bit is HIGH when inputs are different.

XOR operation performs this:

    sum = a ^ b

------------------------------------------------------------
2. Carry-out

Carry is generated only when both inputs are 1.

AND operation performs this:

    cout = a & b

------------------------------------------------------------
Concepts Used

- Half Adder
- Binary Addition
- XOR Gate
- AND Gate
- Combinational Logic

============================================================
*/

module top_module( 
    input a,
    input b,
    output cout,
    output sum
);

    assign sum  = a ^ b;
    assign cout = a & b;

endmodule
