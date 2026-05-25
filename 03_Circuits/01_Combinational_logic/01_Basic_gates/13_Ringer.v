// Ringer and Vibrate Control Circuit

// Description:
// When ring = 1:
//   - If vibrate_mode = 1 → motor ON
//   - Else → ringer ON
// Only one output active at a time

module top_module (
    input ring,
    input vibrate_mode,
    output ringer,
    output motor
);

    assign ringer = ring & (~vibrate_mode);
    assign motor  = ring & vibrate_mode;

endmodule
