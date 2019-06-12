`timescale 1ns / 1ps

module MUX4to1_PCSrc(
    input [31:0] PC4, PC4_imm, jump,
    input [1:0] PCSrc,
    output reg [31:0] PCout
    );
    always @(PC4 or PC4_imm or jump or PCSrc) begin
        if (PCSrc == 0) PCout = PC4;
        else if (PCSrc == 1) PCout = PC4_imm;
        else PCout = jump;
    end
endmodule
