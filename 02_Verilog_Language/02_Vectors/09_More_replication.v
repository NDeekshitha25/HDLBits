// HDLBits Problem: Vector5
// Goal: Compute all 25 pairwise comparisons of the five 1-bit inputs.
// The output bit should be 1 if the two compared bits are equal.

// Inputs:  a b c d e
// Total comparisons: 5 × 5 = 25

// Concept Used:
// 1. Replication Operator {n{vector}} → repeats a vector n times
// 2. Concatenation Operator {a,b,c} → joins signals together
// 3. Equality check can be done using XNOR
//      a == b  →  ~(a ^ b)

// Strategy:
// Create two 25-bit vectors:
//
// Vector A:
// aaaaa bbbbb ccccc ddddd eeeee
// {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}}
//
// Vector B:
// abcde abcde abcde abcde abcde
// {5{a,b,c,d,e}}
//
// XOR the vectors to find differences,
// then invert (~) to obtain equality (XNOR).

module top_module (
    input a, b, c, d, e,
    output [24:0] out
);

    assign out = ~{{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}}
                 ^ {5{a,b,c,d,e}};

endmodule
