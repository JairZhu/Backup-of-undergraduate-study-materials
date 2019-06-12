`timescale 1ns / 1ps

module MUX32_ALUSrcB(
	input [31:0] Read_Data2, Extend_out,
	input ALUSrcB,
	output reg [31:0] ALUB
    );
    always@(ALUSrcB or Read_Data2 or Extend_out) begin
        if (ALUSrcB == 1) ALUB = Extend_out;
        else ALUB = Read_Data2;
    end
endmodule
