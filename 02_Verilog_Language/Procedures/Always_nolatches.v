// HDLBits Problem: always_nolatches
// Detect arrow keys from PS/2 scancode
//
// Theory (minimal):
// - Always assign default values to avoid latches
// - case selects which output becomes 1
// - Only one output is high at a time

module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up
);

    always @(*) begin
        // Default assignments (prevents latches)
        left  = 1'b0;
        down  = 1'b0;
        right = 1'b0;
        up    = 1'b0;

        case (scancode)
            16'he06b: left  = 1'b1;
            16'he072: down  = 1'b1;
            16'he074: right = 1'b1;
            16'he075: up    = 1'b1;
        endcase
    end

endmodule
