// HDLBits Problem: module_addsub
// Build a 32-bit adder-subtractor using two add16 modules.

// Concept:
// To perform subtraction, invert b and add 1.
// This is done by XORing b with replicated sub and using sub as carry-in.
//
// sub = 0 → a + b
// sub = 1 → a + (~b) + 1 = a - b

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] bxorwithsub;   // b XOR sub (for inversion)
    wire cout, cout1;

    // XOR b with replicated sub
    assign bxorwithsub = b ^ {32{sub}};

    // Lower 16-bit operation
    add16 inst1 (a[15:0], bxorwithsub[15:0], sub, sum[15:0], cout1);

    // Upper 16-bit operation
    add16 inst2 (a[31:16], bxorwithsub[31:16], cout1, sum[31:16], cout);

endmodule
