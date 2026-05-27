/*
============================================================
HDLBits Problem: Dualedge
============================================================

Problem Idea:

Normal flip-flops update on only ONE clock edge:
    - posedge clk
OR
    - negedge clk

But this question wants:
    q updates on BOTH edges.

------------------------------------------------------------
Important Constraint

This is NOT allowed in FPGA synthesis:

    always @(posedge clk or negedge clk)

because real FPGA hardware usually does not have
true dual-edge flip-flops.

So we must BUILD equivalent behavior manually.

============================================================
Approach 1 (Easy to Understand)
============================================================

Idea:

Use:
    - one flip-flop for posedge
    - one flip-flop for negedge

Then select output depending on clock level.

When clk = 1:
    use posedge register

When clk = 0:
    use negedge register

------------------------------------------------------------
Code:

module top_module (
    input clk,
    input d,
    output q
);

    reg pos_q, neg_q;

    always @(posedge clk)
        pos_q <= d;

    always @(negedge clk)
        neg_q <= d;

    assign q = clk ? pos_q : neg_q;

endmodule

------------------------------------------------------------
Limitation:

This can produce glitches because q depends directly on clk.

HDLBits expects a cleaner solution.

============================================================
Approach 2 (Expected HDLBits Solution)
============================================================

Idea:

Use two flip-flops:
    p -> updates on posedge
    n -> updates on negedge

Then combine them using XOR.

------------------------------------------------------------
Why XOR?

After posedge:
    p <= d ^ n

So:
    q = p ^ n
      = (d ^ n) ^ n
      = d

------------------------------------------------------------

After negedge:
    n <= d ^ p

So:
    q = p ^ n
      = p ^ (d ^ p)
      = d

Thus q becomes d after BOTH edges.

============================================================
Final Solution
============================================================
*/

module top_module (
    input clk,
    input d,
    output q
);

    reg p, n;

    always @(posedge clk)
        p <= d ^ n;

    always @(negedge clk)
        n <= d ^ p;

    assign q = p ^ n;

endmodule
