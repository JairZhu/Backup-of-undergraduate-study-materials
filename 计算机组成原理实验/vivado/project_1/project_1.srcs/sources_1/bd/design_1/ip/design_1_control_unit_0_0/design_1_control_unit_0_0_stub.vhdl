-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Mon Nov 20 11:15:07 2017
-- Host        : XiaoXin running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/vivado/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_control_unit_0_0/design_1_control_unit_0_0_stub.vhdl
-- Design      : design_1_control_unit_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_control_unit_0_0 is
  Port ( 
    q : in STD_LOGIC;
    we : in STD_LOGIC;
    r : out STD_LOGIC
  );

end design_1_control_unit_0_0;

architecture stub of design_1_control_unit_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "q,we,r";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "control_unit,Vivado 2017.3";
begin
end;
