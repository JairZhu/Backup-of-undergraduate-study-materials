`timescale 1ns / 1ps

module Data_Mem(
    input CLK,
    input nRD,      // 为0，正常读；为1,输出高组态
    input nWR,      // 为0，写；为1，无操作
    input [31:0] address, writeData,
    output [31:0] Dataout
    );
    reg [7:0] ram [0:60]; //存储器
    // 读
    assign Dataout[7:0] = (nRD==0)?ram[address + 3]:8'bz; // z 为高阻态
    assign Dataout[15:8] = (nRD==0)?ram[address + 2]:8'bz;
    assign Dataout[23:16] = (nRD==0)?ram[address + 1]:8'bz;
    assign Dataout[31:24] = (nRD==0)?ram[address ]:8'bz;
    // 写
    always@(negedge CLK) begin
        if( nWR==0 ) begin
            ram[address] <= writeData[31:24];
            ram[address+1] <= writeData[23:16];
            ram[address+2] <= writeData[15:8];
            ram[address+3] <= writeData[7:0];
        end
    end
endmodule
