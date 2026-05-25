/*
============================================================
HDLBits Problem: gatesv

Description:
Given a 4-bit input vector, generate outputs describing
relationships between neighbouring bits.

Outputs:
1. out_both
   - AND with left neighbour

2. out_any
   - OR with right neighbour

3. out_different
   - XOR with left neighbour
   - Wrap around for bit 3

------------------------------------------------------------
Logic

out_both:
    out_both[i] = in[i] & in[i+1]

out_any:
    out_any[i] = in[i] | in[i-1]

out_different:
    XOR checks whether two bits are different.

------------------------------------------------------------
Concepts Used
- Vector slicing
- Bitwise operators
- XOR logic
- Concatenation operator

============================================================
*/

module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different
);

    assign out_both = in[2:0] & in[3:1];
    assign out_any = in[3:1] | in[2:0];
    assign out_different = in ^ {in[0], in[3:1]};

endmodule
