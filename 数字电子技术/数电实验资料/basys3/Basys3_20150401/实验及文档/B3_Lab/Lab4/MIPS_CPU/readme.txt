Introduction:
.A simple MIPS CPU, 32bits, designed with verilogHDL, bulit on xilinx vivado.

this demo use 16 switches:
SW[15:0]--control instruction and data input(Misc/3.jpg) 

How to run the demo:
setp1:copy B3_MIPS_CPU_download.bit to USB flash disk, connect USB disk to Basys3, set B3's boot mode to usb boot;
step2:power on Basys3;
step3:Set SW[15] to '0',then set it to '1', do Reset:  (Misc/5.jpg) 
step4:Set SW[9:8] to "10", SW[7:0] to "00000001", then set SW[13] to '1', do Load "data\_bh", so data\_bl will be changed to "00000001", repeat the steps to load data\_ah, data_al, and data\_bl;(Misc/6.jpg) 
step5:Set SW[14] to '1' and SW[12:10] TO "000", do Run "Add", the result = "0000000100000000" + "0000000000000000"= "0000000100000000" will be displaied on leds(Misc/7.jpg) 

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the "run_on_board.tcl" tcl file path.For example, if tcl file is in F:\Src\Tcl,
 you should use this command: cd f:/Src/Tcl;
step3:Then use source command to run tcl.You can just use command: source ./run_on_board.tcl;
step4:Wait for a minute ,then the project is built.
