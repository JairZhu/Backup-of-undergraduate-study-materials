-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Wed May 17 00:30:18 2017
-- Host        : surface running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/73974/Documents/vivado/sss/sss.srcs/sources_1/bd/sss/ip/sss_xup_inv_0_4/sss_xup_inv_0_4_stub.vhdl
-- Design      : sss_xup_inv_0_4
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sss_xup_inv_0_4 is
  Port ( 
    a : in STD_LOGIC;
    y : out STD_LOGIC
  );

end sss_xup_inv_0_4;

architecture stub of sss_xup_inv_0_4 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a,y";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xup_inv,Vivado 2016.4";
begin
end;
