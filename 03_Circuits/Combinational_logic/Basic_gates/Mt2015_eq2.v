// Equality comparator for 2-bit inputs

// Problem:
// Output z = 1 if A == B, else 0

// Note:
// (A == B) directly returns 1 or 0

module top_module (
    input [1:0] A,
    input [1:0] B,
    output z
);

    assign z = (A == B);

endmodule
