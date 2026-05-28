/*
============================================================
HDLBits Problem: Exams/ece241_2014_q7b
============================================================

Goal:
- Convert 1000 Hz clock → 1 Hz pulse (OneHertz)
- Use chained BCD counters (mod-10)
- Generate enable signals for each stage
- OneHertz must be HIGH for exactly 1 cycle every second

============================================================
Theory:

We build a cascade of 3 BCD counters:

    counter0 → fastest digit (units)
    counter1 → tens
    counter2 → hundreds

Each counter:
    counts 0 → 9 (BCD)

Enable rules (ripple enable design):

    counter0 always enabled
    counter1 enabled when counter0 == 9
    counter2 enabled when counter0 == 9 AND counter1 == 9

OneHertz pulse:
    occurs when all counters reach 9 (999 condition)
============================================================
*/

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);

    wire [3:0] q0, q1, q2;

    // Counter 0 (units)
    bcdcount counter0 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[0]),
        .Q(q0)
    );

    // Counter 1 (tens)
    bcdcount counter1 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[1]),
        .Q(q1)
    );

    // Counter 2 (hundreds)
    bcdcount counter2 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[2]),
        .Q(q2)
    );

    // Enable chaining (ripple carry style)
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (q0 == 4'd9);
    assign c_enable[2] = (q0 == 4'd9) & (q1 == 4'd9);

    // 1 Hz pulse when full 999 rollover occurs
    assign OneHertz = (q0 == 4'd9) & (q1 == 4'd9) & (q2 == 4'd9);

endmodule
