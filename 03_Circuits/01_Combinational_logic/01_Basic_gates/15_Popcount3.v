/*
============================================================
HDLBits Problem: Population Count (3-bit)

Description:
A population count circuit counts the number of bits
that are equal to '1' in the input vector.

Input:
    in[2:0]

Output:
    out[1:0]

------------------------------------------------------------
Explanation

We must count how many 1's exist in a 3-bit input.

Possible cases:

in      Number of 1's     out
--------------------------------
000          0            00
001          1            01
010          1            01
011          2            10
100          1            01
101          2            10
110          2            10
111          3            11

Since the maximum count is 3, we need 2 bits
to represent the output.

------------------------------------------------------------
Logic

Each input bit contributes either:
- 0
- 1

So we can directly add the bits:

out = in[0] + in[1] + in[2]

Verilog automatically performs binary addition.

------------------------------------------------------------
Concepts Used
- Combinational Logic
- Vector Indexing
- Binary Addition
- Population Count (Hamming Weight)

============================================================
*/

module top_module( 
    input [2:0] in,
    output [1:0] out
);
  
    assign out = in[0] + in[1] + in[2];
  /*assign out[0] = (~in[2] & ~in[1] & in[0]) | (~in[2] & in[1] & ~in[0]) | (in[2] & ~in[1] & ~in[0]) | (in[2] & in[1] & in[0]);
	assign out[1] = (in[1] & in[0]) | (in[2] & in[0]) | (in[2] & in[1]); */
endmodule
