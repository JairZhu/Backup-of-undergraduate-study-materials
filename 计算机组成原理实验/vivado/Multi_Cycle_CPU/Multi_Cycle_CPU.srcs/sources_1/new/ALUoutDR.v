`timescale 1ns / 1ps

module ALUoutDR(
    input [31:0] ALUresult,
    input CLK,
    output reg [31:0] ALUout
    );
    always @(posedge CLK) ALUout <= ALUresult;
endmodule
