-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Wed Nov 15 23:44:02 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_ControlUnit_0_0_sim_netlist.vhdl
-- Design      : design_1_ControlUnit_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    op : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Zero : in STD_LOGIC;
    Sign : in STD_LOGIC;
    ExtSel : out STD_LOGIC;
    PCWre : out STD_LOGIC;
    InsMemRW : out STD_LOGIC;
    RegDst : out STD_LOGIC;
    RegWre : out STD_LOGIC;
    AluOp : out STD_LOGIC_VECTOR ( 2 downto 0 );
    AluSrcA : out STD_LOGIC;
    AluSrcB : out STD_LOGIC;
    RD : out STD_LOGIC;
    WR : out STD_LOGIC;
    DBDataSrc : out STD_LOGIC;
    PCSrc : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_ControlUnit_0_0,ControlUnit,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ControlUnit,Vivado 2016.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const1>\ : STD_LOGIC;
  signal \PCSrc[0]_INST_0_i_1_n_0\ : STD_LOGIC;
begin
  InsMemRW <= \<const1>\;
\AluOp[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000C500200020"
    )
        port map (
      I0 => op(1),
      I1 => op(0),
      I2 => op(5),
      I3 => op(4),
      I4 => op(3),
      I5 => op(2),
      O => AluOp(0)
    );
\AluOp[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"020200010A000000"
    )
        port map (
      I0 => op(2),
      I1 => op(3),
      I2 => op(4),
      I3 => op(5),
      I4 => op(0),
      I5 => op(1),
      O => AluOp(1)
    );
\AluOp[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000001002000"
    )
        port map (
      I0 => op(1),
      I1 => op(4),
      I2 => op(3),
      I3 => op(5),
      I4 => op(2),
      I5 => op(0),
      O => AluOp(2)
    );
AluSrcA_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000000000000000"
    )
        port map (
      I0 => op(1),
      I1 => op(4),
      I2 => op(3),
      I3 => op(0),
      I4 => op(5),
      I5 => op(2),
      O => AluSrcA
    );
AluSrcB_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000020"
    )
        port map (
      I0 => op(5),
      I1 => op(4),
      I2 => op(3),
      I3 => op(0),
      I4 => op(1),
      O => AluSrcB
    );
DBDataSrc_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000020000004000"
    )
        port map (
      I0 => op(2),
      I1 => op(1),
      I2 => op(0),
      I3 => op(5),
      I4 => op(4),
      I5 => op(3),
      O => DBDataSrc
    );
ExtSel_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFF7FFFFFF"
    )
        port map (
      I0 => op(2),
      I1 => op(3),
      I2 => op(4),
      I3 => op(5),
      I4 => op(0),
      I5 => op(1),
      O => ExtSel
    );
\PCSrc[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80006000"
    )
        port map (
      I0 => Zero,
      I1 => op(0),
      I2 => op(2),
      I3 => \PCSrc[0]_INST_0_i_1_n_0\,
      I4 => op(1),
      O => PCSrc(0)
    );
\PCSrc[0]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => op(4),
      I1 => op(3),
      I2 => op(5),
      O => \PCSrc[0]_INST_0_i_1_n_0\
    );
\PCSrc[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => op(5),
      I1 => op(4),
      I2 => op(0),
      I3 => op(1),
      I4 => op(3),
      I5 => op(2),
      O => PCSrc(1)
    );
PCWre_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => op(5),
      I1 => op(4),
      I2 => op(1),
      I3 => op(0),
      I4 => op(3),
      I5 => op(2),
      O => PCWre
    );
RD_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF7FFFFFFFF"
    )
        port map (
      I0 => op(5),
      I1 => op(1),
      I2 => op(2),
      I3 => op(3),
      I4 => op(4),
      I5 => op(0),
      O => RD
    );
RegDst_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF7FFF7FFE7FFFF"
    )
        port map (
      I0 => op(1),
      I1 => op(0),
      I2 => op(3),
      I3 => op(4),
      I4 => op(5),
      I5 => op(2),
      O => RegDst
    );
RegWre_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFF6FFFFBFF3"
    )
        port map (
      I0 => op(0),
      I1 => op(2),
      I2 => op(5),
      I3 => op(3),
      I4 => op(4),
      I5 => op(1),
      O => RegWre
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
WR_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF7FFFFFFFF"
    )
        port map (
      I0 => op(5),
      I1 => op(2),
      I2 => op(1),
      I3 => op(0),
      I4 => op(4),
      I5 => op(3),
      O => WR
    );
end STRUCTURE;
