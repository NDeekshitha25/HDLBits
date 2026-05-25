// HDLBits Problem: module_name
// Instantiate mod_a and connect ports using named port mapping.

// Concept:
// Named port mapping uses .port_name(signal_name)
// Order of ports does not matter.

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    mod_a inst1 (.out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d));

endmodule
