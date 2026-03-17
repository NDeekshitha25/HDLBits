// HDLBits Problem: module_add
// Build a 32-bit adder using two 16-bit add16 modules.

// Concept:
// Split inputs into lower and upper 16 bits.
// First adder computes lower 16 bits.
// Second adder computes upper 16 bits using carry from first.
// Final result is concatenation of upper and lower sums.

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] l, h;      // lower and upper sums
    wire cout1, cout2;     // carry signals

    // Lower 16-bit addition
    add16 low  (a[15:0],  b[15:0],  1'b0,  l, cout1);

    // Upper 16-bit addition (uses carry from lower)
    add16 high (a[31:16], b[31:16], cout1, h, cout2);

    // Combine results
    assign sum = {h, l};

endmodule
