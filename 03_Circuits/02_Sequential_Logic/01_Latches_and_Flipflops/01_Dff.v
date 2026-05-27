/*
============================================================
HDLBits Problem: Dff

Description:
Create a single D Flip-Flop.

Inputs:
    clk -> clock signal
    d   -> input data

Output:
    q   -> stored output

============================================================
Theory

A D Flip-Flop stores 1 bit of data.

At every positive edge of the clock:
    q becomes d

------------------------------------------------------------
What is a Clock?

A clock is a periodic signal:

    0 -> 1 -> 0 -> 1 -> ...

Sequential circuits update only when
the clock edge occurs.

------------------------------------------------------------
posedge clk

Syntax:

    @(posedge clk)

Meaning:

    Execute the always block only when
    the clock changes from:
        0 -> 1

This is called the positive edge
or rising edge of the clock.

------------------------------------------------------------
always Block

Syntax:

    always @(posedge clk)

Used for:
    - Flip-flops
    - Registers
    - Sequential circuits

This tells Verilog:
    "Run this block whenever the clock rises."

------------------------------------------------------------
Non-Blocking Assignment

Syntax:

    <=

Example:

    q <= d;

Meaning:
    - d is sampled first
    - q updates after the clock edge

------------------------------------------------------------
Why Non-Blocking is Important

Sequential logic must update all registers
simultaneously.

Using:
    <=

models real hardware correctly.

------------------------------------------------------------
Blocking vs Non-Blocking

Blocking:
    =

Non-blocking:
    <=

Rule:
    - Combinational logic -> use =
    - Sequential logic -> use <=

============================================================
*/

module top_module (
    input clk,
    input d,
    output reg q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule
