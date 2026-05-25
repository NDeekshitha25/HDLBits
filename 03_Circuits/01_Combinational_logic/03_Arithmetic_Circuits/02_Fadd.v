/*
============================================================
HDLBits Problem: Full Adder

Description:
Create a 1-bit full adder.

A full adder adds:
    - a
    - b
    - cin (carry-in)

Outputs:
    - sum
    - cout (carry-out)

------------------------------------------------------------
Logic

sum:
    XOR of all three inputs

cout:
    Carry generated when:
    - both a and b are 1
    OR
    - cin and (a ^ b) are 1

------------------------------------------------------------
Equations

sum  = a ^ b ^ cin

cout = (a & b) | (cin & (a ^ b))

------------------------------------------------------------
Concepts Used

- Full Adder
- XOR Logic
- Carry Generation
- Combinational Logic

============================================================
*/

module top_module( 
    input a,
    input b,
    input cin,
    output cout,
    output sum
);

    assign sum = a ^ b ^ cin;

    assign cout = (a & b) | (cin & (a ^ b));

endmodule
