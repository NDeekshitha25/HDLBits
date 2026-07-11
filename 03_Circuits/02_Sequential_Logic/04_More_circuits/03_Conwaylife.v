/*
============================================================
HDLBits Problem: Conwaylife
============================================================

Design:
Implement Conway's Game of Life on a 16x16 toroidal grid.

Representation:

    q[15:0]     -> Row 0
    q[31:16]    -> Row 1
    ...
    q[255:240]  -> Row 15

Each bit represents one cell:
    1 = Alive
    0 = Dead

Toroidal Boundary:

The grid wraps around on all four sides.

Examples:

    Up of row 0      -> row 15
    Down of row 15   -> row 0
    Left of col 0    -> col 15
    Right of col 15  -> col 0

Every cell always has exactly 8 neighbours.

Algorithm:

For every clock cycle:

1. Visit every cell.
2. Determine wrapped neighbour coordinates.
3. Count the 8 live neighbours.
4. Apply Conway's rules:
      <2 neighbours  -> Dead
       2 neighbours  -> Keep current state
       3 neighbours  -> Alive
      >3 neighbours  -> Dead
5. Store results into the next-state vector.
6. Update q on the rising clock edge.

Key Concepts:

- Flattened 2D array indexing
- Nested iteration
- Wrap-around addressing
- Combinational next-state generation
- Sequential state register

============================================================
*/
module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

    reg [255:0] next;

    integer r, c;
    integer up, down, left, right;
    integer count;

    always @(*) begin
        for (r = 0; r < 16; r = r + 1) begin
            for (c = 0; c < 16; c = c + 1) begin

                up    = (r == 0)  ? 15 : r - 1;
                down  = (r == 15) ? 0  : r + 1;
                left  = (c == 0)  ? 15 : c - 1;
                right = (c == 15) ? 0  : c + 1;

                count =
                    q[up*16   + left ] +
                    q[up*16   + c    ] +
                    q[up*16   + right] +
                    q[r*16    + left ] +
                    q[r*16    + right] +
                    q[down*16 + left ] +
                    q[down*16 + c    ] +
                    q[down*16 + right];

                case (count)
                    2: next[r*16 + c] = q[r*16 + c];
                    3: next[r*16 + c] = 1'b1;
                    default: next[r*16 + c] = 1'b0;
                endcase
            end
        end
    end

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            q <= next;
    end

endmodule
