/*
HDLBits Problem: Wire4

Create a module with 3 inputs and 4 outputs with the following connections:

a -> w
b -> x
b -> y
c -> z

Note:
Each connection must be written as a separate continuous assignment.
You cannot write chained assignments like: assign x = y = b;
*/

module top_module( 
    input a, b, c,
    output w, x, y, z
);

    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;

endmodule
