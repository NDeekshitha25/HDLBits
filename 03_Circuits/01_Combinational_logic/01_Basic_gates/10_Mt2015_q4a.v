// Logic implementation of z = (x ^ y) & x

// Problem:
// Implement the function z = (x XOR y) AND x

// Note:
// ^ → XOR operation
// Final output is high only when x=1 and x≠y

module top_module (
    input x,
    input y,
    output z
);

    assign z = (x ^ y) & x;

endmodule
