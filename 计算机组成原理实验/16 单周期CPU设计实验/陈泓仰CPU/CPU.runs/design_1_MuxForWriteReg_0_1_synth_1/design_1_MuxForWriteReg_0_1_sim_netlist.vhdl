-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sun Nov 12 16:57:26 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_MuxForWriteReg_0_1_sim_netlist.vhdl
-- Design      : design_1_MuxForWriteReg_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForWriteReg is
  port (
    Result : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rd : in STD_LOGIC_VECTOR ( 4 downto 0 );
    RegDst : in STD_LOGIC;
    rt : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForWriteReg;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForWriteReg is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Result[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Result[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Result[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \Result[3]_INST_0\ : label is "soft_lutpair1";
begin
\Result[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rd(0),
      I1 => RegDst,
      I2 => rt(0),
      O => Result(0)
    );
\Result[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rd(1),
      I1 => RegDst,
      I2 => rt(1),
      O => Result(1)
    );
\Result[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rd(2),
      I1 => RegDst,
      I2 => rt(2),
      O => Result(2)
    );
\Result[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rd(3),
      I1 => RegDst,
      I2 => rt(3),
      O => Result(3)
    );
\Result[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rd(4),
      I1 => RegDst,
      I2 => rt(4),
      O => Result(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    RegDst : in STD_LOGIC;
    rt : in STD_LOGIC_VECTOR ( 4 downto 0 );
    rd : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Result : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_MuxForWriteReg_0_1,MuxForWriteReg,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "MuxForWriteReg,Vivado 2016.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForWriteReg
     port map (
      RegDst => RegDst,
      Result(4 downto 0) => Result(4 downto 0),
      rd(4 downto 0) => rd(4 downto 0),
      rt(4 downto 0) => rt(4 downto 0)
    );
end STRUCTURE;
