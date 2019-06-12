`timescale 1ns / 1ps

module MUX_WriteReg(
    input [4:0] rt, rd,
    input [1:0] RegDst,
    output reg [4:0] Write_Reg
    );
    always @(RegDst or rt or rd) begin
            if (RegDst == 2) Write_Reg = rd;
            else if (RegDst == 1) Write_Reg = rt;
            else Write_Reg = 5'b11111;
        end
endmodule
