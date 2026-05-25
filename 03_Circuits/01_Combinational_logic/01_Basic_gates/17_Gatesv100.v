/*
============================================================
HDLBits Problem: Gatesv100

Description:
Given a 100-bit input vector, determine relationships
between neighbouring bits.

Outputs:
------------------------------------------------------------

1. out_both
   Each bit indicates whether BOTH the current bit
   and its left neighbour are 1.

   Example:
       out_both[98] = in[98] & in[99]

------------------------------------------------------------

2. out_any
   Each bit indicates whether ANY of the current bit
   and its right neighbour are 1.

   Example:
       out_any[2] = in[2] | in[1]

------------------------------------------------------------

3. out_different
   Each bit indicates whether the current bit is
   DIFFERENT from its left neighbour.

   XOR operation is used for comparison.

   Wraparound condition:
       in[99]'s neighbour is in[0]

------------------------------------------------------------
Concepts Used

- Vector slicing
- Bitwise AND
- Bitwise OR
- Bitwise XOR
- Vector concatenation
- Combinational logic

------------------------------------------------------------
Vector Logic Explanation

1. out_both

    in[98:0]  -> lower bits
    in[99:1]  -> shifted left neighbour bits

    AND operation compares adjacent bits.

------------------------------------------------------------

2. out_any

    OR operation checks whether at least one
    adjacent bit is 1.

------------------------------------------------------------

3. out_different

    XOR outputs:
        0 -> same
        1 -> different

    Concatenation:
        {in[0], in[99:1]}

    creates the wrapped neighbour vector.

============================================================
*/

module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different
);

    assign out_both = in[98:0] & in[99:1];

    assign out_any = in[99:1] | in[98:0];

    assign out_different = in ^ {in[0], in[99:1]};

endmodule
