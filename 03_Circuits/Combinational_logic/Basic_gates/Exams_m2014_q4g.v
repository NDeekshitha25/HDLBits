// Combination of XOR and XNOR operations

// Problem:
// Implement the given circuit with three inputs

// Note:
// (in1 ^ in2) → XOR
// ~(in1 ^ in2) → XNOR
// Final output = (in1 XNOR in2) XOR in3

module top_module (
    input in1,
    input in2,
    input in3,
    output out
);

    assign out = (~(in1 ^ in2)) ^ in3;

endmodule
