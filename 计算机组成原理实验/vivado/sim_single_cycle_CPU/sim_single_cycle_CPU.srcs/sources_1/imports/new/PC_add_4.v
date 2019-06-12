`timescale 1ns / 1ps

module PC_add_4(
	input [31:0] PCin,
	output reg [31:0] PCout
    );
    always @(PCin) begin
	   PCout = PCin + 4;
	end
endmodule
