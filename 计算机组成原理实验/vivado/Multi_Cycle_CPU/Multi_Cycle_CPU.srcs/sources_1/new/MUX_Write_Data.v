`timescale 1ns / 1ps

module MUX_Write_Data(
    input [31:0] PC4, DB,
    input WrRegDSrc,
    output reg [31:0] Write_Data
    );
    always @(PC4 or DB or WrRegDSrc) begin
        if (WrRegDSrc == 1) Write_Data = DB;
        else Write_Data = PC4;
    end
endmodule
