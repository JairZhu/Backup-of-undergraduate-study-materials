Introduction:
.using microblaze and uart ip, print character string on serial port dubug terminal.


How to run the demo:
step1:power on Basys3, open serial port dubug terminal, choose the right port and baud rate(baud rate:9600);
setp2:download B3_MB_vision_download.bit to Basys3;
step3:then we can see character string on serial port dubug terminal;

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the "MB_Uart.tcl" tcl file path.For example, if tcl file is in F:\Src\Tcl,
 you should use this command: cd f:/Src/Tcl;
step3:Then use source command to run tcl.You can just use command: source ./MB_Vision.tcl;
step4:Wait for a minute ,then the project is built.
step5:export hardware to sdk, launch sdk, create a new application project, add the files in C_source, build the project.
step6:download the bitstream, then run sdk.
