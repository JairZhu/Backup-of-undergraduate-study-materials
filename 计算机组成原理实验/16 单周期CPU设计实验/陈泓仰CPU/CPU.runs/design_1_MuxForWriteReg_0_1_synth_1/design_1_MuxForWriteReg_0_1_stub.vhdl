-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sun Nov 12 16:57:26 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_MuxForWriteReg_0_1_stub.vhdl
-- Design      : design_1_MuxForWriteReg_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    RegDst : in STD_LOGIC;
    rt : in STD_LOGIC_VECTOR ( 4 downto 0 );
    rd : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Result : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "RegDst,rt[4:0],rd[4:0],Result[4:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "MuxForWriteReg,Vivado 2016.4";
begin
end;
