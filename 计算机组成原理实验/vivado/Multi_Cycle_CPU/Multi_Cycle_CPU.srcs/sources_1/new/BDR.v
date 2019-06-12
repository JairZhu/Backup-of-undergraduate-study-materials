`timescale 1ns / 1ps

module BDR(
    input [31:0] Read_Data2,
    input CLK,
    output reg [31:0] readdata2
    );
    always @(posedge CLK) readdata2 <= Read_Data2;
endmodule
