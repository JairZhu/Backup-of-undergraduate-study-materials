-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Wed May 17 00:30:17 2017
-- Host        : surface running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ sss_BCD2SEG7_0_0_stub.vhdl
-- Design      : sss_BCD2SEG7_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    LT_n : in STD_LOGIC;
    RBI_n : in STD_LOGIC;
    BCD_D : in STD_LOGIC;
    BCD_C : in STD_LOGIC;
    BCD_B : in STD_LOGIC;
    BCD_A : in STD_LOGIC;
    a : out STD_LOGIC;
    b : out STD_LOGIC;
    c : out STD_LOGIC;
    d : out STD_LOGIC;
    e : out STD_LOGIC;
    f : out STD_LOGIC;
    g : out STD_LOGIC;
    BI_RBO_n : inout STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "LT_n,RBI_n,BCD_D,BCD_C,BCD_B,BCD_A,a,b,c,d,e,f,g,BI_RBO_n";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "BCD2SEG7,Vivado 2016.4";
begin
end;
