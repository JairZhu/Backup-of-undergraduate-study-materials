-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sun Nov 12 17:57:22 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_SignZeroExtend_0_0/design_1_SignZeroExtend_0_0_sim_netlist.vhdl
-- Design      : design_1_SignZeroExtend_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_SignZeroExtend_0_0 is
  port (
    InData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ExtSel : in STD_LOGIC;
    OutData : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_SignZeroExtend_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_SignZeroExtend_0_0 : entity is "design_1_SignZeroExtend_0_0,SignZeroExtend,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_SignZeroExtend_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_SignZeroExtend_0_0 : entity is "SignZeroExtend,Vivado 2016.4";
end design_1_SignZeroExtend_0_0;

architecture STRUCTURE of design_1_SignZeroExtend_0_0 is
  signal \^indata\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^outdata\ : STD_LOGIC_VECTOR ( 16 to 16 );
begin
  OutData(31) <= \^outdata\(16);
  OutData(30) <= \^outdata\(16);
  OutData(29) <= \^outdata\(16);
  OutData(28) <= \^outdata\(16);
  OutData(27) <= \^outdata\(16);
  OutData(26) <= \^outdata\(16);
  OutData(25) <= \^outdata\(16);
  OutData(24) <= \^outdata\(16);
  OutData(23) <= \^outdata\(16);
  OutData(22) <= \^outdata\(16);
  OutData(21) <= \^outdata\(16);
  OutData(20) <= \^outdata\(16);
  OutData(19) <= \^outdata\(16);
  OutData(18) <= \^outdata\(16);
  OutData(17) <= \^outdata\(16);
  OutData(16) <= \^outdata\(16);
  OutData(15 downto 0) <= \^indata\(15 downto 0);
  \^indata\(15 downto 0) <= InData(15 downto 0);
\OutData[16]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ExtSel,
      I1 => \^indata\(15),
      O => \^outdata\(16)
    );
end STRUCTURE;
