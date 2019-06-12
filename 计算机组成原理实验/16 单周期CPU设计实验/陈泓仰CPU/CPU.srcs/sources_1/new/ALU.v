`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 22:13:16
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0]AluOp,
    output Zero,
    output Sign,
    output [31:0] Result
    );
    reg [31:0] Result;
    reg Sign,Zero;
    always@(A or B or AluOp)begin
        case(AluOp)
            3'b000:begin 
                Result = A + B;
                Sign = Result[31];
                Zero = (Result == 0)? 1 : 0;
            end
            3'b001:begin
                Result = A - B;
                Sign = Result[31];
                Zero = (Result == 0)? 1 : 0;
             end
            3'b010:begin
                Result = B << A;
                Sign = Result[31];
                Zero = (Result == 0)? 1 : 0;
            end
            3'b011:begin
                Result = A | B;
                Sign = Result[31];
                Zero = (Result == 0)? 1 : 0;
            end
            3'b100:begin
                Result = A & B;
                Sign = Result[31];
                Zero = (Result == 0)? 1 : 0;
            end
            3'b101:begin
                Result = (A<B) ? 1 : 0;
                Sign = Result[31];
                Zero = (Result == 0)? 1 : 0;
             end
             3'b110:begin
                if(A < B && A[31] == B[31])
                    Result = 1;
                else if(A[31] && !B[31])
                    Result = 1;
                else
                    Result = 0;
                Sign = Result[31];
                Zero = (Result == 0)?1 : 0;
             end
             3'b111:begin
                Result = A ^ B;
                Sign = Result[31];
                Zero = (Result == 0)?1 : 0;
             end
        endcase
           end
endmodule
