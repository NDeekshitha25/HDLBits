    wire [3:0] q0, q1, q2, q3;

    // 1s digit
    bcdcount c0 (
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .Q(q0)
    );

    // 10s digit
    bcdcount c1 (
        .clk(clk),
        .reset(reset),
        .enable(ena[1]),
        .Q(q1)
    );

    // 100s digit
    bcdcount c2 (
        .clk(clk),
        .reset(reset),
        .enable(ena[2]),
        .Q(q2)
    );

    // 1000s digit
    bcdcount c3 (
        .clk(clk),
        .reset(reset),
        .enable(ena[3]),
        .Q(q3)
    );

    // carry enable logic
    assign ena[1] = (q0 == 4'd9);
    assign ena[2] = (q0 == 4'd9) & (q1 == 4'd9);
    assign ena[3] = (q0 == 4'd9) & (q1 == 4'd9) & (q2 == 4'd9);

    // pack output
    assign q = {q3, q2, q1, q0};
