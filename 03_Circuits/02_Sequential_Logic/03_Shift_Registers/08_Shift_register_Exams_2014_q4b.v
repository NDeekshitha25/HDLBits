Exams/2014 q4b
exams/m2014_q4kPreviousNextexams/ece241_2013_q12
Consider the n-bit shift register circuit shown below:



Write a top-level Verilog module (named top_module) for the shift register, assuming that n = 4. Instantiate four copies of your MUXDFF subcircuit in your top-level module. Assume that you are going to implement the circuit on the DE2 board.

Connect the R inputs to the SW switches,
clk to KEY[0],
E to KEY[1],
L to KEY[2], and
w to KEY[3].
Connect the outputs to the red lights LEDR[3:0].
(Reuse your MUXDFF from exams/2014_q4a.)

Module Declaration
module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
Write your solution here

[Load a previous submission]
Load
LEDR[1]
module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF(KEY[0], KEY[3], SW[3], KEY[1], KEY[2], LEDR[3]);
    MUXDFF(KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2]);
    MUXDFF(KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1]);
    MUXDFF(KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0]);
​
endmodule
​
module MUXDFF (    
    input clk,
    input w, R, E, L,
    output Q
);
    always @(posedge clk) begin
​
        if (L)
            Q <= R;
​
        else if (E)
            Q <= w;
​
    end
endmodule
