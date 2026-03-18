// Truth table implementation using sum-of-products (SOP)

// Problem:
// Implement the given truth table using combinational logic

// Note:
// Output is 1 for input combinations:
// 010, 011, 101, 111

module top_module( 
    input x3,
    input x2,
    input x1,
    output f
);

    assign f = (~x3 & x2 & ~x1) |
               (~x3 & x2 &  x1) |
               ( x3 & ~x2 & x1) |
               ( x3 &  x2 & x1);

endmodule
