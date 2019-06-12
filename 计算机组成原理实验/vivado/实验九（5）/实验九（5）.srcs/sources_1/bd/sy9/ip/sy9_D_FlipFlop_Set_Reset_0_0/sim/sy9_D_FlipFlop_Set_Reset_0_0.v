// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:XUP:D_FlipFlop_Set_Reset:1.0
// IP Revision: 2

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module sy9_D_FlipFlop_Set_Reset_0_0 (
  CLK1,
  PR1_n,
  CLR1_n,
  D1,
  CLK2,
  PR2_n,
  CLR2_n,
  D2,
  Q1,
  Q1_n,
  Q2,
  Q2_n
);

input wire CLK1;
input wire PR1_n;
input wire CLR1_n;
input wire D1;
input wire CLK2;
input wire PR2_n;
input wire CLR2_n;
input wire D2;
output wire Q1;
output wire Q1_n;
output wire Q2;
output wire Q2_n;

  D_FlipFlop_Set_Reset inst (
    .CLK1(CLK1),
    .PR1_n(PR1_n),
    .CLR1_n(CLR1_n),
    .D1(D1),
    .CLK2(CLK2),
    .PR2_n(PR2_n),
    .CLR2_n(CLR2_n),
    .D2(D2),
    .Q1(Q1),
    .Q1_n(Q1_n),
    .Q2(Q2),
    .Q2_n(Q2_n)
  );
endmodule
