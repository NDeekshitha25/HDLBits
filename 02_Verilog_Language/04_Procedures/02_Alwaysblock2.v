// HDLBits Problem: alwaysblock2
// Implement XOR gate using:
// 1. assign statement
// 2. combinational always block
// 3. clocked always block (flip-flop)

module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff
);

    // Continuous assignment (combinational)
    assign out_assign = a ^ b;

    // Combinational always block
    always @(*) out_always_comb = a ^ b;
    

    // Clocked always block (sequential - flip-flop)
    always @(posedge clk) out_always_ff <= a ^ b;


endmodule
