-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sat Nov 18 00:36:26 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_avoidshake_0_0/design_1_avoidshake_0_0_stub.vhdl
-- Design      : design_1_avoidshake_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_avoidshake_0_0 is
  Port ( 
    BJ_CLK : in STD_LOGIC;
    BUTTON_IN : in STD_LOGIC;
    BUTTON_OUT : out STD_LOGIC
  );

end design_1_avoidshake_0_0;

architecture stub of design_1_avoidshake_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "BJ_CLK,BUTTON_IN,BUTTON_OUT";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "avoidshake,Vivado 2016.4";
begin
end;
