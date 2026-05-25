/*
============================================================
HDLBits Problem: exams/m2014_q4j

Description:
Implement a 4-bit adder.

Inputs:
    x[3:0]
    y[3:0]

Output:
    sum[4:0]

------------------------------------------------------------
Theory

Adding two 4-bit numbers can produce
a 5-bit result because of carry overflow.

Example:

    1111
  + 1111
  -------
   11110

So output width must be 5 bits.

------------------------------------------------------------
Verilog Addition

Verilog supports direct binary addition
using the '+' operator.

The synthesizer automatically creates
the required adder hardware.

------------------------------------------------------------
Concepts Used

- Binary Addition
- Ripple-Carry Addition
- Vector Arithmetic
- Combinational Logic

============================================================
*/

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum
);

    assign sum = x + y;

endmodule
