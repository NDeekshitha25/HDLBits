// NOR gate implementation

// Problem:
// Implement a 2-input NOR gate

// Note:
// ~| is a reduction NOR operator (unary), used like ~|vector
// It operates on a single vector and reduces it to 1 bit
// Example: ~|a = ~(a[0] | a[1] | ...)

// Invalid usage:
// in1 ~| in2   → syntax error in Verilog (not a binary operator)

// ✔ Correct implementation:
/// out = ~(in1 | in2)

module top_module (
    input in1,
    input in2,
    output out
);

    assign out = ~(in1 | in2);

endmodule
