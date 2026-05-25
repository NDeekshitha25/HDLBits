// HDLBits Problem: module_cseladd
// Implement a 32-bit carry-select adder using three add16 modules.

// Concept:
// Lower 16-bit adder computes sum and carry.
// Two upper adders run in parallel assuming cin=0 and cin=1.
// A multiplexer selects the correct result based on carry.

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cout,cout1,cout2;
    wire [15:0] sum0, sum1;

    // Lower 16-bit addition
    add16 inst1 (a[15:0], b[15:0], 1'b0, sum[15:0], cout);

    // Upper 16-bit additions (parallel)
  add16 inst2 (a[31:16], b[31:16], 1'b0, sum0, cout1);
  add16 inst3 (a[31:16], b[31:16], 1'b1, sum1, cout2);

    // Multiplexer selects correct upper sum
    assign sum[31:16] = cout ? sum1 : sum0;

endmodule
