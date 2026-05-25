  /*
============================================================
HDLBits Problem: Adder100

Description:
Create a 100-bit binary adder.

Inputs:
    a[99:0]
    b[99:0]
    cin

Outputs:
    sum[99:0]
    cout

------------------------------------------------------------
Theory

A binary adder performs:

    a + b + cin

Since the result may exceed 100 bits,
an extra carry-out bit is required.

------------------------------------------------------------
Key Verilog Concept

Verilog supports direct vector arithmetic.

By concatenating:
    {cout, sum}

we capture:
    - final carry bit
    - 100-bit sum

------------------------------------------------------------
Example

If:
    a   = 1111
    b   = 0001
    cin = 0

Result:
    10000

Here:
    cout = 1
    sum  = 0000

------------------------------------------------------------
Concepts Used

- Vector Arithmetic
- Binary Addition
- Concatenation
- Carry Propagation

============================================================
*/

module top_module( 
    input [99:0] a,
    input [99:0] b,
    input cin,
    output cout,
    output [99:0] sum
);

    assign {cout, sum} = a + b + cin;

endmodule
