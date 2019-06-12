/*//////////////////////////////////////////////
1.时钟显示功能 
   w16:时钟清零，重置; 
   v16:分秒到时分的切换;
   
2.校时功能(可以对电子钟的时钟和分钟进行校准）
   w2:校准分钟
   u1:校准时钟
 
3.w15->v17-
  R3->
4.w17:秒表暂停;//////////////////////////

5.R2：进入闹钟调时模式 
  U1:设定闹钟时钟;
  w2：设定闹钟分钟； 
  T1:开启闹钟；alarm_on 
  后led灯闪烁;

/***********************************************
set_property PACKAGE_PIN R2 [get_ports alarm_ad`]
set_property PACKAGE_PIN T1 [get_ports alarm_on]
set_property PACKAGE_PIN R3 [get_ports led_stw]
set_property PACKAGE_PIN W15 [get_ports mode]//闹钟模式 /秒表模式 ////////////////////////////////////////////
set_property PACKAGE_PIN W16 [get_ports reset]//清零 /////////////////////////////////////////////////////////
set_property PACKAGE_PIN W17 [get_ports reset1]关闭闹钟 
set_property PACKAGE_PIN U1 [get_ports set_hour]//设置闹钟时钟 
set_property PACKAGE_PIN W2 [get_ports set_min]//设置闹钟分钟 
set_property PACKAGE_PIN V17 [get_ports btn] // 秒表计时/////////////////////////////////////////////////////
set_property PACKAGE_PIN V16 [get_ports change] 时钟到分钟的切换 ////////////////////////////////////////////
**********************************************/
//1. `timescale 1ns / 1ps，含义为：时延单位为1ns，时延精度为1ps。
//2. 在编译过程中，`timescale会影响其后面所有模块中的时延值，直至遇到另一个
//`timescale指令或`resetall指令。
//3. 当一个设计中的多个模块带有自身的`timescale编译指令时，模拟器将定位
//在所有模块的最小时延精度上，并且所有时延都相应地换算为最小时延精度。
`timescale 1ns / 1ps

//时钟分频器 
module clkdiv(
    input clk,
    input clr,
    output clk190
    );
    reg [40:0]q;// 41 位计数器 
    
    always@(posedge clk or posedge clr)
    begin
        if(clr==1)
            q<=0;
        else
            q<=q+1;
     end
     assign clk190 = q[17];// 190 Hz 用于数码管的扫描显示
 endmodule
 
//计时1s 
module clk_1s #(parameter N=99_999999)(
	input wire clk,reset,   //clk接w5 
	output reg clk_1s
	);
	reg [31:0] count;
	
	always@(posedge clk, posedge reset)
	begin
		if(reset==1)	  
			count<=0;
		else
		begin
			clk_1s <= 0;
			if(count<N)
				count<=count+1;
			else
			begin
				clk_1s<=1;
				count<=0;
			end
		end
	end
endmodule

module clk_1ms #(parameter N=99_999)(
	input wire clk,reset,   //clk接w5 
	output reg clk_1ms
	);
	reg [31:0] count;
	
	always@(posedge clk, posedge reset)
	begin
		if(reset==1)	  
			count<=0;
		else
		begin
			clk_1ms <= 0;
			if(count<N)
				count<=count+1;
			else
			begin
				clk_1ms<=1;
				count<=0;
			end
		end
	end
endmodule

module sec(
	input wire clk,reset,
	output reg [3:0]sec_high,
	output reg [3:0]sec_low,
	output reg carry//进位 
	); 

	reg [7:0]count;//计数器 
	
	always@(posedge clk, posedge reset)
	begin
		if(reset==1)//复位 
		begin
			count<=0;
			sec_high<=4'd0;
			sec_low<=4'd0;
		end
		else
		begin
		    carry <= 0;
			if(count==59)
			begin
				count<=0;
				sec_high<=4'd0;
				sec_low<=4'd0;
				carry<=1;
			end
			else
			begin
				carry<=0;
				count=count+1;
				sec_high <= count/10;
				sec_low <= count%10;//求余显示低位 
			end
		end
	end
endmodule

module min(
	input wire alarm_ad, 
	input wire clk_1s, 
	input wire set_min,  
	input wire clk,reset,  //clk输入秒计数模块的进位 
	output reg [3:0]min_high,
	output reg [3:0]min_low,
	output reg carry
	);

	reg [7:0]count;
	
	
	always@(posedge clk_1s, posedge reset)  
	begin
		if(reset==1)//复位 
		begin
			count<=4'd0;
			min_high<=4'd0;
			min_low<=4'd0;
		end
		else if(set_min==1&&alarm_ad==0)  
		begin
			if(count>=8'd59)
			begin
				min_low<=0;
				min_high<=0;
				count<=0;
				carry=1; 
			end
			else
			begin
				carry=0;
				count=count+1;
				min_low<=count%10;
				min_high<=count/10;
			end
		end
		else if(clk==1) //clk输入秒计数模块的进位
		begin
			if(count==8'd59)
			begin
				min_low<=0;
				min_high<=0;
				count<=0;
				carry=1;
			end
			else
			begin
				carry=0;
				count=count+1;
				min_low<=count%10;
				min_high<=count/10;
			end
		end
	end
endmodule 

module hour(
	input wire alarm_ad,
    input wire clk_1s,
	input wire set_hour,
	input wire clk,reset,  //clk输入分计数模块的进位 
	output reg [3:0]hour_high,
	output reg [3:0]hour_low,
	output reg carry
	); 
	
	reg [7:0]count;
	
	always@(posedge clk_1s, posedge reset)
	begin
		if(reset==1)
		begin
			count<=0;
			hour_high<=0;
			hour_low<=0;
		end
		else if(set_hour==1&&alarm_ad==0)
		begin
			if(count>=8'd23)
			begin
				count<=0;
				hour_low<=0;
				hour_high<=0;
				carry=1;
			end
			else
			begin
				carry=0;
				count=count+1;
				hour_low<=count%10;
				hour_high<=count/10;
			end
		end
		else if(clk==1)//clk输入分计数模块的进位 
		begin
			if(count==8'd23)
			begin
				count<=0;
				hour_low<=0;
				hour_high<=0;
				carry=1;
			end
			else 
			begin
				carry=0;
				count=count+1;
				hour_low<=count%10;
				hour_high<=count/10;
			end
		end
	end
	
endmodule 

//数码管显示模块
module  x7seg_msg(
    input clk,   //传入clk190
    input clr,
    input [3:0]digit3,   //需要改成分钟和时钟 
    input [3:0]digit2,
    input [3:0]digit1,
    input [3:0]digit0,
    output reg [6:0]a_to_g,  //段选段，七段管  
    output reg [3:0]an  //位选端，四块显示屏分别显示的数字  
    );
    reg [1:0]s; 
    reg [3:0]digit;
    wire [3:0]aen;
    
    assign aen = 4'b1111;
    
    always@(posedge clk or posedge clr)
    begin
        if(clr==1)//清零
        begin
            s <= 0;
        end
        else //每次190HZ的频率闪过就选择亮哪一盏灯
            s <= s+1;
    end
    
    //确保每个数码管上都有显示数字
    always@(*)
    begin
        an = 4'b1111;
        if(aen[s]==1) 
            an[s] = 0;   //显示第s位
        if(clr==1)
              an = 4'b1111;    
    end
   
   //需要改变 
    always@(*)
        case(s)
            0:digit = digit0;  //注意n取的最高位和最低位的顺序
            1:digit = digit1;
            2:digit = digit2;
            3:digit = digit3;
            default:digit = digit0[3:0];
        endcase
    
    always@(*)
        case(digit)
            0: a_to_g = 7'b0000001;
            1: a_to_g = 7'b1001111;
            2: a_to_g = 7'b0010010;
            3: a_to_g = 7'b0000110;
            4: a_to_g = 7'b1001100;
            5: a_to_g = 7'b0100100;
            6: a_to_g = 7'b0100000;
            7: a_to_g = 7'b0001111;
            8: a_to_g = 7'b0000000;
            9: a_to_g = 7'b0000100;
            default: a_to_g = 7'b1111111;
        endcase
endmodule

module set_alarm(//闹钟调时设置模块 
	input wire clk_1s,  
	input wire alarm_ad,
	input wire set_alr_min, set_alr_hour,  //调整按键 和set_min set_hour共用 
	output wire [3:0]add_hour_high,
	output wire [3:0]add_hour_low,
	output wire [3:0]add_min_high,
	output wire [3:0]add_min_low
	); 
	
	reg [7:0] add_hour;
	reg [7:0] add_min;
	
	always@(posedge clk_1s)
	begin
		if(alarm_ad==1)
		begin
			if(set_alr_min==1)//调整分钟 
			begin
				if(add_min>=8'd59)
				begin
					add_min<=0;	
				end
				else
				begin
					add_min<=add_min+1;
				end
			end
			else if(set_alr_hour==1)//调整时钟 
			begin
				if(add_hour>=8'd23)
				begin
					add_hour<=0;
				end
				else
				begin
					add_hour<=add_hour+1;
				end
			end
		end 
	end
	
	assign add_hour_high = add_hour/10;
	assign add_hour_low = add_hour%10;
	assign add_min_high = add_min/10;
	assign add_min_low = add_min%10;
endmodule

module alarm(//闹钟模块  
    input wire alarm_on,    
	input wire [3:0]hour_high,
	input wire [3:0]hour_low,
	input wire [3:0]min_high,
	input wire [3:0]min_low,
	input wire [3:0]add_hour_high,
	input wire [3:0]add_hour_low,
	input wire [3:0]add_min_high,
	input wire [3:0]add_min_low,
	input wire clk,clk190,   //穿入1s 
	input wire reset,   //停止灯亮 
	output [3:0] led//通过led灯来显示闹钟 
	);
	reg [3:0]led_1;
	reg start;
	reg m;
	always@(posedge clk190)
	begin
		if((hour_high==add_hour_high) && (hour_low==add_hour_low) && (min_high==add_min_high) && (min_low==add_min_low) && alarm_on==1)
		begin
			start<=1;
		end 
		else
		begin
		  start<=0;
		end
	end
	
	always@(posedge clk, posedge reset)
	begin
		if(start==1&&reset==0)
		begin
		    if(led_1==4'b0000)//四个led灯轮流闪烁 
		        led_1<=4'b1000;
			else if(led_1 == 4'b1000)
				led_1 <= 4'b0100;
			else if(led_1==4'b0100)
			     led_1<=4'b0010;
			else if(led_1==4'b0010)
			     led_1<=4'b0001;
			else if(led_1==4'b0001)
			     led_1<=4'b0000;
		end
		else if(start==0)
		   led_1<=4'b0000;
	end 
	assign led=led_1;
endmodule


module stopwatch(//秒表 
	input wire clk_1ms,reset1,mode,btn,
	output reg [3:0]mil_sec_high,
	output reg [3:0]mil_sec_low,
	output reg [3:0]sec_high1,
	output reg [3:0]sec_low1,
	output reg led
	);
	
	reg [12:0]mil_sec_cnt;
	reg [7:0]sec_cnt;
	reg carry;
	always@(posedge clk_1ms or posedge reset1) 
	begin
		if(reset1==1)
		begin
		  mil_sec_high=0;
		  mil_sec_low=0;
		  sec_high1=0;
		  sec_low1=0;
		  carry=0;
		  mil_sec_cnt=0;
		end
		else if(mode==1)
		begin
		  if(btn==1)//秒表的开关 
		  begin
		      if(sec_cnt>=8'd59)
			  begin
			  	mil_sec_high=0;
			  	mil_sec_low=0;
			  	sec_high1=0;
			  	sec_low1=0;
			  	sec_cnt=0;
			  	mil_sec_cnt=0;
			  end 
			  else
			  begin
			  	  if(mil_sec_cnt>=12'd999)
		          begin
		          sec_cnt<=sec_cnt+1;
		          led<=1;
		          mil_sec_high<=0;
		          mil_sec_low<=0;
		          sec_high1 = sec_cnt/10;
			      sec_low1= sec_cnt%10;
		          mil_sec_cnt<=0;
		      	  end
			      else
			      begin
			          led<=0;
			          mil_sec_cnt<=mil_sec_cnt+1;
			          mil_sec_high = mil_sec_cnt/100;
			          mil_sec_low = (mil_sec_cnt/10)%10;
			          sec_high1 = sec_cnt/10;
			          sec_low1 = sec_cnt%10;
			      end
			  end
		  end
		end
		else if(mode==0)
		begin
		  mil_sec_cnt=0;
		  mil_sec_high=0;
		  mil_sec_low=0;
		end
	end
endmodule

module clock_top(
    input wire alarm_on,
	input wire alarm_ad,   //用于是否显示时钟调节 
	input wire change,
	input wire set_min,set_hour,
    input wire clk,reset,
    output wire [6:0]a_to_g,
    output wire [3:0]an,
    input wire reset1,  //闹钟停止 
    output wire [3:0]led,
    output wire led_stw,
    input wire mode,
    input wire btn
    );
    wire clk_1s;
    wire clk_1ms;
    wire [3:0]sec_high;
    wire [3:0]sec_low;
    wire clk_1m;
    wire [3:0]min_high;
    wire [3:0]min_low;
    wire clk_1h;
    wire [3:0]hour_high;
    wire [3:0]hour_low;
    wire clk_1d;
    wire clk190;
    
    wire [3:0] add_hour_high;
    wire [3:0] add_hour_low;
    wire [3:0] add_min_high;
    wire [3:0] add_min_low;
    
    clk_1s U1(
        .clk(clk),
        .reset(reset),   //clk接w5 
        .clk_1s(clk_1s)
        );
        
    clkdiv U2(
        .clk(clk),
        .clr(reset),
        .clk190(clk190)
            );
        
     sec U3(
        .clk(clk_1s),
        .reset(reset),
        .sec_high(sec_high),
        .sec_low(sec_low),
        .carry(clk_1m)
        );
            
      min U4(
      	.alarm_ad(alarm_ad),
      	.clk_1s(clk_1s),
      	.set_min(set_min),
        .clk(clk_1m),
        .reset(reset),  //clk输入秒计数模块的进位 
        .min_high(min_high),
        .min_low(min_low),
        .carry(clk_1h)
       );
       
       hour U5(
       		.alarm_ad(alarm_ad),
        	.clk_1s(clk_1s),
    	   .set_hour(set_hour),
           .clk(clk_1h),
           .reset(reset),  //clk输入分计数模块的进位 
           .hour_high(hour_high),
           .hour_low(hour_low),
           .carry(clk_1d)
           );
           
           
        set_alarm U8(
			.clk_1s(clk_1s),  
			.alarm_ad(alarm_ad),
			.set_alr_min(set_min), 
			.set_alr_hour(set_hour),  //调整按键 
			.add_hour_high(add_hour_high),
			.add_hour_low(add_hour_low),
			.add_min_high(add_min_high),
			.add_min_low(add_min_low)
			);   
			
			
		alarm U9(   
		    .alarm_on(alarm_on),   
			.hour_high(hour_high),
			.hour_low(hour_low),
			.min_high(min_high),
			.min_low(min_low),
			.add_hour_high(add_hour_high),
			.add_hour_low(add_hour_low),
			.add_min_high(add_min_high),
			.add_min_low(add_min_low),
			.clk(clk_1s),
			.clk190(clk190),   //穿入1s 
			.reset(reset1),   //停止灯亮 
			.led(led)
			);	
			
		clk_1ms U10(
			.clk(clk),
			.reset(reset),   //clk接w5 
			.clk_1ms(clk_1ms)
			);
			
			wire [3:0] mil_sec_high;
			wire [3:0] mil_sec_low;
			wire [3:0] sec_high1;
			wire [3:0] sec_low1;
			
		stopwatch U7(
			.clk_1ms(clk_1ms),
			.reset1(reset1),
			.mode(mode),
			.btn(btn),
			.mil_sec_high(mil_sec_high),
			.mil_sec_low(mil_sec_low),
			.sec_high1(sec_high1),
			.sec_low1(sec_low1),
			.led(led_stw)
			);
           
    	reg [3:0]digit3;
    	reg [3:0]digit2;
    	reg [3:0]digit1;
    	reg [3:0]digit0;
    
    //时分到分秒的切换 
    	always@(posedge clk)
		begin
			if(change==1&&alarm_ad==0&&mode==0)
			begin
				digit3<=hour_high;
    			digit2<=hour_low;
    			digit1<=min_high;
    			digit0<=min_low;
			end
			else if(change==0 && alarm_ad==0&&mode==0)
			begin
				digit3<=min_high;
    			digit2<=min_low;
    			digit1<=sec_high;
    			digit0<=sec_low;
			end
			else if(alarm_ad==1&&mode==0)
			begin
				digit3<=add_hour_high;   //显示闹钟调整 
    			digit2<=add_hour_low;
    			digit1<=add_min_high;
    			digit0<=add_min_low;
			end
			else if(mode==1)
			begin
				digit3<=sec_high1;
    			digit2<=sec_low1;
    			digit1<=mil_sec_high;
    			digit0<=mil_sec_low;
			end
		end 
    	
        x7seg_msg U6(
           .clk(clk190),   //传入clk190
           .clr(reset),
           .digit3(digit3),   //需要改成分钟和时钟 
           .digit2(digit2),
           .digit1(digit1),
           .digit0(digit0),
           .a_to_g(a_to_g),  //段选段
           .an(an)  //位选端
               );    
       
  endmodule
