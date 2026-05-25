/*
============================================================
HDLBits Problem: Adder3

Description:
Create a 3-bit ripple-carry adder using
three full adder instances.

Inputs:
    a[2:0]
    b[2:0]
    cin

Outputs:
    sum[2:0]
    cout[2:0]

------------------------------------------------------------
Theory

A ripple-carry adder connects multiple
full adders in series.

Carry propagation:
    FA0 carry -> FA1 carry -> FA2 carry

Each full adder computes:
    sum
    carry-out

------------------------------------------------------------
Connections

FA0:
    inputs  -> a[0], b[0], cin
    outputs -> sum[0], cout[0]

FA1:
    inputs  -> a[1], b[1], cout[0]
    outputs -> sum[1], cout[1]

FA2:
    inputs  -> a[2], b[2], cout[1]
    outputs -> sum[2], cout[2]

------------------------------------------------------------
Concepts Used

- Full Adder
- Ripple-Carry Adder
- Module Instantiation
- Carry Propagation

============================================================
*/
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    full_adder inst1 (a[0],b[0],cin,cout[0],sum[0]);
    full_adder inst2 (a[1],b[1],cout[0],cout[1],sum[1]);
    full_adder inst3 (a[2],b[2],cout[1],cout[2],sum[2]);
    
endmodule

module full_adder (
    input a,
    input b,
    input cin,
    output cout,
    output sum
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule
