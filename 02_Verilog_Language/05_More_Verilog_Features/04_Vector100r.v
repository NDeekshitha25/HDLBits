// Reverses bit order of a 100-bit vector
// out[i] = in[99-i]

// Problem:
// Reverse the bit ordering of a 100-bit input vector

// Note:
// Do NOT use out = ~in;
// ~in performs bitwise inversion (flips 0↔1),
// but this problem requires reversing bit positions, not values.

module top_module( 
    input [99:0] in,
    output reg [99:0] out
);

    integer i;

    always @(*) begin
        for(i = 0; i < 100; i = i + 1)
            out[99 - i] = in[i];
    end

endmodule
