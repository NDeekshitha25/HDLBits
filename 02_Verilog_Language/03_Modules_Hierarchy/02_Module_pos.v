// HDLBits Problem: module_pos
// Goal: Instantiate module mod_a and connect ports by position.

// Concept:
// In Verilog, module ports can be connected in two ways:
// 1) By position
// 2) By name
//
// This problem requires connection by POSITION.
// The order of signals must exactly match the order
// of ports defined in the module.

// Given module:
// module mod_a ( output, output, input, input, input, input );

// Port order:
// 1 → output
// 2 → output
// 3 → input
// 4 → input
// 5 → input
// 6 → input

// Therefore connections are:
// out1 → output1
// out2 → output2
// a → input1
// b → input2
// c → input3
// d → input4

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    mod_a inst1 (out1, out2, a, b, c, d);

endmodule
