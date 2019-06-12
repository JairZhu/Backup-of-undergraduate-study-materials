-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Fri Nov 17 00:08:00 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_InsMemory_0_0/design_1_InsMemory_0_0_sim_netlist.vhdl
-- Design      : design_1_InsMemory_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_InsMemory_0_0_InsMemory is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    InsMemRW : in STD_LOGIC;
    IAddress : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_InsMemory_0_0_InsMemory : entity is "InsMemory";
end design_1_InsMemory_0_0_InsMemory;

architecture STRUCTURE of design_1_InsMemory_0_0_InsMemory is
  signal InsDataOut0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal g0_b0_n_0 : STD_LOGIC;
  signal g0_b1_n_0 : STD_LOGIC;
  signal g0_b2_n_0 : STD_LOGIC;
  signal g0_b3_n_0 : STD_LOGIC;
  signal g0_b4_n_0 : STD_LOGIC;
  signal g0_b5_n_0 : STD_LOGIC;
  signal g0_b6_n_0 : STD_LOGIC;
  signal g0_b7_n_0 : STD_LOGIC;
  signal g1_b0_n_0 : STD_LOGIC;
  signal g1_b2_n_0 : STD_LOGIC;
  signal g1_b3_n_0 : STD_LOGIC;
  signal \g1_b6__1_n_0\ : STD_LOGIC;
  signal g1_b7_n_0 : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \InsDataOut_reg[24]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \InsDataOut_reg[25]\ : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \InsDataOut_reg[25]_i_1\ : label is "soft_lutpair0";
  attribute XILINX_LEGACY_PRIM of \InsDataOut_reg[26]\ : label is "LD";
  attribute SOFT_HLUTNM of \InsDataOut_reg[26]_i_1\ : label is "soft_lutpair0";
  attribute XILINX_LEGACY_PRIM of \InsDataOut_reg[27]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \InsDataOut_reg[28]\ : label is "LD";
  attribute SOFT_HLUTNM of \InsDataOut_reg[28]_i_1\ : label is "soft_lutpair1";
  attribute XILINX_LEGACY_PRIM of \InsDataOut_reg[29]\ : label is "LD";
  attribute SOFT_HLUTNM of \InsDataOut_reg[29]_i_1\ : label is "soft_lutpair2";
  attribute XILINX_LEGACY_PRIM of \InsDataOut_reg[30]\ : label is "LD";
  attribute SOFT_HLUTNM of \InsDataOut_reg[30]_i_1\ : label is "soft_lutpair1";
  attribute XILINX_LEGACY_PRIM of \InsDataOut_reg[31]\ : label is "LD";
  attribute SOFT_HLUTNM of \InsDataOut_reg[31]_i_1\ : label is "soft_lutpair2";
begin
\InsDataOut_reg[24]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => InsDataOut0(0),
      G => InsMemRW,
      GE => '1',
      Q => Q(0)
    );
\InsDataOut_reg[24]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b0_n_0,
      I1 => g1_b0_n_0,
      O => InsDataOut0(0),
      S => IAddress(6)
    );
\InsDataOut_reg[25]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => InsDataOut0(1),
      G => InsMemRW,
      GE => '1',
      Q => Q(1)
    );
\InsDataOut_reg[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g1_b2_n_0,
      I1 => IAddress(6),
      I2 => g0_b1_n_0,
      O => InsDataOut0(1)
    );
\InsDataOut_reg[26]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => InsDataOut0(2),
      G => InsMemRW,
      GE => '1',
      Q => Q(2)
    );
\InsDataOut_reg[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g1_b2_n_0,
      I1 => IAddress(6),
      I2 => g0_b2_n_0,
      O => InsDataOut0(2)
    );
\InsDataOut_reg[27]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => InsDataOut0(3),
      G => InsMemRW,
      GE => '1',
      Q => Q(3)
    );
\InsDataOut_reg[27]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b3_n_0,
      I1 => g1_b3_n_0,
      O => InsDataOut0(3),
      S => IAddress(6)
    );
\InsDataOut_reg[28]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => InsDataOut0(4),
      G => InsMemRW,
      GE => '1',
      Q => Q(4)
    );
\InsDataOut_reg[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \g1_b6__1_n_0\,
      I1 => IAddress(6),
      I2 => g0_b4_n_0,
      O => InsDataOut0(4)
    );
\InsDataOut_reg[29]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => InsDataOut0(5),
      G => InsMemRW,
      GE => '1',
      Q => Q(5)
    );
\InsDataOut_reg[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g1_b7_n_0,
      I1 => IAddress(6),
      I2 => g0_b5_n_0,
      O => InsDataOut0(5)
    );
\InsDataOut_reg[30]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => InsDataOut0(6),
      G => InsMemRW,
      GE => '1',
      Q => Q(6)
    );
\InsDataOut_reg[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \g1_b6__1_n_0\,
      I1 => IAddress(6),
      I2 => g0_b6_n_0,
      O => InsDataOut0(6)
    );
\InsDataOut_reg[31]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => InsDataOut0(7),
      G => InsMemRW,
      GE => '1',
      Q => Q(7)
    );
\InsDataOut_reg[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g1_b7_n_0,
      I1 => IAddress(6),
      I2 => g0_b7_n_0,
      O => InsDataOut0(7)
    );
g0_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0920620270000202"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g0_b0_n_0
    );
g0_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002C200C02220A0"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g0_b1_n_0
    );
g0_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1198C200D1100010"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g0_b2_n_0
    );
g0_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1130C851C2005418"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g0_b3_n_0
    );
g0_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1101D044D1110410"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g0_b4_n_0
    );
g0_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1223E355C1066001"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g0_b5_n_0
    );
g0_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000E222CC402200"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g0_b6_n_0
    );
g0_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1011E331C1331111"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g0_b7_n_0
    );
g1_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000000E"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g1_b0_n_0
    );
g1_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000008C"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g1_b2_n_0
    );
g1_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000009E"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g1_b3_n_0
    );
\g1_b6__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(4),
      I4 => IAddress(5),
      O => \g1_b6__1_n_0\
    );
g1_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000000D"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g1_b7_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_InsMemory_0_0 is
  port (
    IAddress : in STD_LOGIC_VECTOR ( 31 downto 0 );
    InsMemRW : in STD_LOGIC;
    op : out STD_LOGIC_VECTOR ( 5 downto 0 );
    rs : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rt : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rd : out STD_LOGIC_VECTOR ( 4 downto 0 );
    immediate : out STD_LOGIC_VECTOR ( 15 downto 0 );
    AJshift : out STD_LOGIC_VECTOR ( 25 downto 0 );
    sa : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_InsMemory_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_InsMemory_0_0 : entity is "design_1_InsMemory_0_0,InsMemory,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_InsMemory_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_InsMemory_0_0 : entity is "InsMemory,Vivado 2016.4";
end design_1_InsMemory_0_0;

architecture STRUCTURE of design_1_InsMemory_0_0 is
  signal \^ajshift\ : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal \AJshift[15]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \AJshift[23]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \g0_b0__0_n_0\ : STD_LOGIC;
  signal \g0_b0__1_n_0\ : STD_LOGIC;
  signal \g0_b0__2_n_0\ : STD_LOGIC;
  signal \g0_b1__0_n_0\ : STD_LOGIC;
  signal \g0_b1__1_n_0\ : STD_LOGIC;
  signal \g0_b1__2_n_0\ : STD_LOGIC;
  signal \g0_b2__0_n_0\ : STD_LOGIC;
  signal \g0_b2__1_n_0\ : STD_LOGIC;
  signal \g0_b2__2_n_0\ : STD_LOGIC;
  signal \g0_b3__0_n_0\ : STD_LOGIC;
  signal \g0_b3__1_n_0\ : STD_LOGIC;
  signal \g0_b3__2_n_0\ : STD_LOGIC;
  signal \g0_b4__0_n_0\ : STD_LOGIC;
  signal \g0_b4__1_n_0\ : STD_LOGIC;
  signal \g0_b4__2_n_0\ : STD_LOGIC;
  signal \g0_b5__0_n_0\ : STD_LOGIC;
  signal \g0_b5__1_n_0\ : STD_LOGIC;
  signal \g0_b5__2_n_0\ : STD_LOGIC;
  signal \g0_b6__0_n_0\ : STD_LOGIC;
  signal \g0_b6__1_n_0\ : STD_LOGIC;
  signal \g0_b6__2_n_0\ : STD_LOGIC;
  signal \g0_b7__0_n_0\ : STD_LOGIC;
  signal \g0_b7__1_n_0\ : STD_LOGIC;
  signal \g0_b7__2_n_0\ : STD_LOGIC;
  signal \g1_b0__0_n_0\ : STD_LOGIC;
  signal \g1_b0__1_n_0\ : STD_LOGIC;
  signal \g1_b0__2_n_0\ : STD_LOGIC;
  signal \g1_b2__0_n_0\ : STD_LOGIC;
  signal \g1_b2__1_n_0\ : STD_LOGIC;
  signal \g1_b2__2_n_0\ : STD_LOGIC;
  signal \g1_b3__0_n_0\ : STD_LOGIC;
  signal \g1_b3__1_n_0\ : STD_LOGIC;
  signal \g1_b3__2_n_0\ : STD_LOGIC;
  signal \g1_b6__0_n_0\ : STD_LOGIC;
  signal \g1_b6__2_n_0\ : STD_LOGIC;
  signal g1_b6_i_1_n_0 : STD_LOGIC;
  signal g1_b6_i_2_n_0 : STD_LOGIC;
  signal g1_b6_i_3_n_0 : STD_LOGIC;
  signal g1_b6_i_4_n_0 : STD_LOGIC;
  signal g1_b6_i_5_n_0 : STD_LOGIC;
  signal g1_b6_n_0 : STD_LOGIC;
  signal \g1_b7__0_i_1_n_0\ : STD_LOGIC;
  signal \g1_b7__0_i_2_n_0\ : STD_LOGIC;
  signal \g1_b7__0_n_0\ : STD_LOGIC;
  signal \g1_b7__1_n_0\ : STD_LOGIC;
  signal \g1_b7__2_n_0\ : STD_LOGIC;
  signal \^sa\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \sa[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal sel : STD_LOGIC_VECTOR ( 5 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \AJshift[23]_INST_0_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \g1_b6__0_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \g1_b6__0_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \g1_b6__0_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \g1_b6__0_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of g1_b6_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of g1_b6_i_2 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g1_b6_i_3 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of g1_b6_i_4 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \g1_b7__0_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \g1_b7__0_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \sa[1]_INST_0_i_1\ : label is "soft_lutpair3";
begin
  AJshift(25 downto 11) <= \^ajshift\(25 downto 11);
  AJshift(10 downto 6) <= \^sa\(4 downto 0);
  AJshift(5 downto 0) <= \^ajshift\(5 downto 0);
  immediate(15 downto 11) <= \^ajshift\(15 downto 11);
  immediate(10 downto 6) <= \^sa\(4 downto 0);
  immediate(5 downto 0) <= \^ajshift\(5 downto 0);
  rd(4 downto 0) <= \^ajshift\(15 downto 11);
  rs(4 downto 0) <= \^ajshift\(25 downto 21);
  rt(4 downto 0) <= \^ajshift\(20 downto 16);
  sa(4 downto 0) <= \^sa\(4 downto 0);
\AJshift[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b0__2_n_0\,
      I1 => \sa[1]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b0__2_n_0\,
      O => \^ajshift\(0)
    );
\AJshift[11]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b3__0_n_0\,
      I1 => \g1_b3__0_n_0\,
      O => \^ajshift\(11),
      S => \AJshift[15]_INST_0_i_1_n_0\
    );
\AJshift[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \g1_b6__2_n_0\,
      I1 => \AJshift[15]_INST_0_i_1_n_0\,
      I2 => \g0_b4__0_n_0\,
      O => \^ajshift\(12)
    );
\AJshift[13]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \g1_b7__0_n_0\,
      I1 => \AJshift[15]_INST_0_i_1_n_0\,
      I2 => \g0_b5__0_n_0\,
      O => \^ajshift\(13)
    );
\AJshift[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \g1_b6__2_n_0\,
      I1 => \AJshift[15]_INST_0_i_1_n_0\,
      I2 => \g0_b6__0_n_0\,
      O => \^ajshift\(14)
    );
\AJshift[15]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \g1_b7__0_n_0\,
      I1 => \AJshift[15]_INST_0_i_1_n_0\,
      I2 => \g0_b7__0_n_0\,
      O => \^ajshift\(15)
    );
\AJshift[15]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => IAddress(4),
      I1 => IAddress(2),
      I2 => IAddress(1),
      I3 => IAddress(3),
      I4 => IAddress(5),
      I5 => IAddress(6),
      O => \AJshift[15]_INST_0_i_1_n_0\
    );
\AJshift[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b0__1_n_0\,
      I1 => \AJshift[23]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b0__1_n_0\,
      O => \^ajshift\(16)
    );
\AJshift[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b2__1_n_0\,
      I1 => \AJshift[23]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b1__1_n_0\,
      O => \^ajshift\(17)
    );
\AJshift[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b2__1_n_0\,
      I1 => \AJshift[23]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b2__1_n_0\,
      O => \^ajshift\(18)
    );
\AJshift[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b3__1_n_0\,
      I1 => \AJshift[23]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b3__1_n_0\,
      O => \^ajshift\(19)
    );
\AJshift[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b2__2_n_0\,
      I1 => \sa[1]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b1__2_n_0\,
      O => \^ajshift\(1)
    );
\AJshift[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b6__0_n_0\,
      I1 => \AJshift[23]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b4__1_n_0\,
      O => \^ajshift\(20)
    );
\AJshift[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b7__1_n_0\,
      I1 => \AJshift[23]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b5__1_n_0\,
      O => \^ajshift\(21)
    );
\AJshift[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b6__0_n_0\,
      I1 => \AJshift[23]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b6__1_n_0\,
      O => \^ajshift\(22)
    );
\AJshift[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b7__1_n_0\,
      I1 => \AJshift[23]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b7__1_n_0\,
      O => \^ajshift\(23)
    );
\AJshift[23]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => IAddress(4),
      I1 => IAddress(2),
      I2 => IAddress(0),
      I3 => IAddress(1),
      I4 => IAddress(3),
      O => \AJshift[23]_INST_0_i_1_n_0\
    );
\AJshift[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b2__2_n_0\,
      I1 => \sa[1]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b2__2_n_0\,
      O => \^ajshift\(2)
    );
\AJshift[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b3__2_n_0\,
      I1 => \sa[1]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b3__2_n_0\,
      O => \^ajshift\(3)
    );
\AJshift[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => g1_b6_n_0,
      I1 => \sa[1]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b4__2_n_0\,
      O => \^ajshift\(4)
    );
\AJshift[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b7__2_n_0\,
      I1 => \sa[1]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b5__2_n_0\,
      O => \^ajshift\(5)
    );
\g0_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1208A84020608800"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g0_b0__0_n_0\
    );
\g0_b0__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"06109101B0000101"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b0__1_n_0\
    );
\g0_b0__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"06109101B0000101"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g0_b0__2_n_0\
    );
\g0_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80004840C2402600"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g0_b1__0_n_0\
    );
\g0_b1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001C100C0111050"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b1__1_n_0\
    );
\g0_b1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001C100C0111050"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g0_b1__2_n_0\
    );
\g0_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"052A4840406A0002"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g0_b2__0_n_0\
    );
\g0_b2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2264C100E2200020"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b2__1_n_0\
    );
\g0_b2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2264C100E2200020"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g0_b2__2_n_0\
    );
\g0_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"022A50C648400172"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g0_b3__0_n_0\
    );
\g0_b3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2230C4A2C100A824"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b3__1_n_0\
    );
\g0_b3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2230C4A2C100A824"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g0_b3__2_n_0\
    );
\g0_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A8406540EA0012"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g0_b4__0_n_0\
    );
\g0_b4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2202E088E2220820"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b4__1_n_0\
    );
\g0_b4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2202E088E2220820"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g0_b4__2_n_0\
    );
\g0_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8AA068CFC04920C0"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g0_b5__0_n_0\
    );
\g0_b5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2113D3AAC2099002"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b5__1_n_0\
    );
\g0_b5__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2113D3AAC2099002"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g0_b5__2_n_0\
    );
\g0_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020EA4050542800"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g0_b6__0_n_0\
    );
\g0_b6__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000D111CC801100"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b6__1_n_0\
    );
\g0_b6__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000D111CC801100"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g0_b6__2_n_0\
    );
\g0_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A26ACAC2CA00AA"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g0_b7__0_n_0\
    );
\g0_b7__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2022D332C2332222"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b7__1_n_0\
    );
\g0_b7__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2022D332C2332222"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g0_b7__2_n_0\
    );
\g1_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008101"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g1_b0__0_n_0\
    );
\g1_b0__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000000D"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g1_b0__1_n_0\
    );
\g1_b0__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000000D"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g1_b0__2_n_0\
    );
\g1_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000501"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g1_b2__0_n_0\
    );
\g1_b2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000004C"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g1_b2__1_n_0\
    );
\g1_b2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000004C"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g1_b2__2_n_0\
    );
\g1_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008503"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g1_b3__0_n_0\
    );
\g1_b3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000006D"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g1_b3__1_n_0\
    );
\g1_b3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000006D"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g1_b3__2_n_0\
    );
g1_b6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => g1_b6_i_1_n_0,
      I1 => g1_b6_i_2_n_0,
      I2 => g1_b6_i_3_n_0,
      I3 => g1_b6_i_4_n_0,
      I4 => g1_b6_i_5_n_0,
      O => g1_b6_n_0
    );
\g1_b6__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => sel(1),
      I1 => sel(2),
      I2 => sel(3),
      I3 => sel(4),
      I4 => sel(5),
      O => \g1_b6__0_n_0\
    );
\g1_b6__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      O => sel(1)
    );
\g1_b6__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      O => sel(2)
    );
\g1_b6__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(0),
      I2 => IAddress(2),
      I3 => IAddress(3),
      O => sel(3)
    );
\g1_b6__0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => IAddress(2),
      I1 => IAddress(0),
      I2 => IAddress(1),
      I3 => IAddress(3),
      I4 => IAddress(4),
      O => sel(4)
    );
\g1_b6__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => IAddress(3),
      I1 => IAddress(1),
      I2 => IAddress(0),
      I3 => IAddress(2),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => sel(5)
    );
\g1_b6__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => \g1_b7__0_i_1_n_0\,
      I4 => \g1_b7__0_i_2_n_0\,
      O => \g1_b6__2_n_0\
    );
g1_b6_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(0),
      O => g1_b6_i_1_n_0
    );
g1_b6_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(0),
      I2 => IAddress(2),
      O => g1_b6_i_2_n_0
    );
g1_b6_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FE0"
    )
        port map (
      I0 => IAddress(0),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(3),
      O => g1_b6_i_3_n_0
    );
g1_b6_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"57FFA800"
    )
        port map (
      I0 => IAddress(2),
      I1 => IAddress(1),
      I2 => IAddress(0),
      I3 => IAddress(3),
      I4 => IAddress(4),
      O => g1_b6_i_4_n_0
    );
g1_b6_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"57FFFFFFA8000000"
    )
        port map (
      I0 => IAddress(3),
      I1 => IAddress(0),
      I2 => IAddress(1),
      I3 => IAddress(2),
      I4 => IAddress(4),
      I5 => IAddress(5),
      O => g1_b6_i_5_n_0
    );
\g1_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000181"
    )
        port map (
      I0 => IAddress(1),
      I1 => IAddress(2),
      I2 => IAddress(3),
      I3 => IAddress(0),
      I4 => \g1_b7__0_i_1_n_0\,
      I5 => \g1_b7__0_i_2_n_0\,
      O => \g1_b7__0_n_0\
    );
\g1_b7__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => IAddress(2),
      I1 => IAddress(1),
      I2 => IAddress(3),
      I3 => IAddress(4),
      O => \g1_b7__0_i_1_n_0\
    );
\g1_b7__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => IAddress(3),
      I1 => IAddress(1),
      I2 => IAddress(2),
      I3 => IAddress(4),
      I4 => IAddress(5),
      O => \g1_b7__0_i_2_n_0\
    );
\g1_b7__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000000E"
    )
        port map (
      I0 => IAddress(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g1_b7__1_n_0\
    );
\g1_b7__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000000E"
    )
        port map (
      I0 => IAddress(0),
      I1 => g1_b6_i_1_n_0,
      I2 => g1_b6_i_2_n_0,
      I3 => g1_b6_i_3_n_0,
      I4 => g1_b6_i_4_n_0,
      I5 => g1_b6_i_5_n_0,
      O => \g1_b7__2_n_0\
    );
inst: entity work.design_1_InsMemory_0_0_InsMemory
     port map (
      IAddress(6 downto 0) => IAddress(6 downto 0),
      InsMemRW => InsMemRW,
      Q(7 downto 2) => op(5 downto 0),
      Q(1 downto 0) => \^ajshift\(25 downto 24)
    );
\sa[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => g1_b6_n_0,
      I1 => \sa[1]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b6__2_n_0\,
      O => \^sa\(0)
    );
\sa[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EABF2A80"
    )
        port map (
      I0 => \g1_b7__2_n_0\,
      I1 => \sa[1]_INST_0_i_1_n_0\,
      I2 => IAddress(5),
      I3 => IAddress(6),
      I4 => \g0_b7__2_n_0\,
      O => \^sa\(1)
    );
\sa[1]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88800000"
    )
        port map (
      I0 => IAddress(4),
      I1 => IAddress(2),
      I2 => IAddress(1),
      I3 => IAddress(0),
      I4 => IAddress(3),
      O => \sa[1]_INST_0_i_1_n_0\
    );
\sa[2]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b0__0_n_0\,
      I1 => \g1_b0__0_n_0\,
      O => \^sa\(2),
      S => \AJshift[15]_INST_0_i_1_n_0\
    );
\sa[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \g1_b2__0_n_0\,
      I1 => \AJshift[15]_INST_0_i_1_n_0\,
      I2 => \g0_b1__0_n_0\,
      O => \^sa\(3)
    );
\sa[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \g1_b2__0_n_0\,
      I1 => \AJshift[15]_INST_0_i_1_n_0\,
      I2 => \g0_b2__0_n_0\,
      O => \^sa\(4)
    );
end STRUCTURE;
