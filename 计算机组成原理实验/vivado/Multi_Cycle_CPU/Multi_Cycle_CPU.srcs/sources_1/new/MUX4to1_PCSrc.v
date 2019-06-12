`timescale 1ns / 1ps

module MUX4to1_PCSrc(
    input [31:0] PC4, PC4_imm, jump, Reg_Data,
    input [1:0] PCSrc,
    output reg [31:0] PCout
    );
    always @(PC4 or PC4_imm or jump or PCSrc or Reg_Data) begin
            if (PCSrc == 0) PCout = PC4;
            else if (PCSrc == 1) PCout = PC4_imm;
            else if (PCSrc == 3) PCout = jump;
            else PCout = Reg_Data;
        end
endmodule
