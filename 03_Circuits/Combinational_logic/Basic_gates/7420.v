// Dual 4-input NAND gate implementation (7420 equivalent)

// Problem:
// Implement two independent 4-input NAND gates

// Note:
// NAND = NOT(AND of all inputs)

module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);

    assign p1y = ~(p1a & p1b & p1c & p1d);
    assign p2y = ~(p2a & p2b & p2c & p2d);

endmodule
