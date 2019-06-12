//1. `timescale 1ns / 1ps，含义为：时延单位为1ns，时延精度为1ps。
//2. 在编译过程中，`timescale会影响其后面所有模块中的时延值，直至遇到另一个
//`timescale指令或`resetall指令。
//3. 当一个设计中的多个模块带有自身的`timescale编译指令时，模拟器将定位
//在所有模块的最小时延精度上，并且所有时延都相应地换算为最小时延精度。

`timescale 1ns / 1ps

//时钟分频器 
//赫兹是频率单位，秒是时间单位，频率分之一是时间，所以赫兹=1/秒 
module clkdiv (
input wire clk,
 input wire clr, 
 output wire clk190,
  output wire clk01); 
  reg [40:0] q; // 41 位计数器 
  always @ (posedge clk or posedge clr)
   begin 
   if (clr==1)      
      q <= 0;
       else      
          q <= q + 1;
   end 
assign clk190 = q[17];  // 190 Hz 用于数码管的扫描显示 
assign  clk01=q[25];// 1.5 Hz
 endmodule

//数码管显示模块,含时分到分秒的切换 
//bug：清零
module x7seg_msg( 
        input wire [3:0]second1,//个位秒，显示的最大数字是9 
         input wire [3:0]second2,//十位秒，显示的最大数字是5 
          input wire [3:0]minute1,//个位分，显示的最大数字是9  
           input wire [3:0]minute2,//个位分，显示的最大数字是5 
           input wire[3:0]hour1,//个位时，显示的最大数字是3
           input wire[3:0]hour2,//十位时，显示的最大数字是2 
            input wire clk190,
            input wire clr,
            input wire change,//时分到分秒的切换 
             output reg [6:0] a_to_g,//七段管 
             output reg [3:0] an ); //四块显示屏分别显示的数字 
             reg [1:0] s;
              reg [3:0] digit;
              wire [3:0] aen;
              assign aen = 4'b1111; 
	//一共四位数码管，每一位显示什么数字
          always @ (* ) 
           case (s) 
           0://数码管最低位(最右） 
            begin
                if(change) 
                    digit=minute1;
            else
                  digit = second1;
             end
           1:
		    begin
                if(change)
                    digit=minute2;
              else
                     digit = second2;
              end
           2:   
		   begin
               if(change)
                   digit=hour1;
               else
                    digit = minute1;  
                end  
           3://数码管最高位(最左）  
		   begin
               if(change)
                   digit=hour2;
                else
                     digit = minute2;    
            end
           endcase
	//控制digit显示的数字是什么
       always @ ( * )
           case (digit)     
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
           default: a_to_g = 7'b0000001;//显示0；  
           endcase
	
      always @ (posedge clk190 or posedge clr)
       begin      
           if (clr ==1) //清零
           begin    
               s <= 0;
           end  
           else      //每次190HZ的频率闪过就选择亮哪一盏灯
               s<=s+1;
        end 
        
        //确保每个数码管上都有显示数字
            always @ ( *) 
                 begin      
                   an = 4'b1111; //共阴极，全部不亮
                    if (aen[s] == 1)   //控制哪一位亮      
                    an[s] = 0; 
                     if(clr==1)
                     an = 4'b1111;  
                 end 
    endmodule 


//顶层模块
module scroll_top(
        input wire clk,
        input wire btn,
        input wire add_h1,//按键调整时钟； 
        input wire add_m1,//按键调整分钟； 
        input wire change1,//按键实现时分到分秒的切换； 
        output wire[3:0]an,
        output wire[6:0]a_to_g);
        
        wire clk1,clkl190,clr,change,add_m,add_h;
        assign clr=btn;//清零 
        assign change=change1;
        assign add_m=add_m1;
        assign add_h=add_h1;
        reg[3:0]second1,second2,minute1,minute2,hour1,hour2;
   	
	//调用分频显示模块
	clkdiv U(.clk(clk),
             .clr(clr),
             .clk190(clk190),
             .clk01(clk1));         
           always @(posedge clk1 )
                begin
                       second1=second1+1;
                    
			//清屏
			if(clr==1)
                            begin
                              second1=4'b0000;
                              second2=4'b0000;
                              minute1=4'b0000;
                              minute2=4'b0000;
                              hour1=4'b0000;
                              hour2=4'b0000;
                        end
			//调整时间，仅限于时钟和分钟 
                        if(add_h)
                            hour1=hour1+1;
                        if(add_m)
                            minute1=minute1+1;
                    if(second1==4'b1010)
                        begin
                            second2=second2+1;
                            second1=4'b0000;
                         end
                    if(second2==4'b0110)
                        begin
                            minute1=minute1+1;
                            second2=4'b0000;
                            end
                         if(minute1==4'b1010)
                            begin
                                minute2=minute2+1;
                                minute1=4'b0000;
                                end
                         if(minute2==4'b0110)
                            begin
                            hour1=hour1+1;
                            minute2=4'b0000;
                            end
                          if(hour1==4'b1010)
                            begin
                            hour2=hour2+1;
                            hour1=4'b0000;
                            end
                            if(hour2==4'b0010&&hour1==4'b0100)
                                begin
                                    hour1=4'b0000;
                                    hour2=4'b0000;
                                 end
             end  
		//显示数字             
              x7seg_msg   R(.second1(second1),  
                            .second2(second2),
                            .minute1(minute1),
                            .minute2(minute2),
                            .hour1(hour1),
                            .hour2(hour2),
                            .clk190(clk190),
                            .clr(clr),
                            .change(change),
                            .a_to_g(a_to_g),
                            .an(an));
 endmodule                                   
