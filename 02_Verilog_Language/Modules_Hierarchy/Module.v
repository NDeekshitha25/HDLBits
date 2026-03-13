// HDLBits Problem: module_pos
// Goal: Instantiate the submodule mod_a and connect it to the top-level ports.

// Concept:
// Larger circuits are created by instantiating smaller modules.
// The internal code of the module is not required to use it.
// Only the port interface matters.

// Module mod_a ports:
// in1  -> input
// in2  -> input
// out  -> output

// Using named port connections:
// .port_name(signal_name)

module top_module ( input a, input b, output out );

    mod_a inst2 ( .in1(a), .in2(b), .out(out) );

endmodule
