`timescale 1ns / 1ps

module clock_top(
					input wire change,
					input wire set_min,set_hour,
   	 				input wire clk,reset,
    				output wire [6:0]a_to_g,
    				output wire [3:0]an,
    				input wire reset1,
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
      					.clk_1s(clk_1s),
      					.set_min(set_min),
        				.clk(clk_1m),
        				.reset(reset),  //clk输入秒计数模块的进位 
        				.min_high(min_high),
        				.min_low(min_low),
        				.carry(clk_1h)
       				);
       
       			hour U5(
        				.clk_1s(clk_1s),
    	   				.set_hour(set_hour),
           			.clk(clk_1h),
           			.reset(reset),  //clk输入分计数模块的进位 
           			.hour_high(hour_high),
          	 			.hour_low(hour_low),
           			.carry(clk_1d)
           			);

    				reg [3:0]digit3;
    				reg [3:0]digit2;
    				reg [3:0]digit1;
    				reg [3:0]digit0;
    
    			//时分到分秒的切换 
    				always@(posedge clk)
					begin
						if(change==1&&mode==0)
						begin
							digit3<=hour_high;
    						digit2<=hour_low;
    						digit1<=min_high;
    						digit0<=min_low;
						end
						else if(change==0&&mode==0)
							begin
								digit3<=min_high;
    							digit2<=min_low;
    							digit1<=sec_high;
    							digit0<=sec_low;
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
