module traffic_light(
    input clock, reset, parade,// 1 Hz时钟信号，同步复位 , parade为 游行信号 
	output[5:0] lamp_a1, lamp_a2, lamp_b1, lamp_b2,// 四组信号灯 
	output[7:0] count_a1, count_a2, count_b1, count_b2// 倒计时牌 
    );
reg[5:0] lamp_a, lamp_b; // 左转绿，左转黄，左转红，直行红，直行黄，直行绿
reg[7:0] num_a, num_b; // 内部倒计时
reg temp_a, temp_b; // 状态和计数转换信号
reg[2:0] state_a, state_b; // a，b的状态寄存器
reg[7:0] red_a, yellow_a, green_a, left_a, red_b, yellow_b, green_b, left_b;
assign count_a1 = num_a, count_a2 = num_a;
assign count_b1 = num_b, count_b2 = num_b;
assign lamp_a1 = lamp_a, lamp_a2 = lamp_a;
assign lamp_b1 = lamp_b, lamp_b2 = lamp_b;




always@(posedge clock)
begin
    if( !reset )// 复位信号在低电平时工作，此时一切复位 
    begin
        green_a <= 8'd40; // a向 通行 40s
        yellow_a <= 8'd5; // a向 左转准备 5s , a向 禁止通行准备 5s 
        left_a <= 8'd15; // a向 左转 15s
        red_a <= 8'd55; // a向 禁止通行 55s
        
        red_b <= 8'd65; // b向 禁止通行 65s
        green_b = 8'd30; // b向 通行 30s 
        yellow_b <= 8'd5; // b 向 左转准备 5s , b向 禁止通行准备 5s 
        left_b <= 8'd15; //  b向 左转 15s
        
        lamp_a <= 'b000000; //  左转绿，左转黄，左转红，直行红，直行黄，直行绿  均不亮
        state_a <= 'b000; // 0状态
        temp_a <=  0; // 状态和计数转换信号
        num_a <= 0; // 内部倒计时
    end
    // reset == 1,正常工作；  
    else
    begin
    	if( !parade )// parade == 0，非游行状态，交通灯正常工作
		begin 
	        //当 temp_a == 0 时，状态变换
	        if( !temp_a )
	        begin
	            temp_a <= 1;
	            case( state_a )
	                 // a向 通行 
	                'b000:
	                 begin
	                    num_a <= green_a;// 内部倒计时 就是 绿灯的倒计时
	                    lamp_a <= 'b001001; //  左转红,直行绿 亮
	                    state_a <= 'b001; //  当green_a从40s倒计时到0s时，temp_a==0,便可进行判断，变为下一个状态
	                 end 
	                 'b001:
	                 begin
	                     num_a <= yellow_a;// 内部倒计时 就是 黄灯的倒计时
	                    lamp_a <= 'b010010; //  直行黄，左转黄 亮
	                    state_a <= 'b010; //  当yellow_a从5s倒计时到0s时，temp_a==0,便可进行判断，变为下一个状态
	                 end 
	                 'b010:
	                 begin
	                     num_a <= left_a;// 内部倒计时 就是 左转灯的倒计时
	                    lamp_a <= 'b100100; //  左转绿,直行红 亮
	                    state_a <= 'b011; //  当left_a从15s倒计时到0s时，temp_a==0,便可进行判断，变为下一个状态
	                 end 
	                 'b011:
	                 begin
	                     num_a <= yellow_a;// 内部倒计时 就是 黄灯的倒计时
	                    lamp_a <= 'b010100; //  左转黄，直行红 亮
	                    state_a <= 'b100; //  当yellow_a从5s倒计时到0s时，temp_a==0,便可进行判断，变为下一个状态
	                 end 
	                 'b100:
	                 begin
	                     num_a <= red_a;// 内部倒计时 就是 红灯的倒计时
	                    lamp_a <= 'b001100; //  左转红,直行绿 亮
	                    state_a <= 'b000; //  当green_a从40s倒计时到0s时，temp_a==0,便可进行判断，变为下一个状态
	                 end 
	                 default: lamp_a <= 'b000000;
	            endcase
	        end 
	        // 当 temp_a == 1 时，状态不变换
	        else
	        begin
	            if(num_a > 1)
	            begin
	                if(num_a[3:0] == 0)
	                begin
	                    num_a[3:0] <= 'b1111;
	                    num_a[7:4] <= num_a[7:4] - 1;
	                end
	                else
	                    num_a[3:0] <= num_a[3:0] - 1;
	                // num_a = num_a - 1;
	            end
	            if(num_a == 2)// 下个clock到来时，num_a 为 1，然后变为下一个状态 
	                temp_a <= 0;
	        end
	    else  // parade == 1，a向游行状态，一直是 a向直行绿灯，b禁行 
	    begin
	    	num_a <= green_a;// 内部倒计时 就是 绿灯的倒计时
	        lamp_a <= 'b001001;
		end    
	        
	end
end

always@(posedge clock)
begin
    if( !reset ) 
    begin
        lamp_b <= 'b000000; //  左转绿，左转黄，左转红，直行红，直行黄，直行绿  均不亮
        state_b <= 'b000; // 0状态
        temp_b <=  0; // 状态和计数转换信号
        num_b <= 0; // 内部倒计时
    end
    // reset == 1,正常工作；  
    else
    begin
    	if( !parade )
    	begin
	        //当 temp_b == 0 时，状态变换
	        if( !temp_b )
	        begin
	            temp_b <= 1;
	            case( state_b )
	                 // b向 禁止 
	                'b000:
	                 begin
	                    num_b <= red_b;
	                    lamp_b <= 'b001100; 
	                    state_b <= 'b001; 
	                 end 
	                 'b001:
	                 begin
	                     num_b <= green_b;
	                    lamp_b <= 'b001001; 
	                    state_b <= 'b010; 
	                 end 
	                 'b010:
	                 begin
	                     num_b <= yellow_b;
	                    lamp_b <= 'b010010; 
	                    state_b <= 'b011; 
	                 end 
	                 'b011:
	                 begin
	                     num_b <= left_b;
	                    lamp_b <= 'b100100;
	                    state_b <= 'b100;
	                 end 
	                 'b100:
	                 begin
	                     num_b <= yellow_b;
	                    lamp_b <= 'b010100;
	                    state_b <= 'b000;
	                 end 
	                 default: lamp_b <= 'b000000;
	            endcase
	        end 
	        else
	        begin
	            if(num_b > 1)
	            begin
	                if(num_b[3:0] == 0)
	                begin
	                    num_b[3:0] <= 'b1111;
	                    num_b[7:4] <= num_b[7:4] - 1;
	                end
	                else
	                    num_b[3:0] <= num_b[3:0] - 1;
	            end
	            if(num_b == 2)
	                temp_b <= 0;
	        end
	    else // 游行状态，b向禁行
		begin
			num_b <= red_b;
	        lamp_b <= 'b001100; 
		end 
    end
end
endmodule





`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/24 12:30:50
// Design Name: 
// Module Name: simu
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


module simu(
);
// testbench 时钟信号
reg clk = 0;
//always #500000000 clk <= ~clk;
always #0.5 clk <= ~clk;
// 调用test模块
reg reset = 0;
always #120 reset <= ~reset;

wire[5:0] lamp_a1, lamp_a2, lamp_b1, lamp_b2;// 四组信号灯 
wire[7:0] count_a1, count_a2, count_b1, count_b2;// 倒计时牌
traffic_light mytraffic_light( clk, reset,// 1 Hz时钟信号，同步复位
	 lamp_a1, lamp_a2, lamp_b1, lamp_b2,// 四组信号灯 
	 count_a1, count_a2, count_b1, count_b2// 倒计时牌 
    );

endmodule





