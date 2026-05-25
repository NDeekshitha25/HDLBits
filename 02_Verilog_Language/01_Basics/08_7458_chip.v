/*
HDLBits Problem: 7458 Chip Implementation

The 7458 IC contains:
- Four AND gates
- Two OR gates

Structure of the circuit:

First Output:
(p1a & p1b & p1c) ----\
                       OR ----> p1y
(p1d & p1e & p1f) ----/

Second Output:
(p2a & p2b) ----\
                 OR ----> p2y
(p2c & p2d) ----/

Implementation Approach:
Intermediate wires are used to store the outputs of the AND gates
before feeding them into the OR gates.

Verilog Notes:

1. Wire Naming Rule
   Wire identifiers must start with a letter or underscore.
   They cannot start with numbers.

   Invalid:
       wire 1,2;

   Valid:
       wire w1, w2;

2. Each wire must be driven by exactly one source.

3. Continuous assignments (`assign`) represent hardware connections
   and are always active (they continuously drive the output).
*/

`default_nettype none

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);

    // Intermediate wires for AND gate outputs
    wire w1, w2, w3, w4;

    // AND gates
    assign w1 = p1a & p1b & p1c;
    assign w2 = p1d & p1e & p1f;
    assign w3 = p2a & p2b;
    assign w4 = p2c & p2d;

    // OR gates
    assign p1y = w1 | w2;
    assign p2y = w3 | w4;

endmodule
