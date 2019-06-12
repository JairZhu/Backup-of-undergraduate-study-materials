`timescale 1ns / 1ps

module PC(
    input CLK,
    input Reset,
    input [31:0] PCin,
    input PCWre,
    output reg [31:0] PCout
    );
    always @(posedge CLK or negedge Reset) begin
        if (Reset == 0) PCout <= 0;
        else if (PCWre) PCout <= PCin;
    end
endmodule
