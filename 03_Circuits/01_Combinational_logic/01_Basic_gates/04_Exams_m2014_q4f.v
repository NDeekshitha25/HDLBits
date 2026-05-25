// AND-NOT logic implementation
// Output is high only when in1 = 1 and in2 = 0

// Problem:
// Implement the given circuit with two inputs

// Note:
// ~in2 inverts in2
// Final output = in1 AND (NOT in2)

module top_module (
    input in1,
    input in2,
    output out
);

    assign out = in1 & (~in2);

endmodule
