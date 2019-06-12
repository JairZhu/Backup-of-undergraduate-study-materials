-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Fri Nov 17 11:14:34 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_x7seg_msg_0_0_sim_netlist.vhdl
-- Design      : design_1_x7seg_msg_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_x7seg_msg is
  port (
    pos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    a_to_g : out STD_LOGIC_VECTOR ( 6 downto 0 );
    clr : in STD_LOGIC;
    CLK_div : in STD_LOGIC;
    res : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_x7seg_msg;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_x7seg_msg is
  signal \digit__11\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s[0]_i_1_n_0\ : STD_LOGIC;
  signal \s[1]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \a_to_g[1]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \a_to_g[2]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \a_to_g[3]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \a_to_g[4]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \a_to_g[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \a_to_g[6]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \pos[0]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \pos[1]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \pos[2]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pos[3]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \s[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s[1]_i_1\ : label is "soft_lutpair5";
begin
\a_to_g[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4025"
    )
        port map (
      I0 => \digit__11\(3),
      I1 => \digit__11\(0),
      I2 => \digit__11\(2),
      I3 => \digit__11\(1),
      O => a_to_g(0)
    );
\a_to_g[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5190"
    )
        port map (
      I0 => \digit__11\(3),
      I1 => \digit__11\(2),
      I2 => \digit__11\(0),
      I3 => \digit__11\(1),
      O => a_to_g(1)
    );
\a_to_g[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5710"
    )
        port map (
      I0 => \digit__11\(3),
      I1 => \digit__11\(1),
      I2 => \digit__11\(2),
      I3 => \digit__11\(0),
      O => a_to_g(2)
    );
\a_to_g[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C214"
    )
        port map (
      I0 => \digit__11\(3),
      I1 => \digit__11\(2),
      I2 => \digit__11\(0),
      I3 => \digit__11\(1),
      O => a_to_g(3)
    );
\a_to_g[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A210"
    )
        port map (
      I0 => \digit__11\(3),
      I1 => \digit__11\(0),
      I2 => \digit__11\(1),
      I3 => \digit__11\(2),
      O => a_to_g(4)
    );
\a_to_g[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AC48"
    )
        port map (
      I0 => \digit__11\(3),
      I1 => \digit__11\(2),
      I2 => \digit__11\(0),
      I3 => \digit__11\(1),
      O => a_to_g(5)
    );
\a_to_g[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2094"
    )
        port map (
      I0 => \digit__11\(3),
      I1 => \digit__11\(2),
      I2 => \digit__11\(0),
      I3 => \digit__11\(1),
      O => a_to_g(6)
    );
\a_to_g[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => res(15),
      I1 => res(7),
      I2 => s(0),
      I3 => res(11),
      I4 => s(1),
      I5 => res(3),
      O => \digit__11\(3)
    );
\a_to_g[6]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => res(14),
      I1 => res(6),
      I2 => s(0),
      I3 => res(10),
      I4 => s(1),
      I5 => res(2),
      O => \digit__11\(2)
    );
\a_to_g[6]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => res(12),
      I1 => res(4),
      I2 => s(0),
      I3 => res(8),
      I4 => s(1),
      I5 => res(0),
      O => \digit__11\(0)
    );
\a_to_g[6]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => res(13),
      I1 => res(5),
      I2 => s(0),
      I3 => res(9),
      I4 => s(1),
      I5 => res(1),
      O => \digit__11\(1)
    );
\pos[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => clr,
      I1 => s(0),
      I2 => s(1),
      O => pos(0)
    );
\pos[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => clr,
      I1 => s(1),
      I2 => s(0),
      O => pos(1)
    );
\pos[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => clr,
      I1 => s(0),
      I2 => s(1),
      O => pos(2)
    );
\pos[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => clr,
      I1 => s(0),
      I2 => s(1),
      O => pos(3)
    );
\s[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s(0),
      O => \s[0]_i_1_n_0\
    );
\s[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => s(1),
      I1 => s(0),
      O => \s[1]_i_1_n_0\
    );
\s_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK_div,
      CE => '1',
      CLR => clr,
      D => \s[0]_i_1_n_0\,
      Q => s(0)
    );
\s_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK_div,
      CE => '1',
      CLR => clr,
      D => \s[1]_i_1_n_0\,
      Q => s(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    CLK_div : in STD_LOGIC;
    clr : in STD_LOGIC;
    res : in STD_LOGIC_VECTOR ( 15 downto 0 );
    a_to_g : out STD_LOGIC_VECTOR ( 6 downto 0 );
    pos : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_x7seg_msg_0_0,x7seg_msg,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "x7seg_msg,Vivado 2016.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_x7seg_msg
     port map (
      CLK_div => CLK_div,
      a_to_g(6 downto 0) => a_to_g(6 downto 0),
      clr => clr,
      pos(3 downto 0) => pos(3 downto 0),
      res(15 downto 0) => res(15 downto 0)
    );
end STRUCTURE;
