/*
============================================================
HDLBits Problem: Exams/ece241_2014_q4
============================================================

Theory:

3-state register update on posedge clk:

    Q[0] <= Q[0] ^ x
    Q[1] <= (~Q[1]) & x
    Q[2] <= (~Q[2]) | x

Output:

    z = NOR of all Q bits
      = ~(Q[0] | Q[1] | Q[2])

Initial state:
    Q = 3'b000 (assumed reset before start)
============================================================
*/

module top_module (
    input clk,
    input x,
    output z
);

    reg [2:0] Q;

    always @(posedge clk) begin
        Q[0] <= Q[0] ^ x;
        Q[1] <= ~Q[1] & x;
        Q[2] <= ~Q[2] | x;
    end

    assign z = ~(|Q);

endmodule
