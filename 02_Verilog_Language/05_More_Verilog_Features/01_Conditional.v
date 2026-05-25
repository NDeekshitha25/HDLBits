// Uses conditional (?:) operator which acts like a mux
// Build 2-input minimum blocks, then combine for 4 inputs

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min
);

    wire [7:0] w1, w2;

    assign w1 = (a < b) ? a : b;  // min(a,b)
    assign w2 = (c < d) ? c : d;  // min(c,d)

    assign min = (w1 < w2) ? w1 : w2;  // final minimum

endmodule
