-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Fri Nov 17 22:19:51 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_CLK_div1_0_0/design_1_CLK_div1_0_0_sim_netlist.vhdl
-- Design      : design_1_CLK_div1_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CLK_div1_0_0_CLK_div1 is
  port (
    CLK_div : out STD_LOGIC;
    clr : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_CLK_div1_0_0_CLK_div1 : entity is "CLK_div1";
end design_1_CLK_div1_0_0_CLK_div1;

architecture STRUCTURE of design_1_CLK_div1_0_0_CLK_div1 is
  signal \^clk_div\ : STD_LOGIC;
  signal CLK_div1_i_10_n_0 : STD_LOGIC;
  signal CLK_div1_i_11_n_0 : STD_LOGIC;
  signal CLK_div1_i_1_n_0 : STD_LOGIC;
  signal CLK_div1_i_2_n_0 : STD_LOGIC;
  signal CLK_div1_i_3_n_0 : STD_LOGIC;
  signal CLK_div1_i_4_n_0 : STD_LOGIC;
  signal CLK_div1_i_5_n_0 : STD_LOGIC;
  signal CLK_div1_i_6_n_0 : STD_LOGIC;
  signal CLK_div1_i_7_n_0 : STD_LOGIC;
  signal CLK_div1_i_8_n_0 : STD_LOGIC;
  signal CLK_div1_i_9_n_0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 40 downto 1 );
  signal q : STD_LOGIC_VECTOR ( 40 downto 0 );
  signal q0 : STD_LOGIC_VECTOR ( 40 downto 1 );
  signal \q0_carry__0_n_0\ : STD_LOGIC;
  signal \q0_carry__0_n_1\ : STD_LOGIC;
  signal \q0_carry__0_n_2\ : STD_LOGIC;
  signal \q0_carry__0_n_3\ : STD_LOGIC;
  signal \q0_carry__1_n_0\ : STD_LOGIC;
  signal \q0_carry__1_n_1\ : STD_LOGIC;
  signal \q0_carry__1_n_2\ : STD_LOGIC;
  signal \q0_carry__1_n_3\ : STD_LOGIC;
  signal \q0_carry__2_n_0\ : STD_LOGIC;
  signal \q0_carry__2_n_1\ : STD_LOGIC;
  signal \q0_carry__2_n_2\ : STD_LOGIC;
  signal \q0_carry__2_n_3\ : STD_LOGIC;
  signal \q0_carry__3_n_0\ : STD_LOGIC;
  signal \q0_carry__3_n_1\ : STD_LOGIC;
  signal \q0_carry__3_n_2\ : STD_LOGIC;
  signal \q0_carry__3_n_3\ : STD_LOGIC;
  signal \q0_carry__4_n_0\ : STD_LOGIC;
  signal \q0_carry__4_n_1\ : STD_LOGIC;
  signal \q0_carry__4_n_2\ : STD_LOGIC;
  signal \q0_carry__4_n_3\ : STD_LOGIC;
  signal \q0_carry__5_n_0\ : STD_LOGIC;
  signal \q0_carry__5_n_1\ : STD_LOGIC;
  signal \q0_carry__5_n_2\ : STD_LOGIC;
  signal \q0_carry__5_n_3\ : STD_LOGIC;
  signal \q0_carry__6_n_0\ : STD_LOGIC;
  signal \q0_carry__6_n_1\ : STD_LOGIC;
  signal \q0_carry__6_n_2\ : STD_LOGIC;
  signal \q0_carry__6_n_3\ : STD_LOGIC;
  signal \q0_carry__7_n_0\ : STD_LOGIC;
  signal \q0_carry__7_n_1\ : STD_LOGIC;
  signal \q0_carry__7_n_2\ : STD_LOGIC;
  signal \q0_carry__7_n_3\ : STD_LOGIC;
  signal \q0_carry__8_n_1\ : STD_LOGIC;
  signal \q0_carry__8_n_2\ : STD_LOGIC;
  signal \q0_carry__8_n_3\ : STD_LOGIC;
  signal \q0_carry_i_1__0_n_0\ : STD_LOGIC;
  signal \q0_carry_i_1__1_n_0\ : STD_LOGIC;
  signal \q0_carry_i_1__2_n_0\ : STD_LOGIC;
  signal \q0_carry_i_1__3_n_0\ : STD_LOGIC;
  signal \q0_carry_i_1__4_n_0\ : STD_LOGIC;
  signal \q0_carry_i_1__5_n_0\ : STD_LOGIC;
  signal \q0_carry_i_1__6_n_0\ : STD_LOGIC;
  signal \q0_carry_i_1__7_n_0\ : STD_LOGIC;
  signal \q0_carry_i_1__8_n_0\ : STD_LOGIC;
  signal q0_carry_i_1_n_0 : STD_LOGIC;
  signal \q0_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \q0_carry_i_2__1_n_0\ : STD_LOGIC;
  signal \q0_carry_i_2__2_n_0\ : STD_LOGIC;
  signal \q0_carry_i_2__3_n_0\ : STD_LOGIC;
  signal \q0_carry_i_2__4_n_0\ : STD_LOGIC;
  signal \q0_carry_i_2__5_n_0\ : STD_LOGIC;
  signal \q0_carry_i_2__6_n_0\ : STD_LOGIC;
  signal \q0_carry_i_2__7_n_0\ : STD_LOGIC;
  signal \q0_carry_i_2__8_n_0\ : STD_LOGIC;
  signal q0_carry_i_2_n_0 : STD_LOGIC;
  signal \q0_carry_i_3__0_n_0\ : STD_LOGIC;
  signal \q0_carry_i_3__1_n_0\ : STD_LOGIC;
  signal \q0_carry_i_3__2_n_0\ : STD_LOGIC;
  signal \q0_carry_i_3__3_n_0\ : STD_LOGIC;
  signal \q0_carry_i_3__4_n_0\ : STD_LOGIC;
  signal \q0_carry_i_3__5_n_0\ : STD_LOGIC;
  signal \q0_carry_i_3__6_n_0\ : STD_LOGIC;
  signal \q0_carry_i_3__7_n_0\ : STD_LOGIC;
  signal \q0_carry_i_3__8_n_0\ : STD_LOGIC;
  signal q0_carry_i_3_n_0 : STD_LOGIC;
  signal \q0_carry_i_4__0_n_0\ : STD_LOGIC;
  signal \q0_carry_i_4__1_n_0\ : STD_LOGIC;
  signal \q0_carry_i_4__2_n_0\ : STD_LOGIC;
  signal \q0_carry_i_4__3_n_0\ : STD_LOGIC;
  signal \q0_carry_i_4__4_n_0\ : STD_LOGIC;
  signal \q0_carry_i_4__5_n_0\ : STD_LOGIC;
  signal \q0_carry_i_4__6_n_0\ : STD_LOGIC;
  signal \q0_carry_i_4__7_n_0\ : STD_LOGIC;
  signal \q0_carry_i_4__8_n_0\ : STD_LOGIC;
  signal q0_carry_i_4_n_0 : STD_LOGIC;
  signal q0_carry_n_0 : STD_LOGIC;
  signal q0_carry_n_1 : STD_LOGIC;
  signal q0_carry_n_2 : STD_LOGIC;
  signal q0_carry_n_3 : STD_LOGIC;
  signal \q[0]_i_1_n_0\ : STD_LOGIC;
  signal \q[40]_i_1_n_0\ : STD_LOGIC;
  signal \NLW_q0_carry__8_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
  CLK_div <= \^clk_div\;
CLK_div1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAA15555555"
    )
        port map (
      I0 => clr,
      I1 => CLK_div1_i_2_n_0,
      I2 => CLK_div1_i_3_n_0,
      I3 => CLK_div1_i_4_n_0,
      I4 => CLK_div1_i_5_n_0,
      I5 => \^clk_div\,
      O => CLK_div1_i_1_n_0
    );
CLK_div1_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => q(5),
      I1 => q(6),
      I2 => q(4),
      O => CLK_div1_i_10_n_0
    );
CLK_div1_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => q(10),
      I1 => q(11),
      I2 => q(13),
      I3 => q(8),
      I4 => q(9),
      O => CLK_div1_i_11_n_0
    );
CLK_div1_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => q(23),
      I1 => q(21),
      I2 => q(22),
      I3 => q(18),
      I4 => q(19),
      I5 => q(20),
      O => CLK_div1_i_2_n_0
    );
CLK_div1_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => q(29),
      I1 => q(27),
      I2 => q(28),
      I3 => q(24),
      I4 => q(25),
      I5 => q(26),
      O => CLK_div1_i_3_n_0
    );
CLK_div1_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => q(38),
      I1 => q(37),
      I2 => q(36),
      I3 => q(40),
      I4 => q(39),
      I5 => CLK_div1_i_6_n_0,
      O => CLK_div1_i_4_n_0
    );
CLK_div1_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBFBBBBB"
    )
        port map (
      I0 => CLK_div1_i_7_n_0,
      I1 => CLK_div1_i_8_n_0,
      I2 => CLK_div1_i_9_n_0,
      I3 => CLK_div1_i_10_n_0,
      I4 => CLK_div1_i_11_n_0,
      O => CLK_div1_i_5_n_0
    );
CLK_div1_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => q(32),
      I1 => q(30),
      I2 => q(31),
      I3 => q(35),
      I4 => q(33),
      I5 => q(34),
      O => CLK_div1_i_6_n_0
    );
CLK_div1_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7FFFFFFFFFFF"
    )
        port map (
      I0 => q(14),
      I1 => q(15),
      I2 => q(17),
      I3 => q(12),
      I4 => q(13),
      I5 => q(16),
      O => CLK_div1_i_7_n_0
    );
CLK_div1_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => q(8),
      I1 => q(13),
      I2 => q(7),
      I3 => q(10),
      I4 => q(9),
      I5 => q(11),
      O => CLK_div1_i_8_n_0
    );
CLK_div1_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => q(1),
      I1 => q(0),
      I2 => q(2),
      I3 => q(3),
      O => CLK_div1_i_9_n_0
    );
CLK_div1_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => CLK_div1_i_1_n_0,
      Q => \^clk_div\,
      R => '0'
    );
q0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => q0_carry_n_0,
      CO(2) => q0_carry_n_1,
      CO(1) => q0_carry_n_2,
      CO(0) => q0_carry_n_3,
      CYINIT => q(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(4 downto 1),
      S(3) => q0_carry_i_1_n_0,
      S(2) => q0_carry_i_2_n_0,
      S(1) => q0_carry_i_3_n_0,
      S(0) => q0_carry_i_4_n_0
    );
\q0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => q0_carry_n_0,
      CO(3) => \q0_carry__0_n_0\,
      CO(2) => \q0_carry__0_n_1\,
      CO(1) => \q0_carry__0_n_2\,
      CO(0) => \q0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(8 downto 5),
      S(3) => \q0_carry_i_1__0_n_0\,
      S(2) => \q0_carry_i_2__0_n_0\,
      S(1) => \q0_carry_i_3__0_n_0\,
      S(0) => \q0_carry_i_4__0_n_0\
    );
\q0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \q0_carry__0_n_0\,
      CO(3) => \q0_carry__1_n_0\,
      CO(2) => \q0_carry__1_n_1\,
      CO(1) => \q0_carry__1_n_2\,
      CO(0) => \q0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(12 downto 9),
      S(3) => \q0_carry_i_1__1_n_0\,
      S(2) => \q0_carry_i_2__1_n_0\,
      S(1) => \q0_carry_i_3__1_n_0\,
      S(0) => \q0_carry_i_4__1_n_0\
    );
\q0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \q0_carry__1_n_0\,
      CO(3) => \q0_carry__2_n_0\,
      CO(2) => \q0_carry__2_n_1\,
      CO(1) => \q0_carry__2_n_2\,
      CO(0) => \q0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(16 downto 13),
      S(3) => \q0_carry_i_1__2_n_0\,
      S(2) => \q0_carry_i_2__2_n_0\,
      S(1) => \q0_carry_i_3__2_n_0\,
      S(0) => \q0_carry_i_4__2_n_0\
    );
\q0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \q0_carry__2_n_0\,
      CO(3) => \q0_carry__3_n_0\,
      CO(2) => \q0_carry__3_n_1\,
      CO(1) => \q0_carry__3_n_2\,
      CO(0) => \q0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(20 downto 17),
      S(3) => \q0_carry_i_1__3_n_0\,
      S(2) => \q0_carry_i_2__3_n_0\,
      S(1) => \q0_carry_i_3__3_n_0\,
      S(0) => \q0_carry_i_4__3_n_0\
    );
\q0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \q0_carry__3_n_0\,
      CO(3) => \q0_carry__4_n_0\,
      CO(2) => \q0_carry__4_n_1\,
      CO(1) => \q0_carry__4_n_2\,
      CO(0) => \q0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(24 downto 21),
      S(3) => \q0_carry_i_1__4_n_0\,
      S(2) => \q0_carry_i_2__4_n_0\,
      S(1) => \q0_carry_i_3__4_n_0\,
      S(0) => \q0_carry_i_4__4_n_0\
    );
\q0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \q0_carry__4_n_0\,
      CO(3) => \q0_carry__5_n_0\,
      CO(2) => \q0_carry__5_n_1\,
      CO(1) => \q0_carry__5_n_2\,
      CO(0) => \q0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(28 downto 25),
      S(3) => \q0_carry_i_1__5_n_0\,
      S(2) => \q0_carry_i_2__5_n_0\,
      S(1) => \q0_carry_i_3__5_n_0\,
      S(0) => \q0_carry_i_4__5_n_0\
    );
\q0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \q0_carry__5_n_0\,
      CO(3) => \q0_carry__6_n_0\,
      CO(2) => \q0_carry__6_n_1\,
      CO(1) => \q0_carry__6_n_2\,
      CO(0) => \q0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(32 downto 29),
      S(3) => \q0_carry_i_1__6_n_0\,
      S(2) => \q0_carry_i_2__6_n_0\,
      S(1) => \q0_carry_i_3__6_n_0\,
      S(0) => \q0_carry_i_4__6_n_0\
    );
\q0_carry__7\: unisim.vcomponents.CARRY4
     port map (
      CI => \q0_carry__6_n_0\,
      CO(3) => \q0_carry__7_n_0\,
      CO(2) => \q0_carry__7_n_1\,
      CO(1) => \q0_carry__7_n_2\,
      CO(0) => \q0_carry__7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(36 downto 33),
      S(3) => \q0_carry_i_1__7_n_0\,
      S(2) => \q0_carry_i_2__7_n_0\,
      S(1) => \q0_carry_i_3__7_n_0\,
      S(0) => \q0_carry_i_4__7_n_0\
    );
\q0_carry__8\: unisim.vcomponents.CARRY4
     port map (
      CI => \q0_carry__7_n_0\,
      CO(3) => \NLW_q0_carry__8_CO_UNCONNECTED\(3),
      CO(2) => \q0_carry__8_n_1\,
      CO(1) => \q0_carry__8_n_2\,
      CO(0) => \q0_carry__8_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => q0(40 downto 37),
      S(3) => \q0_carry_i_1__8_n_0\,
      S(2) => \q0_carry_i_2__8_n_0\,
      S(1) => \q0_carry_i_3__8_n_0\,
      S(0) => \q0_carry_i_4__8_n_0\
    );
q0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(4),
      O => q0_carry_i_1_n_0
    );
\q0_carry_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(8),
      O => \q0_carry_i_1__0_n_0\
    );
\q0_carry_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(12),
      O => \q0_carry_i_1__1_n_0\
    );
\q0_carry_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(16),
      O => \q0_carry_i_1__2_n_0\
    );
\q0_carry_i_1__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(20),
      O => \q0_carry_i_1__3_n_0\
    );
\q0_carry_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(24),
      O => \q0_carry_i_1__4_n_0\
    );
\q0_carry_i_1__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(28),
      O => \q0_carry_i_1__5_n_0\
    );
\q0_carry_i_1__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(32),
      O => \q0_carry_i_1__6_n_0\
    );
\q0_carry_i_1__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(36),
      O => \q0_carry_i_1__7_n_0\
    );
\q0_carry_i_1__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(40),
      O => \q0_carry_i_1__8_n_0\
    );
q0_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(3),
      O => q0_carry_i_2_n_0
    );
\q0_carry_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(7),
      O => \q0_carry_i_2__0_n_0\
    );
\q0_carry_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(11),
      O => \q0_carry_i_2__1_n_0\
    );
\q0_carry_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(15),
      O => \q0_carry_i_2__2_n_0\
    );
\q0_carry_i_2__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(19),
      O => \q0_carry_i_2__3_n_0\
    );
\q0_carry_i_2__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(23),
      O => \q0_carry_i_2__4_n_0\
    );
\q0_carry_i_2__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(27),
      O => \q0_carry_i_2__5_n_0\
    );
\q0_carry_i_2__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(31),
      O => \q0_carry_i_2__6_n_0\
    );
\q0_carry_i_2__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(35),
      O => \q0_carry_i_2__7_n_0\
    );
\q0_carry_i_2__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(39),
      O => \q0_carry_i_2__8_n_0\
    );
q0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(2),
      O => q0_carry_i_3_n_0
    );
\q0_carry_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(6),
      O => \q0_carry_i_3__0_n_0\
    );
\q0_carry_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(10),
      O => \q0_carry_i_3__1_n_0\
    );
\q0_carry_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(14),
      O => \q0_carry_i_3__2_n_0\
    );
\q0_carry_i_3__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(18),
      O => \q0_carry_i_3__3_n_0\
    );
\q0_carry_i_3__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(22),
      O => \q0_carry_i_3__4_n_0\
    );
\q0_carry_i_3__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(26),
      O => \q0_carry_i_3__5_n_0\
    );
\q0_carry_i_3__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(30),
      O => \q0_carry_i_3__6_n_0\
    );
\q0_carry_i_3__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(34),
      O => \q0_carry_i_3__7_n_0\
    );
\q0_carry_i_3__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(38),
      O => \q0_carry_i_3__8_n_0\
    );
q0_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(1),
      O => q0_carry_i_4_n_0
    );
\q0_carry_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(5),
      O => \q0_carry_i_4__0_n_0\
    );
\q0_carry_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(9),
      O => \q0_carry_i_4__1_n_0\
    );
\q0_carry_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(13),
      O => \q0_carry_i_4__2_n_0\
    );
\q0_carry_i_4__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(17),
      O => \q0_carry_i_4__3_n_0\
    );
\q0_carry_i_4__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(21),
      O => \q0_carry_i_4__4_n_0\
    );
\q0_carry_i_4__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(25),
      O => \q0_carry_i_4__5_n_0\
    );
\q0_carry_i_4__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(29),
      O => \q0_carry_i_4__6_n_0\
    );
\q0_carry_i_4__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(33),
      O => \q0_carry_i_4__7_n_0\
    );
\q0_carry_i_4__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => q(37),
      O => \q0_carry_i_4__8_n_0\
    );
\q[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => q(0),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => \q[0]_i_1_n_0\
    );
\q[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(10),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(10)
    );
\q[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(11),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(11)
    );
\q[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(12),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(12)
    );
\q[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(13),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(13)
    );
\q[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(14),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(14)
    );
\q[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(15),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(15)
    );
\q[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(16),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(16)
    );
\q[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(17),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(17)
    );
\q[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(18),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(18)
    );
\q[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(19),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(19)
    );
\q[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(1),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(1)
    );
\q[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(20),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(20)
    );
\q[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(21),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(21)
    );
\q[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(22),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(22)
    );
\q[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(23),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(23)
    );
\q[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(24),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(24)
    );
\q[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(25),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(25)
    );
\q[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(26),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(26)
    );
\q[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(27),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(27)
    );
\q[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(28),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(28)
    );
\q[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(29),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(29)
    );
\q[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(2),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(2)
    );
\q[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(30),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(30)
    );
\q[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(31),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(31)
    );
\q[32]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(32),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(32)
    );
\q[33]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(33),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(33)
    );
\q[34]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(34),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(34)
    );
\q[35]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(35),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(35)
    );
\q[36]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(36),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(36)
    );
\q[37]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(37),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(37)
    );
\q[38]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(38),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(38)
    );
\q[39]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(39),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(39)
    );
\q[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(3),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(3)
    );
\q[40]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => CLK_div1_i_5_n_0,
      I1 => CLK_div1_i_4_n_0,
      I2 => CLK_div1_i_3_n_0,
      I3 => CLK_div1_i_2_n_0,
      I4 => clr,
      O => \q[40]_i_1_n_0\
    );
\q[40]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(40),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(40)
    );
\q[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(4),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(4)
    );
\q[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(5),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(5)
    );
\q[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(6),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(6)
    );
\q[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(7),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(7)
    );
\q[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(8),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(8)
    );
\q[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => q0(9),
      I1 => CLK_div1_i_5_n_0,
      I2 => CLK_div1_i_4_n_0,
      I3 => CLK_div1_i_3_n_0,
      I4 => CLK_div1_i_2_n_0,
      O => p_1_in(9)
    );
\q_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => \q[0]_i_1_n_0\,
      Q => q(0)
    );
\q_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(10),
      Q => q(10)
    );
\q_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(11),
      Q => q(11)
    );
\q_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(12),
      Q => q(12)
    );
\q_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(13),
      Q => q(13)
    );
\q_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(14),
      Q => q(14)
    );
\q_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(15),
      Q => q(15)
    );
\q_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(16),
      Q => q(16)
    );
\q_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(17),
      Q => q(17)
    );
\q_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(18),
      Q => q(18)
    );
\q_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(19),
      Q => q(19)
    );
\q_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(1),
      Q => q(1)
    );
\q_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(20),
      Q => q(20)
    );
\q_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(21),
      Q => q(21)
    );
\q_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(22),
      Q => q(22)
    );
\q_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(23),
      Q => q(23)
    );
\q_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(24),
      Q => q(24)
    );
\q_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(25),
      Q => q(25)
    );
\q_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(26),
      Q => q(26)
    );
\q_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(27),
      Q => q(27)
    );
\q_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(28),
      Q => q(28)
    );
\q_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(29),
      Q => q(29)
    );
\q_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(2),
      Q => q(2)
    );
\q_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(30),
      Q => q(30)
    );
\q_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(31),
      Q => q(31)
    );
\q_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(32),
      Q => q(32)
    );
\q_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(33),
      Q => q(33)
    );
\q_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(34),
      Q => q(34)
    );
\q_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(35),
      Q => q(35)
    );
\q_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(36),
      Q => q(36)
    );
\q_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(37),
      Q => q(37)
    );
\q_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(38),
      Q => q(38)
    );
\q_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(39),
      Q => q(39)
    );
\q_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(3),
      Q => q(3)
    );
\q_reg[40]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(40),
      Q => q(40)
    );
\q_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(4),
      Q => q(4)
    );
\q_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(5),
      Q => q(5)
    );
\q_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(6),
      Q => q(6)
    );
\q_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(7),
      Q => q(7)
    );
\q_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(8),
      Q => q(8)
    );
\q_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \q[40]_i_1_n_0\,
      CLR => clr,
      D => p_1_in(9),
      Q => q(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CLK_div1_0_0 is
  port (
    CLK : in STD_LOGIC;
    clr : in STD_LOGIC;
    CLK_div : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_CLK_div1_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_CLK_div1_0_0 : entity is "design_1_CLK_div1_0_0,CLK_div1,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_CLK_div1_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_CLK_div1_0_0 : entity is "CLK_div1,Vivado 2016.4";
end design_1_CLK_div1_0_0;

architecture STRUCTURE of design_1_CLK_div1_0_0 is
begin
inst: entity work.design_1_CLK_div1_0_0_CLK_div1
     port map (
      CLK => CLK,
      CLK_div => CLK_div,
      clr => clr
    );
end STRUCTURE;
