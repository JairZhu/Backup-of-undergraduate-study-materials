-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Fri Nov 17 22:19:51 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_CLK_div1_0_0/design_1_CLK_div1_0_0_stub.vhdl
-- Design      : design_1_CLK_div1_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_CLK_div1_0_0 is
  Port ( 
    CLK : in STD_LOGIC;
    clr : in STD_LOGIC;
    CLK_div : out STD_LOGIC
  );

end design_1_CLK_div1_0_0;

architecture stub of design_1_CLK_div1_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,clr,CLK_div";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "CLK_div1,Vivado 2016.4";
begin
end;
