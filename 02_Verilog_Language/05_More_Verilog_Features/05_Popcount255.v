// Population count counts number of 1s in a vector
// Uses loop to iterate through all bits and accumulate count

// Problem:
// Count number of '1's in a 255-bit input vector

// Note:
// - Cannot use reduction directly for count (only gives 1-bit result)
// - Original mistake: using 8'h(count) is invalid
// - 'out' must be reg since it's assigned in always block

module top_module( 
    input [254:0] in,
    output reg [7:0] out
);

    integer i;
    reg [7:0] count;

    always @(*) begin
        count = 0;
        for(i = 0; i < 255; i = i + 1)
            count = (in[i]) ? count + 1 : count;

        out = count;
    end

endmodule
