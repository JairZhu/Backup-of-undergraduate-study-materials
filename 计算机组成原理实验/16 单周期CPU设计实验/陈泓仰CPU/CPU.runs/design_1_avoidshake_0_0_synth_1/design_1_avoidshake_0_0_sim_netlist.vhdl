-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sat Nov 18 00:36:26 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_avoidshake_0_0_sim_netlist.vhdl
-- Design      : design_1_avoidshake_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_avoidshake is
  port (
    BUTTON_OUT : out STD_LOGIC;
    BUTTON_IN : in STD_LOGIC;
    BJ_CLK : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_avoidshake;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_avoidshake is
  signal BUTTON_IN_2Q : STD_LOGIC;
  signal BUTTON_IN_3Q : STD_LOGIC;
  signal BUTTON_IN_Q : STD_LOGIC;
begin
BUTTON_IN_2Q_reg: unisim.vcomponents.FDRE
     port map (
      C => BJ_CLK,
      CE => '1',
      D => BUTTON_IN_Q,
      Q => BUTTON_IN_2Q,
      R => '0'
    );
BUTTON_IN_3Q_reg: unisim.vcomponents.FDRE
     port map (
      C => BJ_CLK,
      CE => '1',
      D => BUTTON_IN_2Q,
      Q => BUTTON_IN_3Q,
      R => '0'
    );
BUTTON_IN_Q_reg: unisim.vcomponents.FDRE
     port map (
      C => BJ_CLK,
      CE => '1',
      D => BUTTON_IN,
      Q => BUTTON_IN_Q,
      R => '0'
    );
BUTTON_OUT_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => BUTTON_IN_2Q,
      I1 => BUTTON_IN_3Q,
      O => BUTTON_OUT
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    BJ_CLK : in STD_LOGIC;
    BUTTON_IN : in STD_LOGIC;
    BUTTON_OUT : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_avoidshake_0_0,avoidshake,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "avoidshake,Vivado 2016.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_avoidshake
     port map (
      BJ_CLK => BJ_CLK,
      BUTTON_IN => BUTTON_IN,
      BUTTON_OUT => BUTTON_OUT
    );
end STRUCTURE;
