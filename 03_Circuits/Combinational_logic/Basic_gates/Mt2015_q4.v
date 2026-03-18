// Combined logic using expressions equivalent to modules A and B

// Problem:
// Build top-level circuit using logic from subcircuits A and B

// Note:
// A: (x ^ y) & x
// B: x == y (XNOR)
// Direct logic used instead of instantiation (accepted in HDLBits)

module top_module (input x, input y, output z);

    wire a1, a2, b1, b2;
    wire y1, y2;

    assign a1 = (x ^ y) & x;
    assign a2 = (x ^ y) & x;

    assign b1 = (x == y);
    assign b2 = (x == y);

    assign y1 = a1 | b1;
    assign y2 = a2 & b2;

    assign z = y1 ^ y2;

endmodule
