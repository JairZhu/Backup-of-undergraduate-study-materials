`timescale 1ns / 1ps

module MUX32_ALUSrcA(
    input [31:0] Read_Data1,
    input [4:0] sa,
    input ALUSrcA,
    output reg [31:0] ALUA
    );
    always @(ALUSrcA or sa or Read_Data1) begin
        if (ALUSrcA == 0) ALUA = Read_Data1;
        else ALUA = {{27{1'b0}}, sa};
    end
endmodule
