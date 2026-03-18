// XNOR logic implementation

// Problem:
// Implement circuit from waveform

// Note:
// Output is 1 when inputs are equal
// Equivalent to XNOR operation

module top_module (
    input x,
    input y,
    output z
);

    assign z = ((~x) & (~y)) | (x & y);

endmodule
