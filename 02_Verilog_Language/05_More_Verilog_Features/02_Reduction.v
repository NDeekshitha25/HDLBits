// Reduction operators apply a logic operation across all bits of a vector
// ^ (reduction XOR) computes XOR of all bits → a[7]^a[6]^...^a[0]
// Used for parity generation

// Problem:
// Generate an even parity bit for an 8-bit input.
// Parity bit = XOR of all input bits

module top_module (
    input [7:0] in,
    output parity
);

    assign parity = ^in;  // reduction XOR

endmodule
