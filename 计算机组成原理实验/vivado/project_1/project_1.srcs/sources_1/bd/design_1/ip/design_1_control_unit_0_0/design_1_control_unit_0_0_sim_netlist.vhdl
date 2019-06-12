-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Mon Nov 20 11:15:07 2017
-- Host        : XiaoXin running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/vivado/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_control_unit_0_0/design_1_control_unit_0_0_sim_netlist.vhdl
-- Design      : design_1_control_unit_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_control_unit_0_0 is
  port (
    q : in STD_LOGIC;
    we : in STD_LOGIC;
    r : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_control_unit_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_control_unit_0_0 : entity is "design_1_control_unit_0_0,control_unit,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_control_unit_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_control_unit_0_0 : entity is "control_unit,Vivado 2017.3";
end design_1_control_unit_0_0;

architecture STRUCTURE of design_1_control_unit_0_0 is
  component design_1_control_unit_0_0_control_unit is
  port (
    q : in STD_LOGIC;
    we : in STD_LOGIC;
    r : out STD_LOGIC
  );
  end component design_1_control_unit_0_0_control_unit;
begin
inst: component design_1_control_unit_0_0_control_unit
     port map (
      q => q,
      r => r,
      we => we
    );
end STRUCTURE;
