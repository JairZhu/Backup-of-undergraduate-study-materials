-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
-- Date        : Sun Oct 12 01:58:03 2014
-- Host        : xshxup31 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               C:/xilinx_workspace/bluetooth_uart/bluetooth_uart.srcs/sources_1/ip/UART_0/UART_0_funcsim.vhdl
-- Design      : UART_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity UART_0_clk is
  port (
    s_tick : out STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of UART_0_clk : entity is "clk";
end UART_0_clk;

architecture STRUCTURE of UART_0_clk is
  signal count_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \n_0_count[0]_i_2\ : STD_LOGIC;
  signal \n_0_count[0]_i_3\ : STD_LOGIC;
  signal \n_0_count[0]_i_4\ : STD_LOGIC;
  signal \n_0_count[0]_i_5\ : STD_LOGIC;
  signal \n_0_count[0]_i_6\ : STD_LOGIC;
  signal \n_0_count[4]_i_2\ : STD_LOGIC;
  signal \n_0_count[4]_i_3\ : STD_LOGIC;
  signal \n_0_count[4]_i_4\ : STD_LOGIC;
  signal \n_0_count[4]_i_5\ : STD_LOGIC;
  signal \n_0_count[8]_i_2\ : STD_LOGIC;
  signal \n_0_count[8]_i_3\ : STD_LOGIC;
  signal \n_0_count_reg[0]_i_1\ : STD_LOGIC;
  signal \n_0_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_0_count_reg[8]_i_1\ : STD_LOGIC;
  signal n_0_tick_i_2 : STD_LOGIC;
  signal n_0_tick_i_3 : STD_LOGIC;
  signal n_0_tick_i_4 : STD_LOGIC;
  signal \n_1_count_reg[0]_i_1\ : STD_LOGIC;
  signal \n_1_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_1_count_reg[8]_i_1\ : STD_LOGIC;
  signal \n_2_count_reg[0]_i_1\ : STD_LOGIC;
  signal \n_2_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_2_count_reg[8]_i_1\ : STD_LOGIC;
  signal \n_3_count_reg[0]_i_1\ : STD_LOGIC;
  signal \n_3_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_3_count_reg[8]_i_1\ : STD_LOGIC;
  signal \n_4_count_reg[0]_i_1\ : STD_LOGIC;
  signal \n_4_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_4_count_reg[8]_i_1\ : STD_LOGIC;
  signal \n_5_count_reg[0]_i_1\ : STD_LOGIC;
  signal \n_5_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_5_count_reg[8]_i_1\ : STD_LOGIC;
  signal \n_6_count_reg[0]_i_1\ : STD_LOGIC;
  signal \n_6_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_6_count_reg[8]_i_1\ : STD_LOGIC;
  signal \n_7_count_reg[0]_i_1\ : STD_LOGIC;
  signal \n_7_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_7_count_reg[8]_i_1\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \xlnx_opt_\ : STD_LOGIC;
  signal NLW_CARRY4_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_CARRY4_DI_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_CARRY4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_CARRY4_S_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute counter : integer;
  attribute counter of \count_reg[0]\ : label is 1;
  attribute counter of \count_reg[10]\ : label is 1;
  attribute counter of \count_reg[11]\ : label is 1;
  attribute counter of \count_reg[12]\ : label is 1;
  attribute counter of \count_reg[1]\ : label is 1;
  attribute counter of \count_reg[2]\ : label is 1;
  attribute counter of \count_reg[3]\ : label is 1;
  attribute counter of \count_reg[4]\ : label is 1;
  attribute counter of \count_reg[5]\ : label is 1;
  attribute counter of \count_reg[6]\ : label is 1;
  attribute counter of \count_reg[7]\ : label is 1;
  attribute counter of \count_reg[8]\ : label is 1;
  attribute counter of \count_reg[9]\ : label is 1;
begin
CARRY4: unisim.vcomponents.CARRY4
    port map (
      CI => \xlnx_opt_\,
      CO(3 downto 1) => NLW_CARRY4_CO_UNCONNECTED(3 downto 1),
      CO(0) => \n_0_count_reg[8]_i_1\,
      CYINIT => '0',
      DI(3 downto 1) => NLW_CARRY4_DI_UNCONNECTED(3 downto 1),
      DI(0) => '0',
      O(3 downto 0) => NLW_CARRY4_O_UNCONNECTED(3 downto 0),
      S(3 downto 1) => NLW_CARRY4_S_UNCONNECTED(3 downto 1),
      S(0) => '1'
    );
\count[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(0),
      I1 => p_0_in,
      O => \n_0_count[0]_i_2\
    );
\count[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(3),
      I1 => p_0_in,
      O => \n_0_count[0]_i_3\
    );
\count[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(2),
      I1 => p_0_in,
      O => \n_0_count[0]_i_4\
    );
\count[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(1),
      I1 => p_0_in,
      O => \n_0_count[0]_i_5\
    );
\count[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => count_reg(0),
      I1 => p_0_in,
      O => \n_0_count[0]_i_6\
    );
\count[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(7),
      I1 => p_0_in,
      O => \n_0_count[4]_i_2\
    );
\count[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(6),
      I1 => p_0_in,
      O => \n_0_count[4]_i_3\
    );
\count[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(5),
      I1 => p_0_in,
      O => \n_0_count[4]_i_4\
    );
\count[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(4),
      I1 => p_0_in,
      O => \n_0_count[4]_i_5\
    );
\count[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(9),
      I1 => p_0_in,
      O => \n_0_count[8]_i_2\
    );
\count[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_reg(8),
      I1 => p_0_in,
      O => \n_0_count[8]_i_3\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_7_count_reg[0]_i_1\,
      Q => count_reg(0)
    );
\count_reg[0]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_count_reg[0]_i_1\,
      CO(2) => \n_1_count_reg[0]_i_1\,
      CO(1) => \n_2_count_reg[0]_i_1\,
      CO(0) => \n_3_count_reg[0]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => \n_0_count[0]_i_2\,
      O(3) => \n_4_count_reg[0]_i_1\,
      O(2) => \n_5_count_reg[0]_i_1\,
      O(1) => \n_6_count_reg[0]_i_1\,
      O(0) => \n_7_count_reg[0]_i_1\,
      S(3) => \n_0_count[0]_i_3\,
      S(2) => \n_0_count[0]_i_4\,
      S(1) => \n_0_count[0]_i_5\,
      S(0) => \n_0_count[0]_i_6\
    );
\count_reg[10]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_5_count_reg[8]_i_1\,
      Q => count_reg(10)
    );
\count_reg[11]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_4_count_reg[8]_i_1\,
      Q => count_reg(11)
    );
\count_reg[12]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_0_count_reg[8]_i_1\,
      Q => count_reg(12)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_6_count_reg[0]_i_1\,
      Q => count_reg(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_5_count_reg[0]_i_1\,
      Q => count_reg(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_4_count_reg[0]_i_1\,
      Q => count_reg(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_7_count_reg[4]_i_1\,
      Q => count_reg(4)
    );
\count_reg[4]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_count_reg[0]_i_1\,
      CO(3) => \n_0_count_reg[4]_i_1\,
      CO(2) => \n_1_count_reg[4]_i_1\,
      CO(1) => \n_2_count_reg[4]_i_1\,
      CO(0) => \n_3_count_reg[4]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_count_reg[4]_i_1\,
      O(2) => \n_5_count_reg[4]_i_1\,
      O(1) => \n_6_count_reg[4]_i_1\,
      O(0) => \n_7_count_reg[4]_i_1\,
      S(3) => \n_0_count[4]_i_2\,
      S(2) => \n_0_count[4]_i_3\,
      S(1) => \n_0_count[4]_i_4\,
      S(0) => \n_0_count[4]_i_5\
    );
\count_reg[5]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_6_count_reg[4]_i_1\,
      Q => count_reg(5)
    );
\count_reg[6]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_5_count_reg[4]_i_1\,
      Q => count_reg(6)
    );
\count_reg[7]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_4_count_reg[4]_i_1\,
      Q => count_reg(7)
    );
\count_reg[8]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_7_count_reg[8]_i_1\,
      Q => count_reg(8)
    );
\count_reg[8]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_count_reg[4]_i_1\,
      CO(3) => \xlnx_opt_\,
      CO(2) => \n_1_count_reg[8]_i_1\,
      CO(1) => \n_2_count_reg[8]_i_1\,
      CO(0) => \n_3_count_reg[8]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_count_reg[8]_i_1\,
      O(2) => \n_5_count_reg[8]_i_1\,
      O(1) => \n_6_count_reg[8]_i_1\,
      O(0) => \n_7_count_reg[8]_i_1\,
      S(3) => '0',
      S(2) => '0',
      S(1) => \n_0_count[8]_i_2\,
      S(0) => \n_0_count[8]_i_3\
    );
\count_reg[9]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_6_count_reg[8]_i_1\,
      Q => count_reg(9)
    );
tick_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFEFFFEFFFF"
    )
    port map (
      I0 => count_reg(11),
      I1 => count_reg(10),
      I2 => count_reg(12),
      I3 => n_0_tick_i_2,
      I4 => n_0_tick_i_3,
      I5 => n_0_tick_i_4,
      O => p_0_in
    );
tick_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => count_reg(5),
      I1 => count_reg(8),
      I2 => count_reg(6),
      I3 => count_reg(4),
      O => n_0_tick_i_2
    );
tick_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"15FF"
    )
    port map (
      I0 => count_reg(2),
      I1 => count_reg(1),
      I2 => count_reg(0),
      I3 => count_reg(3),
      O => n_0_tick_i_3
    );
tick_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
    port map (
      I0 => count_reg(9),
      I1 => count_reg(7),
      I2 => count_reg(8),
      O => n_0_tick_i_4
    );
tick_reg: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in,
      Q => s_tick
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity UART_0_uart_rx is
  port (
    O1 : out STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    rx : in STD_LOGIC;
    s_tick : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of UART_0_uart_rx : entity is "uart_rx";
end UART_0_uart_rx;

architecture STRUCTURE of UART_0_uart_rx is
  signal \^o1\ : STD_LOGIC;
  signal n : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \n_0_n[0]_i_1\ : STD_LOGIC;
  signal \n_0_n[1]_i_1\ : STD_LOGIC;
  signal \n_0_n[2]_i_1\ : STD_LOGIC;
  signal \n_0_n[3]_i_1\ : STD_LOGIC;
  signal \n_0_n[3]_i_2\ : STD_LOGIC;
  signal n_0_rx_done_i_1 : STD_LOGIC;
  signal n_0_rx_done_i_2 : STD_LOGIC;
  signal \n_0_rx_reg[7]_i_1\ : STD_LOGIC;
  signal \n_0_rx_reg[7]_i_2\ : STD_LOGIC;
  signal \n_0_s[3]_i_1\ : STD_LOGIC;
  signal \n_0_s[3]_i_3\ : STD_LOGIC;
  signal \n_0_state[0]_i_1\ : STD_LOGIC;
  signal \n_0_state[1]_i_1\ : STD_LOGIC;
  signal \n_0_state[1]_i_2__0\ : STD_LOGIC;
  signal \n_0_state[1]_i_3\ : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal rx_reg : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_out[0]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \data_out[1]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \data_out[2]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \data_out[3]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \data_out[4]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \data_out[5]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \data_out[6]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \data_out[7]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \n[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \n[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \n[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \n[3]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of rx_done_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rx_reg[7]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \s[0]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s[1]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s[3]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \state[1]_i_2__0\ : label is "soft_lutpair0";
begin
  O1 <= \^o1\;
\data_out[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o1\,
      I1 => rx_reg(0),
      O => data_out(0)
    );
\data_out[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o1\,
      I1 => p_1_in(0),
      O => data_out(1)
    );
\data_out[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o1\,
      I1 => p_1_in(1),
      O => data_out(2)
    );
\data_out[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o1\,
      I1 => p_1_in(2),
      O => data_out(3)
    );
\data_out[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o1\,
      I1 => p_1_in(3),
      O => data_out(4)
    );
\data_out[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o1\,
      I1 => p_1_in(4),
      O => data_out(5)
    );
\data_out[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o1\,
      I1 => p_1_in(5),
      O => data_out(6)
    );
\data_out[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o1\,
      I1 => p_1_in(6),
      O => data_out(7)
    );
\n[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => state(1),
      I1 => n(0),
      O => \n_0_n[0]_i_1\
    );
\n[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
    port map (
      I0 => n(0),
      I1 => state(1),
      I2 => n(1),
      O => \n_0_n[1]_i_1\
    );
\n[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
    port map (
      I0 => n(0),
      I1 => n(1),
      I2 => state(1),
      I3 => n(2),
      O => \n_0_n[2]_i_1\
    );
\n[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000030020000000"
    )
    port map (
      I0 => \n_0_state[1]_i_2__0\,
      I1 => \n_0_s[3]_i_3\,
      I2 => s(3),
      I3 => s_tick,
      I4 => state(1),
      I5 => state(0),
      O => \n_0_n[3]_i_1\
    );
\n[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F800000"
    )
    port map (
      I0 => n(2),
      I1 => n(0),
      I2 => n(1),
      I3 => n(3),
      I4 => state(1),
      O => \n_0_n[3]_i_2\
    );
\n_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_n[3]_i_1\,
      CLR => reset,
      D => \n_0_n[0]_i_1\,
      Q => n(0)
    );
\n_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_n[3]_i_1\,
      CLR => reset,
      D => \n_0_n[1]_i_1\,
      Q => n(1)
    );
\n_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_n[3]_i_1\,
      CLR => reset,
      D => \n_0_n[2]_i_1\,
      Q => n(2)
    );
\n_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_n[3]_i_1\,
      CLR => reset,
      D => \n_0_n[3]_i_2\,
      Q => n(3)
    );
rx_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF044000000"
    )
    port map (
      I0 => n_0_rx_done_i_2,
      I1 => s_tick,
      I2 => rx,
      I3 => state(0),
      I4 => state(1),
      I5 => \^o1\,
      O => n_0_rx_done_i_1
    );
rx_done_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => s(2),
      I1 => s(0),
      I2 => s(1),
      I3 => s(3),
      O => n_0_rx_done_i_2
    );
rx_done_reg: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => n_0_rx_done_i_1,
      Q => \^o1\
    );
\rx_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
    port map (
      I0 => state(0),
      I1 => \n_0_rx_reg[7]_i_2\,
      I2 => s(3),
      I3 => s(1),
      I4 => s(0),
      I5 => s(2),
      O => \n_0_rx_reg[7]_i_1\
    );
\rx_reg[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => state(1),
      I1 => s_tick,
      O => \n_0_rx_reg[7]_i_2\
    );
\rx_reg_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_rx_reg[7]_i_1\,
      CLR => reset,
      D => p_1_in(0),
      Q => rx_reg(0)
    );
\rx_reg_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_rx_reg[7]_i_1\,
      CLR => reset,
      D => p_1_in(1),
      Q => p_1_in(0)
    );
\rx_reg_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_rx_reg[7]_i_1\,
      CLR => reset,
      D => p_1_in(2),
      Q => p_1_in(1)
    );
\rx_reg_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_rx_reg[7]_i_1\,
      CLR => reset,
      D => p_1_in(3),
      Q => p_1_in(2)
    );
\rx_reg_reg[4]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_rx_reg[7]_i_1\,
      CLR => reset,
      D => p_1_in(4),
      Q => p_1_in(3)
    );
\rx_reg_reg[5]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_rx_reg[7]_i_1\,
      CLR => reset,
      D => p_1_in(5),
      Q => p_1_in(4)
    );
\rx_reg_reg[6]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_rx_reg[7]_i_1\,
      CLR => reset,
      D => p_1_in(6),
      Q => p_1_in(5)
    );
\rx_reg_reg[7]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_rx_reg[7]_i_1\,
      CLR => reset,
      D => rx,
      Q => p_1_in(6)
    );
\s[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5754"
    )
    port map (
      I0 => s(0),
      I1 => state(0),
      I2 => state(1),
      I3 => rx,
      O => p_0_out(0)
    );
\s[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FEFE02"
    )
    port map (
      I0 => rx,
      I1 => state(0),
      I2 => state(1),
      I3 => s(1),
      I4 => s(0),
      O => p_0_out(1)
    );
\s[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02FEFEFEFE020202"
    )
    port map (
      I0 => rx,
      I1 => state(0),
      I2 => state(1),
      I3 => s(1),
      I4 => s(0),
      I5 => s(2),
      O => p_0_out(2)
    );
\s[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFF30003"
    )
    port map (
      I0 => n_0_rx_done_i_2,
      I1 => rx,
      I2 => state(0),
      I3 => state(1),
      I4 => s_tick,
      O => \n_0_s[3]_i_1\
    );
\s[3]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCA303A"
    )
    port map (
      I0 => rx,
      I1 => \n_0_s[3]_i_3\,
      I2 => state(1),
      I3 => state(0),
      I4 => s(3),
      O => p_0_out(3)
    );
\s[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => s(1),
      I1 => s(0),
      I2 => s(2),
      O => \n_0_s[3]_i_3\
    );
\s_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_s[3]_i_1\,
      CLR => reset,
      D => p_0_out(0),
      Q => s(0)
    );
\s_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_s[3]_i_1\,
      CLR => reset,
      D => p_0_out(1),
      Q => s(1)
    );
\s_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_s[3]_i_1\,
      CLR => reset,
      D => p_0_out(2),
      Q => s(2)
    );
\s_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_s[3]_i_1\,
      CLR => reset,
      D => p_0_out(3),
      Q => s(3)
    );
\state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFBFCFCF0040"
    )
    port map (
      I0 => \n_0_state[1]_i_2__0\,
      I1 => s_tick,
      I2 => state(1),
      I3 => n_0_rx_done_i_2,
      I4 => \n_0_state[1]_i_3\,
      I5 => state(0),
      O => \n_0_state[0]_i_1\
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"50AA50AAFF00DF00"
    )
    port map (
      I0 => state(0),
      I1 => \n_0_state[1]_i_2__0\,
      I2 => s_tick,
      I3 => state(1),
      I4 => n_0_rx_done_i_2,
      I5 => \n_0_state[1]_i_3\,
      O => \n_0_state[1]_i_1\
    );
\state[1]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => n(2),
      I1 => n(0),
      I2 => n(1),
      I3 => n(3),
      O => \n_0_state[1]_i_2__0\
    );
\state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010189014501"
    )
    port map (
      I0 => state(1),
      I1 => state(0),
      I2 => rx,
      I3 => s_tick,
      I4 => s(3),
      I5 => \n_0_s[3]_i_3\,
      O => \n_0_state[1]_i_3\
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_0_state[0]_i_1\,
      Q => state(0)
    );
\state_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_0_state[1]_i_1\,
      Q => state(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity UART_0_uart_tx is
  port (
    tx : out STD_LOGIC;
    tx_done : out STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    s_tick : in STD_LOGIC;
    tx_btn : in STD_LOGIC;
    btn_buf : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of UART_0_uart_tx : entity is "uart_tx";
end UART_0_uart_tx;

architecture STRUCTURE of UART_0_uart_tx is
  signal data_next : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data_reg : STD_LOGIC_VECTOR ( 0 to 0 );
  signal n : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \n_0_data_reg[7]_i_1\ : STD_LOGIC;
  signal \n_0_data_reg_reg[1]\ : STD_LOGIC;
  signal \n_0_data_reg_reg[2]\ : STD_LOGIC;
  signal \n_0_data_reg_reg[3]\ : STD_LOGIC;
  signal \n_0_data_reg_reg[4]\ : STD_LOGIC;
  signal \n_0_data_reg_reg[5]\ : STD_LOGIC;
  signal \n_0_data_reg_reg[6]\ : STD_LOGIC;
  signal \n_0_data_reg_reg[7]\ : STD_LOGIC;
  signal \n_0_n[0]_i_1\ : STD_LOGIC;
  signal \n_0_n[1]_i_1\ : STD_LOGIC;
  signal \n_0_n[2]_i_1\ : STD_LOGIC;
  signal \n_0_n[2]_i_2\ : STD_LOGIC;
  signal \n_0_s[3]_i_1__0\ : STD_LOGIC;
  signal \n_0_state[0]_i_1\ : STD_LOGIC;
  signal \n_0_state[1]_i_1\ : STD_LOGIC;
  signal \n_0_state[1]_i_2\ : STD_LOGIC;
  signal n_0_tx_done_i_1 : STD_LOGIC;
  signal n_0_tx_done_i_2 : STD_LOGIC;
  signal n_0_tx_done_i_3 : STD_LOGIC;
  signal n_0_tx_i_1 : STD_LOGIC;
  signal s : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^tx\ : STD_LOGIC;
  signal \^tx_done\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_reg[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \data_reg[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \data_reg[3]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \data_reg[4]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \data_reg[5]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \data_reg[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \data_reg[7]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \n[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \n[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \n[2]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \s[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \s[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \s[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of tx_done_i_3 : label is "soft_lutpair12";
begin
  tx <= \^tx\;
  tx_done <= \^tx_done\;
\data_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_0_data_reg_reg[1]\,
      I1 => state(1),
      I2 => data_in(0),
      O => data_next(0)
    );
\data_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_0_data_reg_reg[2]\,
      I1 => state(1),
      I2 => data_in(1),
      O => data_next(1)
    );
\data_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_0_data_reg_reg[3]\,
      I1 => state(1),
      I2 => data_in(2),
      O => data_next(2)
    );
\data_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_0_data_reg_reg[4]\,
      I1 => state(1),
      I2 => data_in(3),
      O => data_next(3)
    );
\data_reg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_0_data_reg_reg[5]\,
      I1 => state(1),
      I2 => data_in(4),
      O => data_next(4)
    );
\data_reg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_0_data_reg_reg[6]\,
      I1 => state(1),
      I2 => data_in(5),
      O => data_next(5)
    );
\data_reg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_0_data_reg_reg[7]\,
      I1 => state(1),
      I2 => data_in(6),
      O => data_next(6)
    );
\data_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"04000400040F0400"
    )
    port map (
      I0 => n_0_tx_done_i_2,
      I1 => s_tick,
      I2 => state(0),
      I3 => state(1),
      I4 => tx_btn,
      I5 => btn_buf,
      O => \n_0_data_reg[7]_i_1\
    );
\data_reg[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => data_in(7),
      I1 => state(1),
      O => data_next(7)
    );
\data_reg_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_data_reg[7]_i_1\,
      CLR => reset,
      D => data_next(0),
      Q => data_reg(0)
    );
\data_reg_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_data_reg[7]_i_1\,
      CLR => reset,
      D => data_next(1),
      Q => \n_0_data_reg_reg[1]\
    );
\data_reg_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_data_reg[7]_i_1\,
      CLR => reset,
      D => data_next(2),
      Q => \n_0_data_reg_reg[2]\
    );
\data_reg_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_data_reg[7]_i_1\,
      CLR => reset,
      D => data_next(3),
      Q => \n_0_data_reg_reg[3]\
    );
\data_reg_reg[4]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_data_reg[7]_i_1\,
      CLR => reset,
      D => data_next(4),
      Q => \n_0_data_reg_reg[4]\
    );
\data_reg_reg[5]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_data_reg[7]_i_1\,
      CLR => reset,
      D => data_next(5),
      Q => \n_0_data_reg_reg[5]\
    );
\data_reg_reg[6]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_data_reg[7]_i_1\,
      CLR => reset,
      D => data_next(6),
      Q => \n_0_data_reg_reg[6]\
    );
\data_reg_reg[7]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_data_reg[7]_i_1\,
      CLR => reset,
      D => data_next(7),
      Q => \n_0_data_reg_reg[7]\
    );
\n[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
    port map (
      I0 => state(1),
      I1 => \n_0_n[2]_i_2\,
      I2 => n(0),
      O => \n_0_n[0]_i_1\
    );
\n[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF37F00000080"
    )
    port map (
      I0 => n(0),
      I1 => s_tick,
      I2 => state(1),
      I3 => state(0),
      I4 => n_0_tx_done_i_2,
      I5 => n(1),
      O => \n_0_n[1]_i_1\
    );
\n[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"70FF8000"
    )
    port map (
      I0 => n(0),
      I1 => n(1),
      I2 => state(1),
      I3 => \n_0_n[2]_i_2\,
      I4 => n(2),
      O => \n_0_n[2]_i_1\
    );
\n[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0028"
    )
    port map (
      I0 => s_tick,
      I1 => state(1),
      I2 => state(0),
      I3 => n_0_tx_done_i_2,
      O => \n_0_n[2]_i_2\
    );
\n_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_0_n[0]_i_1\,
      Q => n(0)
    );
\n_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_0_n[1]_i_1\,
      Q => n(1)
    );
\n_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_0_n[2]_i_1\,
      Q => n(2)
    );
\s[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
    port map (
      I0 => state(1),
      I1 => state(0),
      I2 => s(0),
      O => s_next(0)
    );
\s[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0EE0"
    )
    port map (
      I0 => state(0),
      I1 => state(1),
      I2 => s(0),
      I3 => s(1),
      O => s_next(1)
    );
\s[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"77708880"
    )
    port map (
      I0 => s(0),
      I1 => s(1),
      I2 => state(1),
      I3 => state(0),
      I4 => s(2),
      O => s_next(2)
    );
\s[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF55BABA00001010"
    )
    port map (
      I0 => state(0),
      I1 => btn_buf,
      I2 => tx_btn,
      I3 => n_0_tx_done_i_2,
      I4 => state(1),
      I5 => s_tick,
      O => \n_0_s[3]_i_1__0\
    );
\s[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7F0080808000"
    )
    port map (
      I0 => s(1),
      I1 => s(0),
      I2 => s(2),
      I3 => state(1),
      I4 => state(0),
      I5 => s(3),
      O => s_next(3)
    );
\s_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_s[3]_i_1__0\,
      CLR => reset,
      D => s_next(0),
      Q => s(0)
    );
\s_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_s[3]_i_1__0\,
      CLR => reset,
      D => s_next(1),
      Q => s(1)
    );
\s_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_s[3]_i_1__0\,
      CLR => reset,
      D => s_next(2),
      Q => s(2)
    );
\s_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => \n_0_s[3]_i_1__0\,
      CLR => reset,
      D => s_next(3),
      Q => s(3)
    );
\state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CD2000FFCD22"
    )
    port map (
      I0 => \n_0_state[1]_i_2\,
      I1 => n_0_tx_done_i_2,
      I2 => s_tick,
      I3 => state(0),
      I4 => n_0_tx_done_i_3,
      I5 => state(1),
      O => \n_0_state[0]_i_1\
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CDFDFF003200"
    )
    port map (
      I0 => \n_0_state[1]_i_2\,
      I1 => n_0_tx_done_i_2,
      I2 => s_tick,
      I3 => state(0),
      I4 => n_0_tx_done_i_3,
      I5 => state(1),
      O => \n_0_state[1]_i_1\
    );
\state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => s_tick,
      I1 => state(1),
      I2 => n(2),
      I3 => n(0),
      I4 => n(1),
      O => \n_0_state[1]_i_2\
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_0_state[0]_i_1\,
      Q => state(0)
    );
\state_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \n_0_state[1]_i_1\,
      Q => state(1)
    );
tx_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0C0FFFFC0C04000"
    )
    port map (
      I0 => n_0_tx_done_i_2,
      I1 => s_tick,
      I2 => state(1),
      I3 => state(0),
      I4 => n_0_tx_done_i_3,
      I5 => \^tx_done\,
      O => n_0_tx_done_i_1
    );
tx_done_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => s(2),
      I1 => s(0),
      I2 => s(1),
      I3 => s(3),
      O => n_0_tx_done_i_2
    );
tx_done_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => btn_buf,
      I1 => tx_btn,
      I2 => state(1),
      I3 => state(0),
      O => n_0_tx_done_i_3
    );
tx_done_reg: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => n_0_tx_done_i_1,
      Q => \^tx_done\
    );
tx_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E3E0"
    )
    port map (
      I0 => data_reg(0),
      I1 => state(0),
      I2 => state(1),
      I3 => \^tx\,
      O => n_0_tx_i_1
    );
tx_reg: unisim.vcomponents.FDCE
    port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => n_0_tx_i_1,
      Q => \^tx\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity UART_0_uart_top is
  port (
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    O1 : out STD_LOGIC;
    tx : out STD_LOGIC;
    tx_done : out STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx_btn : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of UART_0_uart_top : entity is "uart_top";
end UART_0_uart_top;

architecture STRUCTURE of UART_0_uart_top is
  signal btn_buf : STD_LOGIC;
  signal s_tick : STD_LOGIC;
begin
CLK_div: entity work.UART_0_clk
    port map (
      clk => clk,
      reset => reset,
      s_tick => s_tick
    );
rx_RnM: entity work.UART_0_uart_rx
    port map (
      O1 => O1,
      clk => clk,
      data_out(7 downto 0) => data_out(7 downto 0),
      reset => reset,
      rx => rx,
      s_tick => s_tick
    );
tx_RnM: entity work.UART_0_uart_tx
    port map (
      btn_buf => btn_buf,
      clk => clk,
      data_in(7 downto 0) => data_in(7 downto 0),
      reset => reset,
      s_tick => s_tick,
      tx => tx,
      tx_btn => tx_btn,
      tx_done => tx_done
    );
btn_buf_reg: unisim.vcomponents.FDRE
    port map (
      C => clk,
      CE => '1',
      D => tx_btn,
      Q => btn_buf,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity UART_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx_btn : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_done : out STD_LOGIC;
    tx_done : out STD_LOGIC;
    tx : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of UART_0 : entity is true;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of UART_0 : entity is "uart_top,Vivado 2014.2";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of UART_0 : entity is "UART_0,uart_top,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of UART_0 : entity is "UART_0,uart_top,{x_ipProduct=Vivado 2014.2,x_ipVendor=xilinx.com,x_ipLibrary=XUP,x_ipName=UART,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,DVSR=651,DATA_WIDTH=8,SB_TICK=16}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of UART_0 : entity is "yes";
end UART_0;

architecture STRUCTURE of UART_0 is
begin
inst: entity work.UART_0_uart_top
    port map (
      O1 => rx_done,
      clk => clk,
      data_in(7 downto 0) => data_in(7 downto 0),
      data_out(7 downto 0) => data_out(7 downto 0),
      reset => reset,
      rx => rx,
      tx => tx,
      tx_btn => tx_btn,
      tx_done => tx_done
    );
end STRUCTURE;
