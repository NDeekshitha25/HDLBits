/*
============================================================
HDLBits Problem: Bcdadd4

Description:
Create a 4-digit BCD ripple-carry adder
using four instances of bcd_fadd.

============================================================
*/

module top_module ( 
    input [15:0] a,
    input [15:0] b,
    input cin,
    output cout,
    output [15:0] sum
);

    wire [2:0] cout_tmp;

    bcd_fadd inst1 (
        a[3:0],
        b[3:0],
        cin,
        cout_tmp[0],
        sum[3:0]
    );

    bcd_fadd inst2 (
        a[7:4],
        b[7:4],
        cout_tmp[0],
        cout_tmp[1],
        sum[7:4]
    );

    bcd_fadd inst3 (
        a[11:8],
        b[11:8],
        cout_tmp[1],
        cout_tmp[2],
        sum[11:8]
    );

    bcd_fadd inst4 (
        a[15:12],
        b[15:12],
        cout_tmp[2],
        cout,
        sum[15:12]
    );

endmodule
