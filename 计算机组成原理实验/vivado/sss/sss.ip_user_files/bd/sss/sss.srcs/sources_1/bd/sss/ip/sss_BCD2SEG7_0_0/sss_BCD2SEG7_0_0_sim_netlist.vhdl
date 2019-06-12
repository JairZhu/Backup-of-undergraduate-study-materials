-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Wed May 17 00:30:18 2017
-- Host        : surface running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/73974/Documents/vivado/sss/sss.srcs/sources_1/bd/sss/ip/sss_BCD2SEG7_0_0/sss_BCD2SEG7_0_0_sim_netlist.vhdl
-- Design      : sss_BCD2SEG7_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sss_BCD2SEG7_0_0_BCD2SEG7 is
  port (
    a : out STD_LOGIC;
    b : out STD_LOGIC;
    c : out STD_LOGIC;
    d : out STD_LOGIC;
    e : out STD_LOGIC;
    f : out STD_LOGIC;
    g : out STD_LOGIC;
    BI_RBO_n : inout STD_LOGIC;
    BCD_D : in STD_LOGIC;
    LT_n : in STD_LOGIC;
    BCD_B : in STD_LOGIC;
    BCD_A : in STD_LOGIC;
    BCD_C : in STD_LOGIC;
    RBI_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of sss_BCD2SEG7_0_0_BCD2SEG7 : entity is "BCD2SEG7";
end sss_BCD2SEG7_0_0_BCD2SEG7;

architecture STRUCTURE of sss_BCD2SEG7_0_0_BCD2SEG7 is
  signal BI_RBO_n_INST_0_i_2_n_0 : STD_LOGIC;
  signal RBO_buffer : STD_LOGIC;
  signal \a_to_g1__3\ : STD_LOGIC;
  signal \a_to_g_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \a_to_g_reg[6]_i_4_n_0\ : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \a_to_g_reg[0]\ : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \a_to_g_reg[0]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \a_to_g_reg[0]_i_3\ : label is "soft_lutpair0";
  attribute XILINX_LEGACY_PRIM of \a_to_g_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \a_to_g_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \a_to_g_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \a_to_g_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \a_to_g_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \a_to_g_reg[6]\ : label is "LD";
begin
BI_RBO_n_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RBO_buffer,
      I1 => BI_RBO_n_INST_0_i_2_n_0,
      O => BI_RBO_n
    );
BI_RBO_n_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => BCD_B,
      I1 => BCD_C,
      I2 => BCD_A,
      I3 => LT_n,
      I4 => RBI_n,
      I5 => BCD_D,
      O => RBO_buffer
    );
BI_RBO_n_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F0F0F0F0F0F1F"
    )
        port map (
      I0 => BCD_D,
      I1 => RBI_n,
      I2 => LT_n,
      I3 => BCD_A,
      I4 => BCD_C,
      I5 => BCD_B,
      O => BI_RBO_n_INST_0_i_2_n_0
    );
\a_to_g_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \a_to_g_reg[0]_i_1_n_0\,
      G => \a_to_g_reg[6]_i_2_n_0\,
      GE => '1',
      Q => g
    );
\a_to_g_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFA88888AA"
    )
        port map (
      I0 => LT_n,
      I1 => \a_to_g1__3\,
      I2 => BCD_A,
      I3 => \a_to_g_reg[0]_i_3_n_0\,
      I4 => BCD_B,
      I5 => \a_to_g_reg[0]_i_4_n_0\,
      O => \a_to_g_reg[0]_i_1_n_0\
    );
\a_to_g_reg[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => RBI_n,
      I1 => BCD_A,
      I2 => BCD_C,
      I3 => BCD_B,
      I4 => BCD_D,
      O => \a_to_g1__3\
    );
\a_to_g_reg[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => BCD_C,
      I1 => BCD_D,
      O => \a_to_g_reg[0]_i_3_n_0\
    );
\a_to_g_reg[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080FFFF"
    )
        port map (
      I0 => BCD_D,
      I1 => LT_n,
      I2 => BCD_B,
      I3 => BCD_A,
      I4 => BI_RBO_n,
      O => \a_to_g_reg[0]_i_4_n_0\
    );
\a_to_g_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \a_to_g_reg[1]_i_1_n_0\,
      G => \a_to_g_reg[6]_i_2_n_0\,
      GE => '1',
      Q => f
    );
\a_to_g_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBBBFBBBBBB"
    )
        port map (
      I0 => \a_to_g_reg[1]_i_2_n_0\,
      I1 => BI_RBO_n,
      I2 => \a_to_g_reg[6]_i_4_n_0\,
      I3 => BCD_B,
      I4 => BCD_A,
      I5 => BCD_D,
      O => \a_to_g_reg[1]_i_1_n_0\
    );
\a_to_g_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A00AA00000A00A2"
    )
        port map (
      I0 => LT_n,
      I1 => RBI_n,
      I2 => BCD_A,
      I3 => BCD_C,
      I4 => BCD_B,
      I5 => BCD_D,
      O => \a_to_g_reg[1]_i_2_n_0\
    );
\a_to_g_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \a_to_g_reg[2]_i_1_n_0\,
      G => \a_to_g_reg[6]_i_2_n_0\,
      GE => '1',
      Q => e
    );
\a_to_g_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => BI_RBO_n,
      I1 => \a_to_g_reg[2]_i_2_n_0\,
      O => \a_to_g_reg[2]_i_1_n_0\
    );
\a_to_g_reg[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF33F3F3333F3FB"
    )
        port map (
      I0 => RBI_n,
      I1 => LT_n,
      I2 => BCD_B,
      I3 => BCD_C,
      I4 => BCD_A,
      I5 => BCD_D,
      O => \a_to_g_reg[2]_i_2_n_0\
    );
\a_to_g_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \a_to_g_reg[3]_i_1_n_0\,
      G => \a_to_g_reg[6]_i_2_n_0\,
      GE => '1',
      Q => d
    );
\a_to_g_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABABAAABAAAAABA"
    )
        port map (
      I0 => \a_to_g_reg[3]_i_2_n_0\,
      I1 => \a_to_g_reg[6]_i_4_n_0\,
      I2 => BCD_A,
      I3 => BCD_C,
      I4 => BCD_D,
      I5 => BCD_B,
      O => \a_to_g_reg[3]_i_1_n_0\
    );
\a_to_g_reg[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \a_to_g_reg[3]_i_3_n_0\,
      I1 => BI_RBO_n,
      O => \a_to_g_reg[3]_i_2_n_0\
    );
\a_to_g_reg[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0A000000000A02"
    )
        port map (
      I0 => LT_n,
      I1 => RBI_n,
      I2 => BCD_A,
      I3 => BCD_C,
      I4 => BCD_B,
      I5 => BCD_D,
      O => \a_to_g_reg[3]_i_3_n_0\
    );
\a_to_g_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \a_to_g_reg[4]_i_1_n_0\,
      G => \a_to_g_reg[6]_i_2_n_0\,
      GE => '1',
      Q => c
    );
\a_to_g_reg[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00008200FFFFFFFF"
    )
        port map (
      I0 => LT_n,
      I1 => BCD_A,
      I2 => BCD_D,
      I3 => BCD_B,
      I4 => BCD_C,
      I5 => BI_RBO_n,
      O => \a_to_g_reg[4]_i_1_n_0\
    );
\a_to_g_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \a_to_g_reg[5]_i_1_n_0\,
      G => \a_to_g_reg[6]_i_2_n_0\,
      GE => '1',
      Q => b
    );
\a_to_g_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00080880FFFFFFFF"
    )
        port map (
      I0 => LT_n,
      I1 => BCD_C,
      I2 => BCD_D,
      I3 => BCD_B,
      I4 => BCD_A,
      I5 => BI_RBO_n,
      O => \a_to_g_reg[5]_i_1_n_0\
    );
\a_to_g_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \a_to_g_reg[6]_i_1_n_0\,
      G => \a_to_g_reg[6]_i_2_n_0\,
      GE => '1',
      Q => a
    );
\a_to_g_reg[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => BI_RBO_n,
      I1 => \a_to_g_reg[6]_i_3_n_0\,
      O => \a_to_g_reg[6]_i_1_n_0\
    );
\a_to_g_reg[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFB"
    )
        port map (
      I0 => BCD_C,
      I1 => BI_RBO_n,
      I2 => BCD_A,
      I3 => \a_to_g_reg[6]_i_4_n_0\,
      I4 => BCD_D,
      I5 => BCD_B,
      O => \a_to_g_reg[6]_i_2_n_0\
    );
\a_to_g_reg[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DEEFDEEEFFFFFFFF"
    )
        port map (
      I0 => BCD_D,
      I1 => BCD_B,
      I2 => BCD_C,
      I3 => BCD_A,
      I4 => RBI_n,
      I5 => LT_n,
      O => \a_to_g_reg[6]_i_3_n_0\
    );
\a_to_g_reg[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00010000FFFFFFFF"
    )
        port map (
      I0 => BCD_D,
      I1 => BCD_B,
      I2 => BCD_C,
      I3 => BCD_A,
      I4 => RBI_n,
      I5 => LT_n,
      O => \a_to_g_reg[6]_i_4_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sss_BCD2SEG7_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of sss_BCD2SEG7_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of sss_BCD2SEG7_0_0 : entity is "sss_BCD2SEG7_0_0,BCD2SEG7,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of sss_BCD2SEG7_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of sss_BCD2SEG7_0_0 : entity is "BCD2SEG7,Vivado 2016.4";
end sss_BCD2SEG7_0_0;

architecture STRUCTURE of sss_BCD2SEG7_0_0 is
begin
inst: entity work.sss_BCD2SEG7_0_0_BCD2SEG7
     port map (
      BCD_A => BCD_A,
      BCD_B => BCD_B,
      BCD_C => BCD_C,
      BCD_D => BCD_D,
      BI_RBO_n => BI_RBO_n,
      LT_n => LT_n,
      RBI_n => RBI_n,
      a => a,
      b => b,
      c => c,
      d => d,
      e => e,
      f => f,
      g => g
    );
end STRUCTURE;
