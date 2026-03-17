// HDLBits Problem: alwaysblock1
// Implement an AND gate using both assign statement and always block

module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);

    // Using continuous assignment
    assign out_assign = a & b;

    // Using combinational always block
    always @(*) out_alwaysblock = a & b;

endmodule
