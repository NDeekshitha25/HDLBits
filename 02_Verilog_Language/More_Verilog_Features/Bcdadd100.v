// BCD ripple-carry adder using 100 instances of bcd_fadd
// Each block adds one decimal digit (4 bits)

// Problem:
// Add two 100-digit BCD numbers (400-bit) with carry-in

// Note:
// - Each digit is 4 bits → total 100 digits
// - Carry ripples from one digit to next
// - Correct slicing is [i*4+3 : i*4]

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);

    wire [99:0] carry;

    genvar i;
    generate
        for(i = 0; i < 100; i = i + 1) begin : bcd_chain
            if (i == 0)
                bcd_fadd fa(a[3:0], b[3:0], cin, carry[0], sum[3:0]);
            else
                bcd_fadd fa(
                    a[i*4+3 : i*4],
                    b[i*4+3 : i*4],
                    carry[i-1],
                    carry[i],
                    sum[i*4+3 : i*4]
                );
        end
    endgenerate

    assign cout = carry[99];

endmodule
