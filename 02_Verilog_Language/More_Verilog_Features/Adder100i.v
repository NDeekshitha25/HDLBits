// Ripple-carry adder using 100 full adders
// Each stage passes carry to next (cin → cout chain)

// Problem:
// Add two 100-bit numbers with carry-in
// Output sum and carry from each stage

// Note:
// Behavioral solution using loops works logically,
// but problem requires instantiating full adders.

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);

    wire [99:0] carry;

    genvar i;
    generate
        for(i = 0; i < 100; i = i + 1) begin : fa_chain
            if (i == 0)
                full_adder fa(a[i], b[i], cin, sum[i], carry[i]);
            else
                full_adder fa(a[i], b[i], carry[i-1], sum[i], carry[i]);
        end
    endgenerate

    assign cout = carry;

endmodule


// Full Adder Module
module full_adder(
    input a, b, cin,
    output sum, cout
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule
