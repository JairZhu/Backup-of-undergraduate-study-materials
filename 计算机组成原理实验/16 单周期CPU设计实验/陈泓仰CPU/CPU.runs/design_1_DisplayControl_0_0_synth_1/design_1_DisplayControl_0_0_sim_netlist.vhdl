-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Fri Nov 17 23:51:26 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_DisplayControl_0_0_sim_netlist.vhdl
-- Design      : design_1_DisplayControl_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DisplayControl is
  port (
    res : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DbResult : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RsData : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RtData : in STD_LOGIC_VECTOR ( 7 downto 0 );
    control : in STD_LOGIC_VECTOR ( 1 downto 0 );
    NextPC : in STD_LOGIC_VECTOR ( 7 downto 0 );
    AluResult : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RsAddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    RtAddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    NowPC : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DisplayControl;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DisplayControl is
begin
\res[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => DbResult(0),
      I1 => RsData(0),
      I2 => RtData(0),
      I3 => control(1),
      I4 => NextPC(0),
      I5 => control(0),
      O => res(0)
    );
\res[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => AluResult(2),
      I1 => RsAddr(2),
      I2 => RtAddr(2),
      I3 => control(1),
      I4 => NowPC(2),
      I5 => control(0),
      O => res(10)
    );
\res[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => AluResult(3),
      I1 => RsAddr(3),
      I2 => RtAddr(3),
      I3 => control(1),
      I4 => NowPC(3),
      I5 => control(0),
      O => res(11)
    );
\res[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => AluResult(4),
      I1 => RsAddr(4),
      I2 => RtAddr(4),
      I3 => control(1),
      I4 => NowPC(4),
      I5 => control(0),
      O => res(12)
    );
\res[13]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8830"
    )
        port map (
      I0 => AluResult(5),
      I1 => control(0),
      I2 => NowPC(5),
      I3 => control(1),
      O => res(13)
    );
\res[14]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8830"
    )
        port map (
      I0 => AluResult(6),
      I1 => control(0),
      I2 => NowPC(6),
      I3 => control(1),
      O => res(14)
    );
\res[15]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8830"
    )
        port map (
      I0 => AluResult(7),
      I1 => control(0),
      I2 => NowPC(7),
      I3 => control(1),
      O => res(15)
    );
\res[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => DbResult(1),
      I1 => RsData(1),
      I2 => RtData(1),
      I3 => control(1),
      I4 => NextPC(1),
      I5 => control(0),
      O => res(1)
    );
\res[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => DbResult(2),
      I1 => RsData(2),
      I2 => RtData(2),
      I3 => control(1),
      I4 => NextPC(2),
      I5 => control(0),
      O => res(2)
    );
\res[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => DbResult(3),
      I1 => RsData(3),
      I2 => RtData(3),
      I3 => control(1),
      I4 => NextPC(3),
      I5 => control(0),
      O => res(3)
    );
\res[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => DbResult(4),
      I1 => RsData(4),
      I2 => RtData(4),
      I3 => control(1),
      I4 => NextPC(4),
      I5 => control(0),
      O => res(4)
    );
\res[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => DbResult(5),
      I1 => RsData(5),
      I2 => RtData(5),
      I3 => control(1),
      I4 => NextPC(5),
      I5 => control(0),
      O => res(5)
    );
\res[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => DbResult(6),
      I1 => RsData(6),
      I2 => RtData(6),
      I3 => control(1),
      I4 => NextPC(6),
      I5 => control(0),
      O => res(6)
    );
\res[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => DbResult(7),
      I1 => RsData(7),
      I2 => RtData(7),
      I3 => control(1),
      I4 => NextPC(7),
      I5 => control(0),
      O => res(7)
    );
\res[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => AluResult(0),
      I1 => RsAddr(0),
      I2 => RtAddr(0),
      I3 => control(1),
      I4 => NowPC(0),
      I5 => control(0),
      O => res(8)
    );
\res[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCAACCF0FFF000"
    )
        port map (
      I0 => AluResult(1),
      I1 => RsAddr(1),
      I2 => RtAddr(1),
      I3 => control(1),
      I4 => NowPC(1),
      I5 => control(0),
      O => res(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    NowPC : in STD_LOGIC_VECTOR ( 31 downto 0 );
    NextPC : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RsAddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    RsData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RtAddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    RtData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AluResult : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DbResult : in STD_LOGIC_VECTOR ( 31 downto 0 );
    control : in STD_LOGIC_VECTOR ( 1 downto 0 );
    res : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_DisplayControl_0_0,DisplayControl,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "DisplayControl,Vivado 2016.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DisplayControl
     port map (
      AluResult(7 downto 0) => AluResult(7 downto 0),
      DbResult(7 downto 0) => DbResult(7 downto 0),
      NextPC(7 downto 0) => NextPC(7 downto 0),
      NowPC(7 downto 0) => NowPC(7 downto 0),
      RsAddr(4 downto 0) => RsAddr(4 downto 0),
      RsData(7 downto 0) => RsData(7 downto 0),
      RtAddr(4 downto 0) => RtAddr(4 downto 0),
      RtData(7 downto 0) => RtData(7 downto 0),
      control(1 downto 0) => control(1 downto 0),
      res(15 downto 0) => res(15 downto 0)
    );
end STRUCTURE;
