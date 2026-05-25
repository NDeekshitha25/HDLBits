// HDLBits Problem: always_case2
// 4-bit Priority Encoder using casez
//
// Theory (minimal):
// - casez allows '?' as don't-care bits
// - case executes top-to-bottom → defines priority
// - Higher bit has higher priority here (in[3] → in[0])
// - First matching pattern is selected

module top_module (
    input [3:0] in,
    output reg [1:0] pos
);

    always @(*) begin
        casez (in)
            4'b1000: pos = 2'd3;
            4'b?100: pos = 2'd2;
            4'b??10: pos = 2'd1;
            4'b???1: pos = 2'd0;
            default: pos = 2'd0;
        endcase
    end

endmodule
