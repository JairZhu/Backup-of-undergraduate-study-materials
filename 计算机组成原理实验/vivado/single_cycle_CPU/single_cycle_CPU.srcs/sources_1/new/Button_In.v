`timescale 1ns / 1ps

module Button_In(
    input clk_sys,
    input button_in,
    output button_out
    );
    wire clk40;
    CLKDIV_40 clkdiv_40(
        .clk_sys(clk_sys),
        .clk_40(clk40)
    );
    AvoidShake avoidshake(
        .CLK_40(clk40),
        .in(button_in),
        .out(button_out)
    );
endmodule
