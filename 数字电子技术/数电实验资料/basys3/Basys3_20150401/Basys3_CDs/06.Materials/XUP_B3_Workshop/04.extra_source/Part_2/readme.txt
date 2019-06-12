**************************************************************************************************************
** © Copyright 2010 Xilinx, Inc. All rights reserved.
** This file contains confidential and proprietary information of Xilinx, Inc. and 
** is protected under U.S. and international copyright and other intellectual property laws.
**************************************************************************************************************
**   ____  ____ 
**  /   /\/   / 
** /___/  \  /   Vendor: Xilinx 
** \   \   \/    
**  \   \        readme.txt Version: 		2.0 
**  /   /        Date Last Modified: 		Feb 112014
** /___/   /\    Date Created: 		Feb 112014
** \   \  /  \   Associated Filename: 	ug480.zip
**  \___\/\___\ 
** 
**  Device: 	7 Series Architecture
**  Purpose:	XADC Reference Design
**  Reference: 	
**   
**************************************************************************************************************
**
**  Disclaimer: 
**
**		This disclaimer is not a license and does not grant any rights to the materials 
**              distributed herewith. Except as otherwise provided in a valid license issued to you 
**              by Xilinx, and to the maximum extent permitted by applicable law: 
**              (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, 
**              AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
**              INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
**              FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract 
**              or tort, including negligence, or under any other theory of liability) for any loss or damage 
**              of any kind or nature related to, arising under or in connection with these materials, 
**              including for any direct, or any indirect, special, incidental, or consequential loss 
**              or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered 
**              as a result of any action brought by a third party) even if such damage or loss was 
**              reasonably foreseeable or Xilinx had been advised of the possibility of the same.
**
**
**  Critical Applications:
**
**		Xilinx products are not designed or intended to be fail-safe, or for use in any application 
**		requiring fail-safe performance, such as life-support or safety devices or systems, 
**		Class III medical devices, nuclear facilities, applications related to the deployment of airbags,
**		or any other applications that could lead to death, personal injury, or severe property or 
**		environmental damage (individually and collectively, "Critical Applications"). Customer assumes 
**		the sole risk and liability of any use of Xilinx products in Critical Applications, subject only 
**		to applicable laws and regulations governing limitations on product liability.

**  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
 
**************************************************************************************************************

This readme file contains these sections:

1. REVISION HISTORY
2. OVERVIEW
3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS
4. DESIGN FILE HIERARCHY
5. INSTALLATION AND OPERATING INSTRUCTIONS
6. OTHER INFORMATION (OPTIONAL)
7. SUPPORT


1. REVISION HISTORY 

This readme describes how to use the files that come with UG480

*******************************************************************************

            Readme  
Date        Version      Revision Description
=========================================================================
11/30/2013  2.0          Design has been changed to automatically read out measurements
=========================================================================


2. OVERVIEW
This document describes how to use the files that come with ug480.zip.

This archive contains an example design for instantiating XADC for an 8-Series design. 

The design shows an example of how to access the XADC data using the DRP ports. A small
state machine is used to intialize the XADC so that the averaging is disabled to speed up
simulation times. The initialization also shows the fundamental DRP writing and reading 
to Configuration Register 0 (40H).

After the XADC has been initialized the design's state machine will read all the registers
whenever EOS is active. The exact registers being used and the state machine can be modified
and adjusted to specific design needs.

3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS
* Vivado 2014.1


To use this setup include: 
ug480.v/ug480.vhd and ug480.xdc are the only files needed to create an example that will automatically
read out the measured values after every end of sequence (EOS).

4. DESIGN FILE HIERARCHY
HDL Files
===========
\Source
 |       The Verilog\ and VHDL\ directories contain the Verilog and VHDL 
 |       source code for the triple-rate SDI reference design and demos. 
 +-----  \verilog Directory
 |    
 |           +--\ug480.v
 |              Top level example design file which outputs the measured
 |              analog values after every sequence
 |
 |           +--\ug480.xdc
 |              Constraints for xcku075-ffva1156-1-c-ies
 |
 |           +--\ug480_tb.v
 |              Testbench for simulating ug480.v
 |
 |           +--\ug480_tb.wcfg
 |              Simulation waveform configuration file for simulating the testbench
 |
 |           +--\design.txt
 |              Analog stimulus file
 |
 +-----  \vhdl Directory
 |           +--\ug480.vhd
 |              Top level example design file which outputs the measured
 |              analog values after every sequence
 |
 |           +--\ug480.xdc
 |              Constraints for xcku075-ffva1156-1-c-ies
 |
 |           +--\ug480_tb.vhd
 |              Testbench for simulating ug480.v
 |
 |           +--\ug480_tb.wcfg
 |              Simulation waveform configuration file for simulating the testbench
 |
 |           +--\design.txt
 |              Analog stimulus file
 |


5. INSTALLATION AND OPERATING INSTRUCTIONS 
Vivado TCL commands to rebuild design using ug480.tcl
     1) Open Vivado
     2) In the TCL window
         source ug480_setup.tcl
         <ug480_create_project | ug480_run_project | ug480_sim_project>

The example design has been set for a specific device. Please adjust as needed and update the 
constraints to match. 

More specific customization of the analog stimulus file can be handled by placing
the stimulus file into the associated simulation directory as the System
Management Wizard does. 

6. OTHER INFORMATION (OPTIONAL) 


7. Support

To obtain technical support for this reference design, go to 
www.xilinx.com/support to locate answers to known issues in the Xilinx
Answers Database or to create a WebCase.  

