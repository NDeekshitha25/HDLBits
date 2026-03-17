// HDLBits Problem: always_if2
// Fix latch issues by ensuring outputs are assigned in all conditions

module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving
);

    // Shut off computer only if overheated
    always @(*) begin
        shut_off_computer = 0;
        if (cpu_overheated)
            shut_off_computer = 1;
    end

    // Keep driving only if not arrived and fuel is available
    always @(*) begin
        keep_driving = 0;
        if (~arrived)
            keep_driving = ~gas_tank_empty;
    end

endmodule
