`timescale 1ns / 1ps

module Display(
    input [7:0] curPC, nextPC, RSaddr, RSdata, RTaddr, RTdata, ALUresult, dbdata,
    input [1:0] SW_in,
    input LEDreset, clk190,
    output [3:0] AN,
    output [6:0] displaycode
    );
    reg [15:0] displaydata;
    always @(SW_in) begin
        if (SW_in == 2'b00) begin
           displaydata = {curPC, nextPC}; 
        end
        else if (SW_in == 2'b01) begin
            displaydata = {RSaddr, RSdata};
        end
        else if (SW_in == 2'b10) begin
            displaydata = {RTaddr, RTdata};
        end
        else begin
            displaydata = {ALUresult, dbdata};
        end
    end
    SegLED segled(
        .CLK190(clk190),
        .clr(LEDreset),
        .display_data(displaydata),
        .a_to_g(displaycode),
        .an(AN)
    );
endmodule
