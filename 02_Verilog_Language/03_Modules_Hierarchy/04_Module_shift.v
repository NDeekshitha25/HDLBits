// HDLBits Problem: module_shift
// Build a 3-stage shift register using three my_dff modules.

// Concept:
// A shift register passes data through a chain of flip-flops.
// Each clock edge moves the data one stage forward.

// Structure:
// d → FF1 → FF2 → FF3 → q
// Internal wires connect the flip-flops.

module top_module ( input clk, input d, output q );

    wire w1, w2;   // internal connections between flip-flops

    my_dff inst1 (clk, d,  w1);
    my_dff inst2 (clk, w1, w2);
    my_dff inst3 (clk, w2, q);

endmodule
