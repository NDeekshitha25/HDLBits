/*
HDLBits Problem: Declaring Wires

Goal:
Implement the circuit using intermediate wires that connect the outputs
of AND gates to an OR gate, and then generate the inverted output.

Boolean Function:
out   = (a & b) | (c & d)
out_n = ~out

Implementation Note:
This version first creates NAND results and then inverts them
to obtain the AND outputs before the OR stage.

Warnings / Important Verilog Rules:

1. Wire Naming Rules
   - A wire identifier must start with a letter or underscore.
   - It cannot start with a number.

   Invalid examples:
       wire 1,2;       // ❌ Not allowed
       wire 5temp;     // ❌ Not allowed

   Valid examples:
       wire w1, w2;    // ✔ Allowed
       wire temp1;     // ✔ Allowed

2. Every wire must have exactly one driver.
   Multiple drivers for the same wire can cause conflicts.

3. A wire can feed multiple gates, but it should be assigned
   from only one source.

*/

`default_nettype none

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n
);

    // Intermediate wires connecting logic stages
    wire w1, w2;

    // NAND operations
    assign w1 = a&b;
    assign w2 = c&d;

    // OR stage using inverted intermediate results
    assign out = w1|w2;

    // Complement output
    assign out_n = ~out;

endmodule
