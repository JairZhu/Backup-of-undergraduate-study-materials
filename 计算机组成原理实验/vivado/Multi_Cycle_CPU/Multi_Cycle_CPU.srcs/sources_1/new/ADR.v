`timescale 1ns / 1ps

module ADR(
    input [31:0] Read_Data1,
    input CLK,
    output reg [31:0] readdata
    );
    always @(posedge CLK) readdata <= Read_Data1;
endmodule
