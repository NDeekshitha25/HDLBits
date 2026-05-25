// Simple buffer circuit
// Output directly follows input

// Problem:
// Implement the given circuit where output = input

// Note:
// This is a direct wire connection (no logic operation)

module top_module (
    input in,
    output out
);

    assign out = in;

endmodule
