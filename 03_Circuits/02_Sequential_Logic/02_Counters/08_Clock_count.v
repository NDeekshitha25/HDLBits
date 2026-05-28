/*
============================================================
HDLBits Problem: Count clock
============================================================

Design:
12-hour clock using:
    - seconds (ss)
    - minutes (mm)
    - hours (hh)
    - AM/PM flag

Key behavior:
- Increment occurs when ena = 1
- Reset sets time to 12:00:00 AM
- No "00" hour state (wrap 12 <-> 01)
============================================================
*/

module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);

    // --------------------------------------------------------
    // Enable propagation (ripple style)
    // ss enables mm, mm enables hh
    // --------------------------------------------------------
    wire ena_ss = ena;
    wire ena_mm = ena && (ss == 8'h59);
    wire ena_hh = ena && (ss == 8'h59) && (mm == 8'h59);

    // --------------------------------------------------------
    // Seconds counter (0–59)
    // --------------------------------------------------------
    count60 count_ss (
        .clk(clk),
        .reset(reset),
        .ena(ena_ss),
        .q(ss)
    );

    // --------------------------------------------------------
    // Minutes counter (0–59)
    // --------------------------------------------------------
    count60 count_mm (
        .clk(clk),
        .reset(reset),
        .ena(ena_mm),
        .q(mm)
    );

    // --------------------------------------------------------
    // Hours + AM/PM logic
    // --------------------------------------------------------
    always @(posedge clk) begin

        if (reset) begin
            hh <= 8'h12;
            pm <= 1'b0;
        end

        else if (ena_hh) begin

            // 11:59:59 → 12:00:00 toggle AM/PM
            if (hh == 8'h11) begin
                hh <= 8'h12;
                pm <= ~pm;
            end

            // 12 → 01 transition
            else if (hh == 8'h12) begin
                hh <= 8'h01;
            end

            // 01–10 normal increment
            else if (hh[3:0] == 4'h9) begin
                hh[3:0] <= 4'h0;
                hh[7:4] <= hh[7:4] + 1'b1;
            end

            else begin
                hh <= hh + 1'b1;
            end
        end
    end

endmodule

// ============================================================
// 00–59 BCD counter
// ============================================================
module count60(
    input clk,
    input reset,
    input ena,
    output reg [7:0] q
);

    always @(posedge clk) begin

        if (reset)
            q <= 8'h00;

        else if (ena) begin

            if (q[3:0] == 4'h9) begin
                if (q[7:4] == 4'h5)
                    q <= 8'h00;
                else begin
                    q[7:4] <= q[7:4] + 1'b1;
                    q[3:0] <= 4'h0;
                end
            end

            else begin
                q[3:0] <= q[3:0] + 1'b1;
            end
        end
    end

endmodule
