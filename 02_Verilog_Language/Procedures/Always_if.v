// HDLBits Problem: always_if
// Implement a 2-to-1 MUX using:
// 1. assign statement
// 2. combinational always block (if-else)
//
// Condition:
// Select b only when both sel_b1 and sel_b2 are 1
// Otherwise select a

module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always
);

    // Using assign (conditional operator)
    assign out_assign = (sel_b1 & sel_b2) ? b : a;

    // Using always block (if-else)
    always @(*) begin
        if (sel_b1 & sel_b2)
            out_always = b;
        else
            out_always = a;
    end

endmodule
