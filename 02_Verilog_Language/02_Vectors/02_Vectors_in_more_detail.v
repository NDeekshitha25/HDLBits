/*
HDLBits Problem: Vector1

Goal:
Split a 16-bit input vector into two 8-bit outputs.

Input:
in[15:0]

Outputs:
out_hi -> upper byte  [15:8]
out_lo -> lower byte  [7:0]

Concepts Demonstrated:
1. Vector declaration
2. Part-select operator
3. Avoiding implicit nets using `default_nettype none

Vector Notes:

[15:0] means:
MSB = bit 15
LSB = bit 0

Lower byte  = bits [7:0]
Upper byte  = bits [15:8]

Important Verilog Practices:

1. Always disable implicit nets:
   `default_nettype none

   This prevents accidental creation of undeclared wires.

2. Vector slicing (part-select):
   vector[high:low]

   Example:
   in[7:0]   -> lower 8 bits
   in[15:8]  -> upper 8 bits

3. The direction of slicing must match the declaration.
   If a vector is declared [15:0], you must slice using [high:low].
*/

`default_nettype none

module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo
);

    // Lower byte
    assign out_lo = in[7:0];

    // Upper byte
    assign out_hi = in[15:8];

endmodule
