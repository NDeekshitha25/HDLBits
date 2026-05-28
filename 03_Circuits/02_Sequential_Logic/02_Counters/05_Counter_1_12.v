/*
============================================================
HDLBits Problem: Exams/ece241_2014_q7a
============================================================

Goal:
Build a 1–12 counter using a given 4-bit counter module.

Rules:
- Q is NOT manually updated
- Must use count4 module
- Counter cycles: 1 → 2 → ... → 12 → 1
- reset forces Q = 1
- enable controls counting
============================================================
*/

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);

    // Internal counter control

    assign c_enable = enable;

    // Load when reset OR when reaching 12 while enabled
    assign c_load = reset | (enable & (Q == 4'd12));

    // Load value is always 1
    assign c_d = 4'd1;

    // Provided counter module
    count4 the_counter (
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(Q)
    );

endmodule
