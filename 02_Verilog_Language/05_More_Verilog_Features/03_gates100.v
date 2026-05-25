// Reduction operators apply a logic operation across all bits of a vector
// & → AND all bits, | → OR all bits, ^ → XOR all bits

// Problem:
// Given a 100-bit input, generate:
// 1. AND of all bits
// 2. OR of all bits
// 3. XOR of all bits

module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);

    assign out_and = &in;   // 100-input AND
    assign out_or  = |in;   // 100-input OR
    assign out_xor = ^in;   // 100-input XOR

endmodule
