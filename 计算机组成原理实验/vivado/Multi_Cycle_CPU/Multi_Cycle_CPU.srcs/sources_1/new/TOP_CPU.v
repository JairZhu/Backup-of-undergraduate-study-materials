`timescale 1ns / 1ps

module TOP_CPU(
    input clk_sys,
    input buttoninCPUclk,buttoninRST, LEDreset,
    input [1:0] SW_in,
    output [6:0] displaycode,
    output [3:0] an
    );
    wire clk190, cpuclk, PCreset, RST, ledreset;
    wire [7:0] curPC_low, nextPC_low, RSaddr, RSdata, RTaddr, RTdata, ALUresult, dbdata;
    Button_In button_in_CPUclk(
            .clk_sys(clk_sys),
            .button_in(buttoninCPUclk),
            .button_out(cpuclk)
        );
        Button_In button_in_RST(
            .clk_sys(clk_sys),
            .button_in(buttoninRST),
            .button_out(RST)
        );
        Button_In button_in_LEDreset(
            .clk_sys(clk_sys),
            .button_in(LEDreset),
            .button_out(ledreset)
        );
        CLKDIV clkdiv(
                .CLK(clk_sys),
                .CLK190(clk190)
            );
            Display display(
                .curPC(curPC_low),
                .nextPC(nextPC_low),
                .RSaddr(RSaddr),
                .RSdata(RSdata),
                .RTaddr(RTaddr),
                .RTdata(RTdata),
                .ALUresult(ALUresult),
                .dbdata(dbdata),
                .SW_in(SW_in),
                .LEDreset(ledreset),
                .clk190(clk190),
                .AN(an),
                .displaycode(displaycode)
            );
    Multi_Cycle_CPU multicyclecpu(
                    .CLK(cpuclk),
                    .RST(RST),
                    .curPC_low(curPC_low),
                    .nextPC_low(nextPC_low),
                    .RSaddr(RSaddr),
                    .RSdata(RSdata),
                    .RTaddr(RTaddr),
                    .RTdata(RTdata),
                    .ALUresult(ALUresult),
                    .DBdata(dbdata)
                );
endmodule
