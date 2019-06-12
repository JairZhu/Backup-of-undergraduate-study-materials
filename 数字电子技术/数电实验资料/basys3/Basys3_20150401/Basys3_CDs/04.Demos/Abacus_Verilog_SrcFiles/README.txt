------------------------------------------------------

Using the Abacus demo files on the Basys3:

This folder contains all the Verilog HDL source files to run the Abacus project on the Basys 3 using Xilinx Vivado.

Follow instructions in the demo video on how to import the files and run the demo on Basys 3.
Youtube link for video demonstration:
(https://www.youtube.com/watch?v=6_GxkslqbcU)

The Adder_Subtractor file performs 8 bit addition and subtraction. 

The Divider file performs 8 bit by 8 bit division using shift, test and restore algorithm. 

multi_4_4_pp0, multi_4_4_pp1, multi_4_4_pp2, multi_4_4_pp3, compute partial products of A times B.

Seg_7_Display is the 7Segment LED display module. 

Binary_to_BCD files convert binary input B, B1 and B2 to BCD output respectively.

Segment_Scroll will scroll the result on the display.  

All the above files are instantiated in the Top_Level source file, Basys3_Abacus_Top.

The Top-Level Source file will implement the following:

Slide switches provide two 8-bit binary inputs A and B. 
Slide Switches [15 down to 8] is input A.
Slide Switches [7 down to 0] is input B.


Inputs from the Push Buttons ( btnU, btnD, btnR, btnL) will allow the user to select different arithmetic operations that will be computed on the inputs A and B.

btnU: Subtraction/Difference ? Result will Scroll
When A>B, difference is positive. 
When A<B, difference is negative. If the button is not held down but just pressed once, the result will scroll. To find out if the result is negative, press and hold onto the push button btnU. This will show the negative sign. 

btnD: Multiplication/Product ? Result will Scroll
btnR: Quotient(Division Operation) ? Press and Hold the button to display result
btnL: Remainder ( Division Operation)  ? Press and Hold the button to display result

Output is displayed on the 7 segment LED display. 

------------------------------------------------------