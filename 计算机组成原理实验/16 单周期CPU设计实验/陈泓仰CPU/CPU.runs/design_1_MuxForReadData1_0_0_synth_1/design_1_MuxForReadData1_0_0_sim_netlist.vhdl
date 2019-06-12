-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sun Nov 12 16:55:58 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_MuxForReadData1_0_0_sim_netlist.vhdl
-- Design      : design_1_MuxForReadData1_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForReadData1 is
  port (
    Result : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Sa : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AluSrcA : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForReadData1;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForReadData1 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Result[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Result[10]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \Result[11]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \Result[12]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \Result[13]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \Result[14]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Result[15]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Result[16]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \Result[17]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \Result[18]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \Result[19]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \Result[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Result[20]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \Result[21]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \Result[22]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \Result[23]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \Result[24]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \Result[25]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \Result[26]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \Result[27]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \Result[28]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \Result[29]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \Result[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \Result[30]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \Result[31]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \Result[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \Result[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Result[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Result[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \Result[7]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \Result[8]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \Result[9]_INST_0\ : label is "soft_lutpair4";
begin
\Result[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Sa(0),
      I1 => Data(0),
      I2 => AluSrcA,
      O => Result(0)
    );
\Result[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(10),
      I1 => AluSrcA,
      O => Result(10)
    );
\Result[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(11),
      I1 => AluSrcA,
      O => Result(11)
    );
\Result[12]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(12),
      I1 => AluSrcA,
      O => Result(12)
    );
\Result[13]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(13),
      I1 => AluSrcA,
      O => Result(13)
    );
\Result[14]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(14),
      I1 => AluSrcA,
      O => Result(14)
    );
\Result[15]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(15),
      I1 => AluSrcA,
      O => Result(15)
    );
\Result[16]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(16),
      I1 => AluSrcA,
      O => Result(16)
    );
\Result[17]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(17),
      I1 => AluSrcA,
      O => Result(17)
    );
\Result[18]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(18),
      I1 => AluSrcA,
      O => Result(18)
    );
\Result[19]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(19),
      I1 => AluSrcA,
      O => Result(19)
    );
\Result[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Sa(1),
      I1 => Data(1),
      I2 => AluSrcA,
      O => Result(1)
    );
\Result[20]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(20),
      I1 => AluSrcA,
      O => Result(20)
    );
\Result[21]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(21),
      I1 => AluSrcA,
      O => Result(21)
    );
\Result[22]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(22),
      I1 => AluSrcA,
      O => Result(22)
    );
\Result[23]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(23),
      I1 => AluSrcA,
      O => Result(23)
    );
\Result[24]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(24),
      I1 => AluSrcA,
      O => Result(24)
    );
\Result[25]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(25),
      I1 => AluSrcA,
      O => Result(25)
    );
\Result[26]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(26),
      I1 => AluSrcA,
      O => Result(26)
    );
\Result[27]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(27),
      I1 => AluSrcA,
      O => Result(27)
    );
\Result[28]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(28),
      I1 => AluSrcA,
      O => Result(28)
    );
\Result[29]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(29),
      I1 => AluSrcA,
      O => Result(29)
    );
\Result[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Sa(2),
      I1 => Data(2),
      I2 => AluSrcA,
      O => Result(2)
    );
\Result[30]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(30),
      I1 => AluSrcA,
      O => Result(30)
    );
\Result[31]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(31),
      I1 => AluSrcA,
      O => Result(31)
    );
\Result[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Sa(3),
      I1 => Data(3),
      I2 => AluSrcA,
      O => Result(3)
    );
\Result[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => Sa(4),
      I1 => Data(4),
      I2 => AluSrcA,
      O => Result(4)
    );
\Result[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(5),
      I1 => AluSrcA,
      O => Result(5)
    );
\Result[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(6),
      I1 => AluSrcA,
      O => Result(6)
    );
\Result[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(7),
      I1 => AluSrcA,
      O => Result(7)
    );
\Result[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(8),
      I1 => AluSrcA,
      O => Result(8)
    );
\Result[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Data(9),
      I1 => AluSrcA,
      O => Result(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    AluSrcA : in STD_LOGIC;
    Data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Sa : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Result : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_MuxForReadData1_0_0,MuxForReadData1,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "MuxForReadData1,Vivado 2016.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForReadData1
     port map (
      AluSrcA => AluSrcA,
      Data(31 downto 0) => Data(31 downto 0),
      Result(31 downto 0) => Result(31 downto 0),
      Sa(4 downto 0) => Sa(4 downto 0)
    );
end STRUCTURE;
