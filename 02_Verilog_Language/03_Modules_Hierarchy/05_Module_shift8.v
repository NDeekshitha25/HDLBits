// HDLBits Problem: module_shift8
// Build a 3-stage 8-bit shift register using my_dff8 modules
// and select output using a 4-to-1 multiplexer.

// Concept:
// Data passes through three 8-bit D flip-flop stages.
// A multiplexer selects the output based on sel:
// 00 → input d (0 delay)
// 01 → after 1 FF (w1)
// 10 → after 2 FFs (w2)
// 11 → after 3 FFs (q0)

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);

    wire [7:0] w1, w2, q0;   // intermediate stages

    // 3-stage shift register
    my_dff8 ff1 (clk, d,  w1);
    my_dff8 ff2 (clk, w1, w2);
    my_dff8 ff3 (clk, w2, q0);

    // 4-to-1 multiplexer
    always @(*) begin
        case(sel)
            2'b00: q = d;
            2'b01: q = w1;
            2'b10: q = w2;
            2'b11: q = q0;
        endcase
    end

endmodule
