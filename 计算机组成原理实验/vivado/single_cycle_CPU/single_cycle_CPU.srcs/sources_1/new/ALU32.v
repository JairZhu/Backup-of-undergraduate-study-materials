`timescale 1ns / 1ps

module ALU32(
    input [2:0] ALUopcode,
    input [31:0] rega,
    input [31:0] regb,
    output reg [31:0] result,
    output zero,
    output sign
    );
    assign zero = (result==0)?1:0;
    assign sign = (result[31] == 1)?1:0;
    always @( ALUopcode or rega or regb ) begin
        case (ALUopcode)
            3'b000 : result = rega + regb;
            3'b001 : result = rega - regb;
            3'b010 : result = regb << rega;
            3'b100 : result = rega & regb;
            3'b011 : result = rega | regb;
            3'b101 : result = (rega < regb)?1:0; // 不带符号比较
            3'b110 : begin // 带符号比较
                if (rega<regb &&(( rega[31] == 0 && regb[31]==0) || (rega[31] == 1 && regb[31]==1))) result = 1;
                else if (rega[31] == 0 && regb[31]==1) result = 0;
                else if ( rega[31] == 1 && regb[31]==0) result = 1;
                else result = 0;
                end
            3'b111 : begin
                result = rega ^ regb;
            end
        endcase
    end
endmodule
