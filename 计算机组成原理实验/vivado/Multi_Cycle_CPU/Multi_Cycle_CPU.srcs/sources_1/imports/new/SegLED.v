`timescale 1ns / 1ps

module SegLED(
    input CLK190,
    input clr,
    input [15:0] display_data,
    output reg [6:0] a_to_g,
    output reg [3:0] an
    );
    reg [1:0] s;
    reg [3:0] digit;
    wire [3:0] aen;
    assign aen = 4'b1111;
    always@(posedge CLK190 or posedge clr) begin
        if(clr == 1) s <= 0;//清零
        else s <= s + 1;//每次190HZ的频率闪过就选择亮哪一盏灯
    end
    //确保每个数码管上都有显示数字
    always@(*) begin
        an <= 4'b1111;
        if(aen[s] == 1) 
            an[s] <= 0;   //显示第s位
        if(clr == 1)
            an <= 4'b1111;    
    end
    always @(*) begin
        case(s)
            0:digit <= display_data[3:0];
            1:digit <= display_data[7:4];
            2:digit <= display_data[11:8];
            3:digit <= display_data[15:12];
        endcase 
    end
    always @(*) begin
        case (digit)
            4'b0000:a_to_g <= 7'b0000001;
            4'b0001:a_to_g <= 7'b1001111;
            4'b0010:a_to_g <= 7'b0010010;
            4'b0011:a_to_g <= 7'b0000110;
            4'b0100:a_to_g <= 7'b1001100;
            4'b0101:a_to_g <= 7'b0100100;
            4'b0110:a_to_g <= 7'b0100000;
            4'b0111:a_to_g <= 7'b0001111;
            4'b1000:a_to_g <= 7'b0000000;
            4'b1001:a_to_g <= 7'b0000100;
            4'b1010:a_to_g <= 7'b0001000;
            4'b1011:a_to_g <= 7'b1100000;
            4'b1100:a_to_g <= 7'b0110001;
            4'b1101:a_to_g <= 7'b1000010;
            4'b1110:a_to_g <= 7'b0110000;
            4'b1111:a_to_g <= 7'b0111000;
        endcase
    end
endmodule
