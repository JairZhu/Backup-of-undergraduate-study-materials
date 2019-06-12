`timescale 1ns / 1ps

module MUX5_RegDst(
    input [4:0] rt, rd,
    input RegDst,
    output reg [4:0] Write_Reg
    );
    always @(RegDst or rt or rd) begin
        if (RegDst == 1) Write_Reg = rd;
        else Write_Reg = rt;
    end
endmodule
