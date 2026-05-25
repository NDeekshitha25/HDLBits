/*
============================================================
HDLBits Problem: Thermostat
Path:
hdlbits/03_circuits/0_combinational_logic/01_basic_gate/

Description:
A thermostat controls:
- Heater
- Air Conditioner
- Fan

Inputs:
- too_cold : Temperature is too cold
- too_hot  : Temperature is too hot
- mode     : 1 = Heating mode, 0 = Cooling mode
- fan_on   : Manual fan control

Outputs:
- heater
- aircon
- fan

------------------------------------------------------------
Logic Explanation

1. Heater
   Turn ON only when:
   - System is in heating mode
   - Temperature is too cold

   heater = mode & too_cold

2. Air Conditioner
   Turn ON only when:
   - System is in cooling mode
   - Temperature is too hot

   aircon = ~mode & too_hot

3. Fan
   Turn ON when:
   - Heater is ON
   - Air conditioner is ON
   - User manually enables fan

   fan = heater | aircon | fan_on

------------------------------------------------------------
Concepts Used
- Combinational Logic
- Continuous Assignment
- Boolean Operators
- AND, OR, NOT Gates

------------------------------------------------------------
Truth Summary

mode = 1 --> Heating mode
mode = 0 --> Cooling mode

Heating:
    too_cold = 1 --> heater ON

Cooling:
    too_hot = 1 --> aircon ON

Fan:
    fan_on = 1 OR heater/aircon active --> fan ON

============================================================
*/

module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
);

    assign heater = mode & too_cold;
    assign aircon = ~mode & too_hot;
    assign fan = heater | aircon | fan_on;

endmodule
