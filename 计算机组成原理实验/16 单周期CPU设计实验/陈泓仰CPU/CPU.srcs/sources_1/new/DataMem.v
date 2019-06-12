`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 22:12:02
// Design Name: 
// Module Name: DataMem
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


module DataMem(
    input CLK,
    input [31:0] DataAddress,
    input [31:0] Datain,
    input RD,
    input WR,
    output [31:0] DataOut
    );
    reg [7:0] ram[60:0];
    //reg ram[60:0];
    assign DataOut[31:24] = (RD == 0)? ram[DataAddress] : 8'bz;
    assign DataOut[23:16] = (RD == 0)? ram[DataAddress + 1] : 8'bz;
    assign DataOut[15:8] = (RD == 0)?ram[DataAddress + 2] : 8'bz;
    assign DataOut[7:0] = (RD == 0)? ram[DataAddress + 3] : 8'bz;
    //Ê±ÖÓ´¥·¢Ð´ÄÚ´æ
    always@(negedge CLK)begin
        if(WR == 0) begin
            ram[DataAddress] <= Datain[31:24];
            ram[DataAddress + 1] <= Datain[23:16];
            ram[DataAddress + 2] <= Datain[15:8];
            ram[DataAddress + 3] <= Datain[7:0];
        end
    end
endmodule
