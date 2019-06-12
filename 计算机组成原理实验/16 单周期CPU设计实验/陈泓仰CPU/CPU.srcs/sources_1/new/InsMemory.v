`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 17:54:01
// Design Name: 
// Module Name: InsMemory
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


module InsMemory(
    input [31:0] IAddress,
    input InsMemRW,
    output [5:0] op,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [15:0] immediate,
    output [25:0] AJshift,
    output [4:0] sa
    );
    reg [31:0] InsDataOut;
    reg [7:0] rom [99:0]; // 存储器定义必须用reg类型，存储器存储单元8位长度，共100个存储单元
    initial begin // 加载数据到存储器rom。注意：必须使用绝对路径，如：E:/Xlinx/VivadoProject/ROM/（自己定）
           $readmemb ("C:/rom_data.txt", rom); // 数据文件rom_data（.coe或.txt）。未指定，就从0地址开始存放。
     end
    always @( InsMemRW or IAddress ) begin
        if (InsMemRW == 1) // 为0，读存储器。大端数据存储模式
             InsDataOut[31:24] = rom[IAddress];
             InsDataOut[23:16] = rom[IAddress + 1];
             InsDataOut[15:8] = rom[IAddress + 2];
             InsDataOut[7:0] = rom[IAddress + 3];
    end
       assign op =  InsDataOut[31:26];  
       assign rs = InsDataOut[25:21];  
       assign rt = InsDataOut[20:16];  
       assign rd = InsDataOut[15:11];  
       assign immediate = InsDataOut[15:0];
       assign sa = InsDataOut[10:6];
       assign AJshift = InsDataOut[25:0];
endmodule
