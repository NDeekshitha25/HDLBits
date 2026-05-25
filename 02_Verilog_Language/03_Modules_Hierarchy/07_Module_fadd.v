// HDLBits Problem: module_fadd
// Build a 32-bit adder using two add16 modules.
// Also implement a 1-bit full adder (add1).

// Concept:
// add16 internally uses 16 full adders (add1).
// We provide the definition of add1 here.
// Two add16 blocks are chained to form a 32-bit adder.

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cout, cout1;

    // Lower 16-bit addition
  add16 inst1 (a[15:0],  b[15:0],  1'b0, sum[15:0],  cout1);

    // Upper 16-bit addition
  add16 inst2 (a[31:16], b[31:16], cout1, sum[31:16], cout);

endmodule


// 1-bit Full Adder
module add1 (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule
