/*
HDLBits Problem: Wire

Create a module with one input and one output that behaves like a wire.
The output simply follows the input.
*/

module top_module(
    input in,
    output out
);

    assign out = in;

endmodule
