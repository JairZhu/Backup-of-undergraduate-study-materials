-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Fri Nov 17 23:51:26 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_PC_0_0_sim_netlist.vhdl
-- Design      : design_1_PC_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PC is
  port (
    Outputpc : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Reset : in STD_LOGIC;
    Inputpc : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PC;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PC is
  signal \Outputpc[31]_i_1_n_0\ : STD_LOGIC;
begin
\Outputpc[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Reset,
      O => \Outputpc[31]_i_1_n_0\
    );
\Outputpc_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(0),
      Q => Outputpc(0)
    );
\Outputpc_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(10),
      Q => Outputpc(10)
    );
\Outputpc_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(11),
      Q => Outputpc(11)
    );
\Outputpc_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(12),
      Q => Outputpc(12)
    );
\Outputpc_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(13),
      Q => Outputpc(13)
    );
\Outputpc_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(14),
      Q => Outputpc(14)
    );
\Outputpc_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(15),
      Q => Outputpc(15)
    );
\Outputpc_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(16),
      Q => Outputpc(16)
    );
\Outputpc_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(17),
      Q => Outputpc(17)
    );
\Outputpc_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(18),
      Q => Outputpc(18)
    );
\Outputpc_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(19),
      Q => Outputpc(19)
    );
\Outputpc_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(1),
      Q => Outputpc(1)
    );
\Outputpc_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(20),
      Q => Outputpc(20)
    );
\Outputpc_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(21),
      Q => Outputpc(21)
    );
\Outputpc_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(22),
      Q => Outputpc(22)
    );
\Outputpc_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(23),
      Q => Outputpc(23)
    );
\Outputpc_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(24),
      Q => Outputpc(24)
    );
\Outputpc_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(25),
      Q => Outputpc(25)
    );
\Outputpc_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(26),
      Q => Outputpc(26)
    );
\Outputpc_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(27),
      Q => Outputpc(27)
    );
\Outputpc_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(28),
      Q => Outputpc(28)
    );
\Outputpc_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(29),
      Q => Outputpc(29)
    );
\Outputpc_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(2),
      Q => Outputpc(2)
    );
\Outputpc_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(30),
      Q => Outputpc(30)
    );
\Outputpc_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(31),
      Q => Outputpc(31)
    );
\Outputpc_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(3),
      Q => Outputpc(3)
    );
\Outputpc_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(4),
      Q => Outputpc(4)
    );
\Outputpc_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(5),
      Q => Outputpc(5)
    );
\Outputpc_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(6),
      Q => Outputpc(6)
    );
\Outputpc_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(7),
      Q => Outputpc(7)
    );
\Outputpc_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(8),
      Q => Outputpc(8)
    );
\Outputpc_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => Reset,
      CLR => \Outputpc[31]_i_1_n_0\,
      D => Inputpc(9),
      Q => Outputpc(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    CLK : in STD_LOGIC;
    Reset : in STD_LOGIC;
    Outputpc : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Inputpc : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_PC_0_0,PC,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "PC,Vivado 2016.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PC
     port map (
      CLK => CLK,
      Inputpc(31 downto 0) => Inputpc(31 downto 0),
      Outputpc(31 downto 0) => Outputpc(31 downto 0),
      Reset => Reset
    );
end STRUCTURE;
