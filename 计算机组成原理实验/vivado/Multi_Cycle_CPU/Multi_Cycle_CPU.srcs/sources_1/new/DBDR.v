`timescale 1ns / 1ps

module DBDR(
    input [31:0] DBData,
    input CLK,
    output reg [31:0] DB
    );
    always @(posedge CLK) DB <= DBData;
endmodule
