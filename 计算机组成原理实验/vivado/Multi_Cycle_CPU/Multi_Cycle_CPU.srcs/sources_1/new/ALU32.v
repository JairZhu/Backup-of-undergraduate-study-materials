`timescale 1ns / 1ps

module ALU32(
    input [2:0] ALUopcode,
    input [31:0] rega,
    input [31:0] regb,
    output reg [31:0] Result,
    output zero,
    output sign
    );
    assign zero = (Result==0)?1:0;
        assign sign = (Result[31] == 1)?1:0;
        always @( ALUopcode or rega or regb ) begin 
            case (ALUopcode) 
                3'b000 : Result = rega + regb; 
                3'b001 : Result = rega - regb; 
                3'b010 : Result = (rega<regb)?1:0; 
                3'b011 : begin 
                    if (rega<regb &&(( rega[31] == 0 && regb[31]==0) || (rega[31] == 1 && regb[31]==1))) Result = 1; 
                    else if (rega[31] == 0 && regb[31]==1) Result = 0; 
                    else if ( rega[31] == 1 && regb[31]==0) Result = 1; 
                    else Result = 0; 
                end 
                3'b100 : Result = regb<<rega ; 
                3'b101 : Result = rega|regb; 
                3'b110 : Result = rega&regb; 
                3'b111 : Result = rega^regb; 
                default : begin 
                    Result = 8'h00000000; 
                    $display (" no match"); 
                end 
            endcase 
        end
endmodule
