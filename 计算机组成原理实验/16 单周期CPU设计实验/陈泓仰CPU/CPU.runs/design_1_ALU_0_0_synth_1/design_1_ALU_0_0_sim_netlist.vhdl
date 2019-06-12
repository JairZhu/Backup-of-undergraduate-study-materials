-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sun Nov 12 16:55:04 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_ALU_0_0_sim_netlist.vhdl
-- Design      : design_1_ALU_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ALU is
  port (
    Result : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Zero : out STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AluOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \A_4__s_port_\ : in STD_LOGIC;
    \A_18__s_port_\ : in STD_LOGIC;
    \A_26__s_port_\ : in STD_LOGIC;
    \A_2__s_port_\ : in STD_LOGIC;
    \A_10__s_port_\ : in STD_LOGIC;
    \A_16__s_port_\ : in STD_LOGIC;
    \A_24__s_port_\ : in STD_LOGIC;
    \A_0__s_port_\ : in STD_LOGIC;
    \A_8__s_port_\ : in STD_LOGIC;
    p_4_in : in STD_LOGIC;
    data2 : in STD_LOGIC;
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \A_14__s_port_\ : in STD_LOGIC;
    \B[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \A[14]_0\ : in STD_LOGIC;
    \A[14]_1\ : in STD_LOGIC;
    \A[14]_2\ : in STD_LOGIC;
    \B_4__s_port_\ : in STD_LOGIC;
    \A[14]_3\ : in STD_LOGIC;
    \B[0]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \B_5__s_port_\ : in STD_LOGIC;
    \A[14]_4\ : in STD_LOGIC;
    \B_6__s_port_\ : in STD_LOGIC;
    \A[14]_5\ : in STD_LOGIC;
    \B_7__s_port_\ : in STD_LOGIC;
    \A[14]_6\ : in STD_LOGIC;
    \A[14]_7\ : in STD_LOGIC;
    \B[0]_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \A[14]_8\ : in STD_LOGIC;
    \A[14]_9\ : in STD_LOGIC;
    \A[14]_10\ : in STD_LOGIC;
    \B_12__s_port_\ : in STD_LOGIC;
    \A[14]_11\ : in STD_LOGIC;
    \B[0]_2\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \B_13__s_port_\ : in STD_LOGIC;
    \A[14]_12\ : in STD_LOGIC;
    \B_14__s_port_\ : in STD_LOGIC;
    \A[14]_13\ : in STD_LOGIC;
    \B_15__s_port_\ : in STD_LOGIC;
    \A[14]_14\ : in STD_LOGIC;
    \A[14]_15\ : in STD_LOGIC;
    \B[0]_3\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \A[14]_16\ : in STD_LOGIC;
    \A[14]_17\ : in STD_LOGIC;
    \A[14]_18\ : in STD_LOGIC;
    \A[14]_19\ : in STD_LOGIC;
    \B[0]_4\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \A[14]_20\ : in STD_LOGIC;
    \B_22__s_port_\ : in STD_LOGIC;
    \A[14]_21\ : in STD_LOGIC;
    \B_23__s_port_\ : in STD_LOGIC;
    \A[14]_22\ : in STD_LOGIC;
    \A[14]_23\ : in STD_LOGIC;
    \B[0]_5\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \A[14]_24\ : in STD_LOGIC;
    \A[14]_25\ : in STD_LOGIC;
    \A[14]_26\ : in STD_LOGIC;
    \A[14]_27\ : in STD_LOGIC;
    \A[14]_28\ : in STD_LOGIC;
    \A[14]_29\ : in STD_LOGIC;
    \B[0]_6\ : in STD_LOGIC;
    \B[12]_0\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ALU;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ALU is
  signal \A_0__s_net_1\ : STD_LOGIC;
  signal \A_10__s_net_1\ : STD_LOGIC;
  signal \A_14__s_net_1\ : STD_LOGIC;
  signal \A_16__s_net_1\ : STD_LOGIC;
  signal \A_18__s_net_1\ : STD_LOGIC;
  signal \A_24__s_net_1\ : STD_LOGIC;
  signal \A_26__s_net_1\ : STD_LOGIC;
  signal \A_2__s_net_1\ : STD_LOGIC;
  signal \A_4__s_net_1\ : STD_LOGIC;
  signal \A_8__s_net_1\ : STD_LOGIC;
  signal \B_12__s_net_1\ : STD_LOGIC;
  signal \B_13__s_net_1\ : STD_LOGIC;
  signal \B_14__s_net_1\ : STD_LOGIC;
  signal \B_15__s_net_1\ : STD_LOGIC;
  signal \B_22__s_net_1\ : STD_LOGIC;
  signal \B_23__s_net_1\ : STD_LOGIC;
  signal \B_4__s_net_1\ : STD_LOGIC;
  signal \B_5__s_net_1\ : STD_LOGIC;
  signal \B_6__s_net_1\ : STD_LOGIC;
  signal \B_7__s_net_1\ : STD_LOGIC;
  signal \Result[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[10]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[12]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[13]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[14]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[16]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[17]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[18]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[20]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[21]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[22]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[24]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[25]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[26]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[28]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[29]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[30]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[8]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Result[9]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Zero2_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \Zero2_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \Zero2_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \Zero2_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \Zero2_carry__0_n_0\ : STD_LOGIC;
  signal \Zero2_carry__0_n_1\ : STD_LOGIC;
  signal \Zero2_carry__0_n_2\ : STD_LOGIC;
  signal \Zero2_carry__0_n_3\ : STD_LOGIC;
  signal \Zero2_carry__0_n_4\ : STD_LOGIC;
  signal \Zero2_carry__0_n_5\ : STD_LOGIC;
  signal \Zero2_carry__0_n_6\ : STD_LOGIC;
  signal \Zero2_carry__0_n_7\ : STD_LOGIC;
  signal \Zero2_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \Zero2_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \Zero2_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \Zero2_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \Zero2_carry__1_n_0\ : STD_LOGIC;
  signal \Zero2_carry__1_n_1\ : STD_LOGIC;
  signal \Zero2_carry__1_n_2\ : STD_LOGIC;
  signal \Zero2_carry__1_n_3\ : STD_LOGIC;
  signal \Zero2_carry__1_n_4\ : STD_LOGIC;
  signal \Zero2_carry__1_n_5\ : STD_LOGIC;
  signal \Zero2_carry__1_n_6\ : STD_LOGIC;
  signal \Zero2_carry__1_n_7\ : STD_LOGIC;
  signal \Zero2_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \Zero2_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \Zero2_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \Zero2_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \Zero2_carry__2_n_0\ : STD_LOGIC;
  signal \Zero2_carry__2_n_1\ : STD_LOGIC;
  signal \Zero2_carry__2_n_2\ : STD_LOGIC;
  signal \Zero2_carry__2_n_3\ : STD_LOGIC;
  signal \Zero2_carry__2_n_4\ : STD_LOGIC;
  signal \Zero2_carry__2_n_5\ : STD_LOGIC;
  signal \Zero2_carry__2_n_6\ : STD_LOGIC;
  signal \Zero2_carry__2_n_7\ : STD_LOGIC;
  signal \Zero2_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \Zero2_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \Zero2_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \Zero2_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \Zero2_carry__3_n_0\ : STD_LOGIC;
  signal \Zero2_carry__3_n_1\ : STD_LOGIC;
  signal \Zero2_carry__3_n_2\ : STD_LOGIC;
  signal \Zero2_carry__3_n_3\ : STD_LOGIC;
  signal \Zero2_carry__3_n_4\ : STD_LOGIC;
  signal \Zero2_carry__3_n_5\ : STD_LOGIC;
  signal \Zero2_carry__3_n_6\ : STD_LOGIC;
  signal \Zero2_carry__3_n_7\ : STD_LOGIC;
  signal \Zero2_carry__4_i_1_n_0\ : STD_LOGIC;
  signal \Zero2_carry__4_i_2_n_0\ : STD_LOGIC;
  signal \Zero2_carry__4_i_3_n_0\ : STD_LOGIC;
  signal \Zero2_carry__4_i_4_n_0\ : STD_LOGIC;
  signal \Zero2_carry__4_n_0\ : STD_LOGIC;
  signal \Zero2_carry__4_n_1\ : STD_LOGIC;
  signal \Zero2_carry__4_n_2\ : STD_LOGIC;
  signal \Zero2_carry__4_n_3\ : STD_LOGIC;
  signal \Zero2_carry__4_n_4\ : STD_LOGIC;
  signal \Zero2_carry__4_n_5\ : STD_LOGIC;
  signal \Zero2_carry__4_n_6\ : STD_LOGIC;
  signal \Zero2_carry__4_n_7\ : STD_LOGIC;
  signal \Zero2_carry__5_i_1_n_0\ : STD_LOGIC;
  signal \Zero2_carry__5_i_2_n_0\ : STD_LOGIC;
  signal \Zero2_carry__5_i_3_n_0\ : STD_LOGIC;
  signal \Zero2_carry__5_i_4_n_0\ : STD_LOGIC;
  signal \Zero2_carry__5_n_0\ : STD_LOGIC;
  signal \Zero2_carry__5_n_1\ : STD_LOGIC;
  signal \Zero2_carry__5_n_2\ : STD_LOGIC;
  signal \Zero2_carry__5_n_3\ : STD_LOGIC;
  signal \Zero2_carry__5_n_4\ : STD_LOGIC;
  signal \Zero2_carry__5_n_5\ : STD_LOGIC;
  signal \Zero2_carry__5_n_6\ : STD_LOGIC;
  signal \Zero2_carry__5_n_7\ : STD_LOGIC;
  signal \Zero2_carry__6_i_1_n_0\ : STD_LOGIC;
  signal \Zero2_carry__6_i_2_n_0\ : STD_LOGIC;
  signal \Zero2_carry__6_i_3_n_0\ : STD_LOGIC;
  signal \Zero2_carry__6_i_4_n_0\ : STD_LOGIC;
  signal \Zero2_carry__6_n_1\ : STD_LOGIC;
  signal \Zero2_carry__6_n_2\ : STD_LOGIC;
  signal \Zero2_carry__6_n_3\ : STD_LOGIC;
  signal \Zero2_carry__6_n_5\ : STD_LOGIC;
  signal \Zero2_carry__6_n_6\ : STD_LOGIC;
  signal \Zero2_carry__6_n_7\ : STD_LOGIC;
  signal Zero2_carry_i_1_n_0 : STD_LOGIC;
  signal Zero2_carry_i_2_n_0 : STD_LOGIC;
  signal Zero2_carry_i_3_n_0 : STD_LOGIC;
  signal Zero2_carry_i_4_n_0 : STD_LOGIC;
  signal Zero2_carry_n_0 : STD_LOGIC;
  signal Zero2_carry_n_1 : STD_LOGIC;
  signal Zero2_carry_n_2 : STD_LOGIC;
  signal Zero2_carry_n_3 : STD_LOGIC;
  signal Zero2_carry_n_4 : STD_LOGIC;
  signal Zero2_carry_n_5 : STD_LOGIC;
  signal Zero2_carry_n_6 : STD_LOGIC;
  signal Zero2_carry_n_7 : STD_LOGIC;
  signal \Zero4__15\ : STD_LOGIC;
  signal \Zero4_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \Zero4_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \Zero4_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \Zero4_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \Zero4_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \Zero4_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \Zero4_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \Zero4_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \Zero4_carry__0_n_0\ : STD_LOGIC;
  signal \Zero4_carry__0_n_1\ : STD_LOGIC;
  signal \Zero4_carry__0_n_2\ : STD_LOGIC;
  signal \Zero4_carry__0_n_3\ : STD_LOGIC;
  signal \Zero4_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \Zero4_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \Zero4_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \Zero4_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \Zero4_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \Zero4_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \Zero4_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \Zero4_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \Zero4_carry__1_n_0\ : STD_LOGIC;
  signal \Zero4_carry__1_n_1\ : STD_LOGIC;
  signal \Zero4_carry__1_n_2\ : STD_LOGIC;
  signal \Zero4_carry__1_n_3\ : STD_LOGIC;
  signal \Zero4_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \Zero4_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \Zero4_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \Zero4_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \Zero4_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \Zero4_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \Zero4_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \Zero4_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \Zero4_carry__2_n_1\ : STD_LOGIC;
  signal \Zero4_carry__2_n_2\ : STD_LOGIC;
  signal \Zero4_carry__2_n_3\ : STD_LOGIC;
  signal Zero4_carry_i_1_n_0 : STD_LOGIC;
  signal Zero4_carry_i_2_n_0 : STD_LOGIC;
  signal Zero4_carry_i_3_n_0 : STD_LOGIC;
  signal Zero4_carry_i_4_n_0 : STD_LOGIC;
  signal Zero4_carry_i_5_n_0 : STD_LOGIC;
  signal Zero4_carry_i_6_n_0 : STD_LOGIC;
  signal Zero4_carry_i_7_n_0 : STD_LOGIC;
  signal Zero4_carry_i_8_n_0 : STD_LOGIC;
  signal Zero4_carry_n_0 : STD_LOGIC;
  signal Zero4_carry_n_1 : STD_LOGIC;
  signal Zero4_carry_n_2 : STD_LOGIC;
  signal Zero4_carry_n_3 : STD_LOGIC;
  signal Zero_INST_0_i_19_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_1_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_20_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_21_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_2_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_4_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_73_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_74_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_75_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_76_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_77_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_78_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_9_n_0 : STD_LOGIC;
  signal data1 : STD_LOGIC;
  signal \NLW_Zero2_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_Zero4_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_Zero4_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_Zero4_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_Zero4_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  \A_0__s_net_1\ <= \A_0__s_port_\;
  \A_10__s_net_1\ <= \A_10__s_port_\;
  \A_14__s_net_1\ <= \A_14__s_port_\;
  \A_16__s_net_1\ <= \A_16__s_port_\;
  \A_18__s_net_1\ <= \A_18__s_port_\;
  \A_24__s_net_1\ <= \A_24__s_port_\;
  \A_26__s_net_1\ <= \A_26__s_port_\;
  \A_2__s_net_1\ <= \A_2__s_port_\;
  \A_4__s_net_1\ <= \A_4__s_port_\;
  \A_8__s_net_1\ <= \A_8__s_port_\;
  \B_12__s_net_1\ <= \B_12__s_port_\;
  \B_13__s_net_1\ <= \B_13__s_port_\;
  \B_14__s_net_1\ <= \B_14__s_port_\;
  \B_15__s_net_1\ <= \B_15__s_port_\;
  \B_22__s_net_1\ <= \B_22__s_port_\;
  \B_23__s_net_1\ <= \B_23__s_port_\;
  \B_4__s_net_1\ <= \B_4__s_port_\;
  \B_5__s_net_1\ <= \B_5__s_port_\;
  \B_6__s_net_1\ <= \B_6__s_port_\;
  \B_7__s_net_1\ <= \B_7__s_port_\;
\Result[0]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \Result[0]_INST_0_i_1_n_0\,
      I1 => \Result[0]_INST_0_i_2_n_0\,
      O => Result(0),
      S => AluOp(2)
    );
\Result[0]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A_14__s_net_1\,
      I1 => AluOp(1),
      I2 => Zero2_carry_n_7,
      I3 => AluOp(0),
      I4 => \B[0]\(0),
      O => \Result[0]_INST_0_i_1_n_0\
    );
\Result[0]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"30BBFC88FC883088"
    )
        port map (
      I0 => Zero_INST_0_i_9_n_0,
      I1 => AluOp(1),
      I2 => \Zero4__15\,
      I3 => AluOp(0),
      I4 => A(0),
      I5 => B(0),
      O => \Result[0]_INST_0_i_2_n_0\
    );
\Result[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(10),
      I2 => A(10),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[10]_INST_0_i_1_n_0\,
      O => Result(10)
    );
\Result[10]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_9\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__1_n_5\,
      I3 => AluOp(0),
      I4 => \B[0]_1\(2),
      O => \Result[10]_INST_0_i_1_n_0\
    );
\Result[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(11),
      I2 => A(11),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[11]_INST_0_i_1_n_0\,
      O => Result(11)
    );
\Result[11]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_10\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__1_n_4\,
      I3 => AluOp(0),
      I4 => \B[0]_1\(3),
      O => \Result[11]_INST_0_i_1_n_0\
    );
\Result[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(12),
      I2 => A(12),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[12]_INST_0_i_1_n_0\,
      O => Result(12)
    );
\Result[12]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_12__s_net_1\,
      I1 => \A[14]_11\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__2_n_7\,
      I4 => AluOp(0),
      I5 => \B[0]_2\(0),
      O => \Result[12]_INST_0_i_1_n_0\
    );
\Result[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(13),
      I2 => A(13),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[13]_INST_0_i_1_n_0\,
      O => Result(13)
    );
\Result[13]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_13__s_net_1\,
      I1 => \A[14]_12\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__2_n_6\,
      I4 => AluOp(0),
      I5 => \B[0]_2\(1),
      O => \Result[13]_INST_0_i_1_n_0\
    );
\Result[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(14),
      I2 => A(14),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[14]_INST_0_i_1_n_0\,
      O => Result(14)
    );
\Result[14]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_14__s_net_1\,
      I1 => \A[14]_13\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__2_n_5\,
      I4 => AluOp(0),
      I5 => \B[0]_2\(2),
      O => \Result[14]_INST_0_i_1_n_0\
    );
\Result[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(15),
      I2 => A(15),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[15]_INST_0_i_1_n_0\,
      O => Result(15)
    );
\Result[15]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_15__s_net_1\,
      I1 => \A[14]_14\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__2_n_4\,
      I4 => AluOp(0),
      I5 => \B[0]_2\(3),
      O => \Result[15]_INST_0_i_1_n_0\
    );
\Result[16]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(16),
      I2 => A(16),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[16]_INST_0_i_1_n_0\,
      O => Result(16)
    );
\Result[16]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_15\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__3_n_7\,
      I3 => AluOp(0),
      I4 => \B[0]_3\(0),
      O => \Result[16]_INST_0_i_1_n_0\
    );
\Result[17]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(17),
      I2 => A(17),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[17]_INST_0_i_1_n_0\,
      O => Result(17)
    );
\Result[17]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_16\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__3_n_6\,
      I3 => AluOp(0),
      I4 => \B[0]_3\(1),
      O => \Result[17]_INST_0_i_1_n_0\
    );
\Result[18]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(18),
      I2 => A(18),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[18]_INST_0_i_1_n_0\,
      O => Result(18)
    );
\Result[18]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_17\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__3_n_5\,
      I3 => AluOp(0),
      I4 => \B[0]_3\(2),
      O => \Result[18]_INST_0_i_1_n_0\
    );
\Result[19]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(19),
      I2 => A(19),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[19]_INST_0_i_1_n_0\,
      O => Result(19)
    );
\Result[19]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_18\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__3_n_4\,
      I3 => AluOp(0),
      I4 => \B[0]_3\(3),
      O => \Result[19]_INST_0_i_1_n_0\
    );
\Result[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(1),
      I2 => A(1),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[1]_INST_0_i_1_n_0\,
      O => Result(1)
    );
\Result[1]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_0\,
      I1 => AluOp(1),
      I2 => Zero2_carry_n_6,
      I3 => AluOp(0),
      I4 => \B[0]\(1),
      O => \Result[1]_INST_0_i_1_n_0\
    );
\Result[20]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(20),
      I2 => A(20),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[20]_INST_0_i_1_n_0\,
      O => Result(20)
    );
\Result[20]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_19\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__4_n_7\,
      I3 => AluOp(0),
      I4 => \B[0]_4\(0),
      O => \Result[20]_INST_0_i_1_n_0\
    );
\Result[21]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(21),
      I2 => A(21),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[21]_INST_0_i_1_n_0\,
      O => Result(21)
    );
\Result[21]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_20\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__4_n_6\,
      I3 => AluOp(0),
      I4 => \B[0]_4\(1),
      O => \Result[21]_INST_0_i_1_n_0\
    );
\Result[22]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(22),
      I2 => A(22),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[22]_INST_0_i_1_n_0\,
      O => Result(22)
    );
\Result[22]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_22__s_net_1\,
      I1 => \A[14]_21\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__4_n_5\,
      I4 => AluOp(0),
      I5 => \B[0]_4\(2),
      O => \Result[22]_INST_0_i_1_n_0\
    );
\Result[23]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(23),
      I2 => A(23),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[23]_INST_0_i_1_n_0\,
      O => Result(23)
    );
\Result[23]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_23__s_net_1\,
      I1 => \A[14]_22\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__4_n_4\,
      I4 => AluOp(0),
      I5 => \B[0]_4\(3),
      O => \Result[23]_INST_0_i_1_n_0\
    );
\Result[24]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(24),
      I2 => A(24),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[24]_INST_0_i_1_n_0\,
      O => Result(24)
    );
\Result[24]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_23\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__5_n_7\,
      I3 => AluOp(0),
      I4 => \B[0]_5\(0),
      O => \Result[24]_INST_0_i_1_n_0\
    );
\Result[25]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(25),
      I2 => A(25),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[25]_INST_0_i_1_n_0\,
      O => Result(25)
    );
\Result[25]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_24\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__5_n_6\,
      I3 => AluOp(0),
      I4 => \B[0]_5\(1),
      O => \Result[25]_INST_0_i_1_n_0\
    );
\Result[26]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(26),
      I2 => A(26),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[26]_INST_0_i_1_n_0\,
      O => Result(26)
    );
\Result[26]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_25\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__5_n_5\,
      I3 => AluOp(0),
      I4 => \B[0]_5\(2),
      O => \Result[26]_INST_0_i_1_n_0\
    );
\Result[27]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(27),
      I2 => A(27),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[27]_INST_0_i_1_n_0\,
      O => Result(27)
    );
\Result[27]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_26\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__5_n_4\,
      I3 => AluOp(0),
      I4 => \B[0]_5\(3),
      O => \Result[27]_INST_0_i_1_n_0\
    );
\Result[28]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(28),
      I2 => A(28),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[28]_INST_0_i_1_n_0\,
      O => Result(28)
    );
\Result[28]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_27\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__6_n_7\,
      I3 => AluOp(0),
      I4 => O(0),
      O => \Result[28]_INST_0_i_1_n_0\
    );
\Result[29]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(29),
      I2 => A(29),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[29]_INST_0_i_1_n_0\,
      O => Result(29)
    );
\Result[29]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_28\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__6_n_6\,
      I3 => AluOp(0),
      I4 => O(1),
      O => \Result[29]_INST_0_i_1_n_0\
    );
\Result[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(2),
      I2 => A(2),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[2]_INST_0_i_1_n_0\,
      O => Result(2)
    );
\Result[2]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_1\,
      I1 => AluOp(1),
      I2 => Zero2_carry_n_5,
      I3 => AluOp(0),
      I4 => \B[0]\(2),
      O => \Result[2]_INST_0_i_1_n_0\
    );
\Result[30]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(30),
      I2 => A(30),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[30]_INST_0_i_1_n_0\,
      O => Result(30)
    );
\Result[30]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_29\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__6_n_5\,
      I3 => AluOp(0),
      I4 => O(2),
      O => \Result[30]_INST_0_i_1_n_0\
    );
\Result[31]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(31),
      I2 => A(31),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[31]_INST_0_i_1_n_0\,
      O => Result(31)
    );
\Result[31]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => p_4_in,
      I1 => data2,
      I2 => AluOp(1),
      I3 => data1,
      I4 => AluOp(0),
      I5 => O(3),
      O => \Result[31]_INST_0_i_1_n_0\
    );
\Result[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(3),
      I2 => A(3),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[3]_INST_0_i_1_n_0\,
      O => Result(3)
    );
\Result[3]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_2\,
      I1 => AluOp(1),
      I2 => Zero2_carry_n_4,
      I3 => AluOp(0),
      I4 => \B[0]\(3),
      O => \Result[3]_INST_0_i_1_n_0\
    );
\Result[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(4),
      I2 => A(4),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[4]_INST_0_i_1_n_0\,
      O => Result(4)
    );
\Result[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_4__s_net_1\,
      I1 => \A[14]_3\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__0_n_7\,
      I4 => AluOp(0),
      I5 => \B[0]_0\(0),
      O => \Result[4]_INST_0_i_1_n_0\
    );
\Result[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(5),
      I2 => A(5),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[5]_INST_0_i_1_n_0\,
      O => Result(5)
    );
\Result[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_5__s_net_1\,
      I1 => \A[14]_4\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__0_n_6\,
      I4 => AluOp(0),
      I5 => \B[0]_0\(1),
      O => \Result[5]_INST_0_i_1_n_0\
    );
\Result[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(6),
      I2 => A(6),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[6]_INST_0_i_1_n_0\,
      O => Result(6)
    );
\Result[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_6__s_net_1\,
      I1 => \A[14]_5\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__0_n_5\,
      I4 => AluOp(0),
      I5 => \B[0]_0\(2),
      O => \Result[6]_INST_0_i_1_n_0\
    );
\Result[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(7),
      I2 => A(7),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[7]_INST_0_i_1_n_0\,
      O => Result(7)
    );
\Result[7]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \B_7__s_net_1\,
      I1 => \A[14]_6\,
      I2 => AluOp(1),
      I3 => \Zero2_carry__0_n_4\,
      I4 => AluOp(0),
      I5 => \B[0]_0\(3),
      O => \Result[7]_INST_0_i_1_n_0\
    );
\Result[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(8),
      I2 => A(8),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[8]_INST_0_i_1_n_0\,
      O => Result(8)
    );
\Result[8]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_7\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__1_n_7\,
      I3 => AluOp(0),
      I4 => \B[0]_1\(0),
      O => \Result[8]_INST_0_i_1_n_0\
    );
\Result[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2840FFFF28400000"
    )
        port map (
      I0 => AluOp(1),
      I1 => B(9),
      I2 => A(9),
      I3 => AluOp(0),
      I4 => AluOp(2),
      I5 => \Result[9]_INST_0_i_1_n_0\,
      O => Result(9)
    );
\Result[9]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \A[14]_8\,
      I1 => AluOp(1),
      I2 => \Zero2_carry__1_n_6\,
      I3 => AluOp(0),
      I4 => \B[0]_1\(1),
      O => \Result[9]_INST_0_i_1_n_0\
    );
Zero2_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => Zero2_carry_n_0,
      CO(2) => Zero2_carry_n_1,
      CO(1) => Zero2_carry_n_2,
      CO(0) => Zero2_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => A(3 downto 0),
      O(3) => Zero2_carry_n_4,
      O(2) => Zero2_carry_n_5,
      O(1) => Zero2_carry_n_6,
      O(0) => Zero2_carry_n_7,
      S(3) => Zero2_carry_i_1_n_0,
      S(2) => Zero2_carry_i_2_n_0,
      S(1) => Zero2_carry_i_3_n_0,
      S(0) => Zero2_carry_i_4_n_0
    );
\Zero2_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => Zero2_carry_n_0,
      CO(3) => \Zero2_carry__0_n_0\,
      CO(2) => \Zero2_carry__0_n_1\,
      CO(1) => \Zero2_carry__0_n_2\,
      CO(0) => \Zero2_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(7 downto 4),
      O(3) => \Zero2_carry__0_n_4\,
      O(2) => \Zero2_carry__0_n_5\,
      O(1) => \Zero2_carry__0_n_6\,
      O(0) => \Zero2_carry__0_n_7\,
      S(3) => \Zero2_carry__0_i_1_n_0\,
      S(2) => \Zero2_carry__0_i_2_n_0\,
      S(1) => \Zero2_carry__0_i_3_n_0\,
      S(0) => \Zero2_carry__0_i_4_n_0\
    );
\Zero2_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(7),
      I1 => A(7),
      O => \Zero2_carry__0_i_1_n_0\
    );
\Zero2_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(6),
      I1 => A(6),
      O => \Zero2_carry__0_i_2_n_0\
    );
\Zero2_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(5),
      I1 => A(5),
      O => \Zero2_carry__0_i_3_n_0\
    );
\Zero2_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(4),
      I1 => A(4),
      O => \Zero2_carry__0_i_4_n_0\
    );
\Zero2_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \Zero2_carry__0_n_0\,
      CO(3) => \Zero2_carry__1_n_0\,
      CO(2) => \Zero2_carry__1_n_1\,
      CO(1) => \Zero2_carry__1_n_2\,
      CO(0) => \Zero2_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(11 downto 8),
      O(3) => \Zero2_carry__1_n_4\,
      O(2) => \Zero2_carry__1_n_5\,
      O(1) => \Zero2_carry__1_n_6\,
      O(0) => \Zero2_carry__1_n_7\,
      S(3) => \Zero2_carry__1_i_1_n_0\,
      S(2) => \Zero2_carry__1_i_2_n_0\,
      S(1) => \Zero2_carry__1_i_3_n_0\,
      S(0) => \Zero2_carry__1_i_4_n_0\
    );
\Zero2_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(11),
      I1 => A(11),
      O => \Zero2_carry__1_i_1_n_0\
    );
\Zero2_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(10),
      I1 => A(10),
      O => \Zero2_carry__1_i_2_n_0\
    );
\Zero2_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(9),
      I1 => A(9),
      O => \Zero2_carry__1_i_3_n_0\
    );
\Zero2_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(8),
      I1 => A(8),
      O => \Zero2_carry__1_i_4_n_0\
    );
\Zero2_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \Zero2_carry__1_n_0\,
      CO(3) => \Zero2_carry__2_n_0\,
      CO(2) => \Zero2_carry__2_n_1\,
      CO(1) => \Zero2_carry__2_n_2\,
      CO(0) => \Zero2_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(15 downto 12),
      O(3) => \Zero2_carry__2_n_4\,
      O(2) => \Zero2_carry__2_n_5\,
      O(1) => \Zero2_carry__2_n_6\,
      O(0) => \Zero2_carry__2_n_7\,
      S(3) => \Zero2_carry__2_i_1_n_0\,
      S(2) => \Zero2_carry__2_i_2_n_0\,
      S(1) => \Zero2_carry__2_i_3_n_0\,
      S(0) => \Zero2_carry__2_i_4_n_0\
    );
\Zero2_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(15),
      I1 => A(15),
      O => \Zero2_carry__2_i_1_n_0\
    );
\Zero2_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(14),
      I1 => A(14),
      O => \Zero2_carry__2_i_2_n_0\
    );
\Zero2_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(13),
      I1 => A(13),
      O => \Zero2_carry__2_i_3_n_0\
    );
\Zero2_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(12),
      I1 => A(12),
      O => \Zero2_carry__2_i_4_n_0\
    );
\Zero2_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \Zero2_carry__2_n_0\,
      CO(3) => \Zero2_carry__3_n_0\,
      CO(2) => \Zero2_carry__3_n_1\,
      CO(1) => \Zero2_carry__3_n_2\,
      CO(0) => \Zero2_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(19 downto 16),
      O(3) => \Zero2_carry__3_n_4\,
      O(2) => \Zero2_carry__3_n_5\,
      O(1) => \Zero2_carry__3_n_6\,
      O(0) => \Zero2_carry__3_n_7\,
      S(3) => \Zero2_carry__3_i_1_n_0\,
      S(2) => \Zero2_carry__3_i_2_n_0\,
      S(1) => \Zero2_carry__3_i_3_n_0\,
      S(0) => \Zero2_carry__3_i_4_n_0\
    );
\Zero2_carry__3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(19),
      I1 => A(19),
      O => \Zero2_carry__3_i_1_n_0\
    );
\Zero2_carry__3_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(18),
      I1 => A(18),
      O => \Zero2_carry__3_i_2_n_0\
    );
\Zero2_carry__3_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(17),
      I1 => A(17),
      O => \Zero2_carry__3_i_3_n_0\
    );
\Zero2_carry__3_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(16),
      I1 => A(16),
      O => \Zero2_carry__3_i_4_n_0\
    );
\Zero2_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \Zero2_carry__3_n_0\,
      CO(3) => \Zero2_carry__4_n_0\,
      CO(2) => \Zero2_carry__4_n_1\,
      CO(1) => \Zero2_carry__4_n_2\,
      CO(0) => \Zero2_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(23 downto 20),
      O(3) => \Zero2_carry__4_n_4\,
      O(2) => \Zero2_carry__4_n_5\,
      O(1) => \Zero2_carry__4_n_6\,
      O(0) => \Zero2_carry__4_n_7\,
      S(3) => \Zero2_carry__4_i_1_n_0\,
      S(2) => \Zero2_carry__4_i_2_n_0\,
      S(1) => \Zero2_carry__4_i_3_n_0\,
      S(0) => \Zero2_carry__4_i_4_n_0\
    );
\Zero2_carry__4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(23),
      I1 => A(23),
      O => \Zero2_carry__4_i_1_n_0\
    );
\Zero2_carry__4_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(22),
      I1 => A(22),
      O => \Zero2_carry__4_i_2_n_0\
    );
\Zero2_carry__4_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(21),
      I1 => A(21),
      O => \Zero2_carry__4_i_3_n_0\
    );
\Zero2_carry__4_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(20),
      I1 => A(20),
      O => \Zero2_carry__4_i_4_n_0\
    );
\Zero2_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \Zero2_carry__4_n_0\,
      CO(3) => \Zero2_carry__5_n_0\,
      CO(2) => \Zero2_carry__5_n_1\,
      CO(1) => \Zero2_carry__5_n_2\,
      CO(0) => \Zero2_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(27 downto 24),
      O(3) => \Zero2_carry__5_n_4\,
      O(2) => \Zero2_carry__5_n_5\,
      O(1) => \Zero2_carry__5_n_6\,
      O(0) => \Zero2_carry__5_n_7\,
      S(3) => \Zero2_carry__5_i_1_n_0\,
      S(2) => \Zero2_carry__5_i_2_n_0\,
      S(1) => \Zero2_carry__5_i_3_n_0\,
      S(0) => \Zero2_carry__5_i_4_n_0\
    );
\Zero2_carry__5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(27),
      I1 => A(27),
      O => \Zero2_carry__5_i_1_n_0\
    );
\Zero2_carry__5_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(26),
      I1 => A(26),
      O => \Zero2_carry__5_i_2_n_0\
    );
\Zero2_carry__5_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(25),
      I1 => A(25),
      O => \Zero2_carry__5_i_3_n_0\
    );
\Zero2_carry__5_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(24),
      I1 => A(24),
      O => \Zero2_carry__5_i_4_n_0\
    );
\Zero2_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \Zero2_carry__5_n_0\,
      CO(3) => \NLW_Zero2_carry__6_CO_UNCONNECTED\(3),
      CO(2) => \Zero2_carry__6_n_1\,
      CO(1) => \Zero2_carry__6_n_2\,
      CO(0) => \Zero2_carry__6_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => A(30 downto 28),
      O(3) => data1,
      O(2) => \Zero2_carry__6_n_5\,
      O(1) => \Zero2_carry__6_n_6\,
      O(0) => \Zero2_carry__6_n_7\,
      S(3) => \Zero2_carry__6_i_1_n_0\,
      S(2) => \Zero2_carry__6_i_2_n_0\,
      S(1) => \Zero2_carry__6_i_3_n_0\,
      S(0) => \Zero2_carry__6_i_4_n_0\
    );
\Zero2_carry__6_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(31),
      I1 => A(31),
      O => \Zero2_carry__6_i_1_n_0\
    );
\Zero2_carry__6_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(30),
      I1 => A(30),
      O => \Zero2_carry__6_i_2_n_0\
    );
\Zero2_carry__6_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(29),
      I1 => A(29),
      O => \Zero2_carry__6_i_3_n_0\
    );
\Zero2_carry__6_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(28),
      I1 => A(28),
      O => \Zero2_carry__6_i_4_n_0\
    );
Zero2_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(3),
      I1 => A(3),
      O => Zero2_carry_i_1_n_0
    );
Zero2_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(2),
      I1 => A(2),
      O => Zero2_carry_i_2_n_0
    );
Zero2_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(1),
      I1 => A(1),
      O => Zero2_carry_i_3_n_0
    );
Zero2_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(0),
      I1 => A(0),
      O => Zero2_carry_i_4_n_0
    );
Zero4_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => Zero4_carry_n_0,
      CO(2) => Zero4_carry_n_1,
      CO(1) => Zero4_carry_n_2,
      CO(0) => Zero4_carry_n_3,
      CYINIT => '0',
      DI(3) => Zero4_carry_i_1_n_0,
      DI(2) => Zero4_carry_i_2_n_0,
      DI(1) => Zero4_carry_i_3_n_0,
      DI(0) => Zero4_carry_i_4_n_0,
      O(3 downto 0) => NLW_Zero4_carry_O_UNCONNECTED(3 downto 0),
      S(3) => Zero4_carry_i_5_n_0,
      S(2) => Zero4_carry_i_6_n_0,
      S(1) => Zero4_carry_i_7_n_0,
      S(0) => Zero4_carry_i_8_n_0
    );
\Zero4_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => Zero4_carry_n_0,
      CO(3) => \Zero4_carry__0_n_0\,
      CO(2) => \Zero4_carry__0_n_1\,
      CO(1) => \Zero4_carry__0_n_2\,
      CO(0) => \Zero4_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \Zero4_carry__0_i_1_n_0\,
      DI(2) => \Zero4_carry__0_i_2_n_0\,
      DI(1) => \Zero4_carry__0_i_3_n_0\,
      DI(0) => \Zero4_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_Zero4_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \Zero4_carry__0_i_5_n_0\,
      S(2) => \Zero4_carry__0_i_6_n_0\,
      S(1) => \Zero4_carry__0_i_7_n_0\,
      S(0) => \Zero4_carry__0_i_8_n_0\
    );
\Zero4_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(14),
      I1 => A(14),
      I2 => A(15),
      I3 => B(15),
      O => \Zero4_carry__0_i_1_n_0\
    );
\Zero4_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(12),
      I1 => A(12),
      I2 => A(13),
      I3 => B(13),
      O => \Zero4_carry__0_i_2_n_0\
    );
\Zero4_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(10),
      I1 => A(10),
      I2 => A(11),
      I3 => B(11),
      O => \Zero4_carry__0_i_3_n_0\
    );
\Zero4_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(8),
      I1 => A(8),
      I2 => A(9),
      I3 => B(9),
      O => \Zero4_carry__0_i_4_n_0\
    );
\Zero4_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(14),
      I1 => B(14),
      I2 => A(15),
      I3 => B(15),
      O => \Zero4_carry__0_i_5_n_0\
    );
\Zero4_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(12),
      I1 => B(12),
      I2 => A(13),
      I3 => B(13),
      O => \Zero4_carry__0_i_6_n_0\
    );
\Zero4_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(10),
      I1 => B(10),
      I2 => A(11),
      I3 => B(11),
      O => \Zero4_carry__0_i_7_n_0\
    );
\Zero4_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(8),
      I1 => B(8),
      I2 => A(9),
      I3 => B(9),
      O => \Zero4_carry__0_i_8_n_0\
    );
\Zero4_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \Zero4_carry__0_n_0\,
      CO(3) => \Zero4_carry__1_n_0\,
      CO(2) => \Zero4_carry__1_n_1\,
      CO(1) => \Zero4_carry__1_n_2\,
      CO(0) => \Zero4_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \Zero4_carry__1_i_1_n_0\,
      DI(2) => \Zero4_carry__1_i_2_n_0\,
      DI(1) => \Zero4_carry__1_i_3_n_0\,
      DI(0) => \Zero4_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_Zero4_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \Zero4_carry__1_i_5_n_0\,
      S(2) => \Zero4_carry__1_i_6_n_0\,
      S(1) => \Zero4_carry__1_i_7_n_0\,
      S(0) => \Zero4_carry__1_i_8_n_0\
    );
\Zero4_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(22),
      I1 => A(22),
      I2 => A(23),
      I3 => B(23),
      O => \Zero4_carry__1_i_1_n_0\
    );
\Zero4_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(20),
      I1 => A(20),
      I2 => A(21),
      I3 => B(21),
      O => \Zero4_carry__1_i_2_n_0\
    );
\Zero4_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(18),
      I1 => A(18),
      I2 => A(19),
      I3 => B(19),
      O => \Zero4_carry__1_i_3_n_0\
    );
\Zero4_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(16),
      I1 => A(16),
      I2 => A(17),
      I3 => B(17),
      O => \Zero4_carry__1_i_4_n_0\
    );
\Zero4_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(22),
      I1 => B(22),
      I2 => A(23),
      I3 => B(23),
      O => \Zero4_carry__1_i_5_n_0\
    );
\Zero4_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(20),
      I1 => B(20),
      I2 => A(21),
      I3 => B(21),
      O => \Zero4_carry__1_i_6_n_0\
    );
\Zero4_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(18),
      I1 => B(18),
      I2 => A(19),
      I3 => B(19),
      O => \Zero4_carry__1_i_7_n_0\
    );
\Zero4_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(16),
      I1 => B(16),
      I2 => A(17),
      I3 => B(17),
      O => \Zero4_carry__1_i_8_n_0\
    );
\Zero4_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \Zero4_carry__1_n_0\,
      CO(3) => \Zero4__15\,
      CO(2) => \Zero4_carry__2_n_1\,
      CO(1) => \Zero4_carry__2_n_2\,
      CO(0) => \Zero4_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \Zero4_carry__2_i_1_n_0\,
      DI(2) => \Zero4_carry__2_i_2_n_0\,
      DI(1) => \Zero4_carry__2_i_3_n_0\,
      DI(0) => \Zero4_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_Zero4_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \Zero4_carry__2_i_5_n_0\,
      S(2) => \Zero4_carry__2_i_6_n_0\,
      S(1) => \Zero4_carry__2_i_7_n_0\,
      S(0) => \Zero4_carry__2_i_8_n_0\
    );
\Zero4_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(30),
      I1 => A(30),
      I2 => A(31),
      I3 => B(31),
      O => \Zero4_carry__2_i_1_n_0\
    );
\Zero4_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(28),
      I1 => A(28),
      I2 => A(29),
      I3 => B(29),
      O => \Zero4_carry__2_i_2_n_0\
    );
\Zero4_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(26),
      I1 => A(26),
      I2 => A(27),
      I3 => B(27),
      O => \Zero4_carry__2_i_3_n_0\
    );
\Zero4_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(24),
      I1 => A(24),
      I2 => A(25),
      I3 => B(25),
      O => \Zero4_carry__2_i_4_n_0\
    );
\Zero4_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(31),
      I1 => B(31),
      I2 => A(30),
      I3 => B(30),
      O => \Zero4_carry__2_i_5_n_0\
    );
\Zero4_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(28),
      I1 => B(28),
      I2 => A(29),
      I3 => B(29),
      O => \Zero4_carry__2_i_6_n_0\
    );
\Zero4_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(26),
      I1 => B(26),
      I2 => A(27),
      I3 => B(27),
      O => \Zero4_carry__2_i_7_n_0\
    );
\Zero4_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(24),
      I1 => B(24),
      I2 => A(25),
      I3 => B(25),
      O => \Zero4_carry__2_i_8_n_0\
    );
Zero4_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(6),
      I1 => A(6),
      I2 => A(7),
      I3 => B(7),
      O => Zero4_carry_i_1_n_0
    );
Zero4_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(4),
      I1 => A(4),
      I2 => A(5),
      I3 => B(5),
      O => Zero4_carry_i_2_n_0
    );
Zero4_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(2),
      I1 => A(2),
      I2 => A(3),
      I3 => B(3),
      O => Zero4_carry_i_3_n_0
    );
Zero4_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B(0),
      I1 => A(0),
      I2 => A(1),
      I3 => B(1),
      O => Zero4_carry_i_4_n_0
    );
Zero4_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(6),
      I1 => B(6),
      I2 => A(7),
      I3 => B(7),
      O => Zero4_carry_i_5_n_0
    );
Zero4_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(4),
      I1 => B(4),
      I2 => A(5),
      I3 => B(5),
      O => Zero4_carry_i_6_n_0
    );
Zero4_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(2),
      I1 => B(2),
      I2 => A(3),
      I3 => B(3),
      O => Zero4_carry_i_7_n_0
    );
Zero4_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(0),
      I1 => B(0),
      I2 => A(1),
      I3 => B(1),
      O => Zero4_carry_i_8_n_0
    );
Zero_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Zero_INST_0_i_1_n_0,
      I1 => Zero_INST_0_i_2_n_0,
      I2 => AluOp(2),
      I3 => \A_4__s_net_1\,
      I4 => AluOp(1),
      I5 => Zero_INST_0_i_4_n_0,
      O => Zero
    );
Zero_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000100000001FFFF"
    )
        port map (
      I0 => \A_18__s_net_1\,
      I1 => \A_26__s_net_1\,
      I2 => \A_2__s_net_1\,
      I3 => \A_10__s_net_1\,
      I4 => AluOp(0),
      I5 => Zero_INST_0_i_9_n_0,
      O => Zero_INST_0_i_1_n_0
    );
Zero_INST_0_i_19: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \Zero2_carry__4_n_6\,
      I1 => \Zero2_carry__4_n_7\,
      I2 => \Zero2_carry__4_n_4\,
      I3 => \Zero2_carry__4_n_5\,
      I4 => Zero_INST_0_i_73_n_0,
      O => Zero_INST_0_i_19_n_0
    );
Zero_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444444447"
    )
        port map (
      I0 => \Zero4__15\,
      I1 => AluOp(0),
      I2 => \A_16__s_net_1\,
      I3 => \A_24__s_net_1\,
      I4 => \A_0__s_net_1\,
      I5 => \A_8__s_net_1\,
      O => Zero_INST_0_i_2_n_0
    );
Zero_INST_0_i_20: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \Zero2_carry__6_n_6\,
      I1 => \Zero2_carry__6_n_7\,
      I2 => \Zero2_carry__6_n_5\,
      I3 => data1,
      I4 => Zero_INST_0_i_74_n_0,
      O => Zero_INST_0_i_20_n_0
    );
Zero_INST_0_i_21: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Zero_INST_0_i_75_n_0,
      I1 => Zero_INST_0_i_76_n_0,
      I2 => Zero_INST_0_i_77_n_0,
      I3 => Zero_INST_0_i_78_n_0,
      O => Zero_INST_0_i_21_n_0
    );
Zero_INST_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100010001FF0100"
    )
        port map (
      I0 => Zero_INST_0_i_19_n_0,
      I1 => Zero_INST_0_i_20_n_0,
      I2 => Zero_INST_0_i_21_n_0,
      I3 => AluOp(0),
      I4 => \B[0]_6\,
      I5 => \B[12]_0\,
      O => Zero_INST_0_i_4_n_0
    );
Zero_INST_0_i_73: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Zero2_carry__3_n_5\,
      I1 => \Zero2_carry__3_n_4\,
      I2 => \Zero2_carry__3_n_7\,
      I3 => \Zero2_carry__3_n_6\,
      O => Zero_INST_0_i_73_n_0
    );
Zero_INST_0_i_74: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Zero2_carry__5_n_5\,
      I1 => \Zero2_carry__5_n_4\,
      I2 => \Zero2_carry__5_n_7\,
      I3 => \Zero2_carry__5_n_6\,
      O => Zero_INST_0_i_74_n_0
    );
Zero_INST_0_i_75: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Zero2_carry__1_n_5\,
      I1 => \Zero2_carry__1_n_4\,
      I2 => \Zero2_carry__1_n_7\,
      I3 => \Zero2_carry__1_n_6\,
      O => Zero_INST_0_i_75_n_0
    );
Zero_INST_0_i_76: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Zero2_carry__2_n_5\,
      I1 => \Zero2_carry__2_n_4\,
      I2 => \Zero2_carry__2_n_7\,
      I3 => \Zero2_carry__2_n_6\,
      O => Zero_INST_0_i_76_n_0
    );
Zero_INST_0_i_77: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Zero2_carry_n_5,
      I1 => Zero2_carry_n_4,
      I2 => Zero2_carry_n_7,
      I3 => Zero2_carry_n_6,
      O => Zero_INST_0_i_77_n_0
    );
Zero_INST_0_i_78: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Zero2_carry__0_n_5\,
      I1 => \Zero2_carry__0_n_4\,
      I2 => \Zero2_carry__0_n_7\,
      I3 => \Zero2_carry__0_n_6\,
      O => Zero_INST_0_i_78_n_0
    );
Zero_INST_0_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \Zero4__15\,
      I1 => B(31),
      I2 => A(31),
      O => Zero_INST_0_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AluOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Zero : out STD_LOGIC;
    Sign : out STD_LOGIC;
    Result : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_ALU_0_0,ALU,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ALU,Vivado 2016.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \^result\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \Result[0]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[10]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[10]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[10]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_3_n_1\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_3_n_2\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_3_n_3\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_3_n_4\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_3_n_5\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_3_n_7\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \Result[11]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \Result[12]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[12]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[12]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[12]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[13]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[13]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[13]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[13]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[14]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[14]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[14]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[14]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_4_n_1\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_4_n_2\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_4_n_3\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_4_n_4\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_4_n_5\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_4_n_6\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_4_n_7\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \Result[15]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \Result[16]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[16]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[16]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[16]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[17]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[17]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[17]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[17]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[18]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[18]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[18]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[18]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_3_n_1\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_3_n_2\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_3_n_3\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_3_n_4\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_3_n_5\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_3_n_7\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \Result[19]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \Result[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[20]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[20]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[20]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[20]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[21]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[21]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[21]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[21]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[22]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[22]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[22]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[22]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_4_n_1\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_4_n_2\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_4_n_3\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_4_n_4\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_4_n_5\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_4_n_6\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_4_n_7\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \Result[23]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \Result[24]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[24]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[24]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[24]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[25]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[25]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[25]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[25]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[26]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[26]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[26]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[26]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_3_n_1\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_3_n_2\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_3_n_3\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_3_n_4\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_3_n_5\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_3_n_7\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \Result[27]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \Result[28]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[28]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[28]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[28]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[29]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[29]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[29]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[29]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[2]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[2]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[30]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[30]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[30]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[30]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_13_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_14_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_15_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_16_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_17_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_18_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_19_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_20_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_21_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_22_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_23_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_24_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_25_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_4_n_1\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_4_n_2\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_4_n_3\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_4_n_5\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_4_n_6\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_4_n_7\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \Result[31]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_3_n_1\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_3_n_2\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_3_n_3\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_3_n_4\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_3_n_5\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_3_n_7\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \Result[3]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \Result[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[4]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[4]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[5]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[5]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[6]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[6]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_4_n_1\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_4_n_2\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_4_n_3\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_4_n_4\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_4_n_5\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_4_n_6\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_4_n_7\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \Result[7]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \Result[8]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[8]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[8]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \Result[9]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Result[9]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \Result[9]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \^sign\ : STD_LOGIC;
  signal Zero_INST_0_i_100_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_101_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_102_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_103_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_104_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_105_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_106_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_107_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_108_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_109_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_10_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_110_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_111_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_112_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_113_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_114_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_115_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_116_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_11_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_12_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_13_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_14_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_15_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_16_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_17_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_18_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_22_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_23_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_24_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_25_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_26_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_27_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_28_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_29_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_30_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_31_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_32_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_33_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_34_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_35_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_36_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_37_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_38_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_39_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_3_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_40_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_41_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_42_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_43_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_44_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_45_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_46_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_47_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_48_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_49_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_50_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_51_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_52_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_53_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_54_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_55_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_56_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_57_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_58_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_59_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_5_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_60_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_61_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_62_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_63_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_64_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_65_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_66_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_67_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_68_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_69_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_6_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_70_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_71_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_72_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_79_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_7_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_80_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_81_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_82_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_83_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_84_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_85_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_86_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_87_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_88_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_89_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_8_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_90_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_91_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_92_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_93_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_94_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_95_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_96_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_97_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_98_n_0 : STD_LOGIC;
  signal Zero_INST_0_i_99_n_0 : STD_LOGIC;
  signal data0 : STD_LOGIC;
  signal data2 : STD_LOGIC;
  signal p_4_in : STD_LOGIC;
  signal \NLW_Result[31]_INST_0_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Result[10]_INST_0_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \Result[10]_INST_0_i_4\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \Result[11]_INST_0_i_5\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \Result[12]_INST_0_i_3\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \Result[12]_INST_0_i_4\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \Result[13]_INST_0_i_2\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \Result[13]_INST_0_i_3\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \Result[14]_INST_0_i_3\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \Result[15]_INST_0_i_10\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \Result[15]_INST_0_i_2\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \Result[15]_INST_0_i_3\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \Result[16]_INST_0_i_5\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \Result[17]_INST_0_i_3\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \Result[17]_INST_0_i_5\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \Result[18]_INST_0_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \Result[18]_INST_0_i_5\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \Result[19]_INST_0_i_10\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \Result[1]_INST_0_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \Result[20]_INST_0_i_5\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \Result[21]_INST_0_i_3\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \Result[21]_INST_0_i_5\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \Result[22]_INST_0_i_3\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \Result[22]_INST_0_i_5\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \Result[23]_INST_0_i_10\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \Result[23]_INST_0_i_2\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \Result[23]_INST_0_i_3\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \Result[24]_INST_0_i_5\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \Result[25]_INST_0_i_3\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \Result[25]_INST_0_i_5\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \Result[26]_INST_0_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \Result[26]_INST_0_i_5\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \Result[27]_INST_0_i_10\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \Result[28]_INST_0_i_5\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \Result[29]_INST_0_i_3\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \Result[29]_INST_0_i_5\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \Result[2]_INST_0_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \Result[2]_INST_0_i_4\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \Result[30]_INST_0_i_5\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \Result[31]_INST_0_i_14\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \Result[31]_INST_0_i_15\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \Result[31]_INST_0_i_16\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \Result[31]_INST_0_i_17\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \Result[31]_INST_0_i_2\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \Result[31]_INST_0_i_5\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \Result[31]_INST_0_i_6\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \Result[3]_INST_0_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Result[4]_INST_0_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \Result[4]_INST_0_i_3\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \Result[5]_INST_0_i_2\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \Result[5]_INST_0_i_3\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \Result[7]_INST_0_i_2\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \Result[7]_INST_0_i_5\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \Result[7]_INST_0_i_6\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \Result[9]_INST_0_i_3\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \Result[9]_INST_0_i_4\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of Zero_INST_0_i_100 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of Zero_INST_0_i_102 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of Zero_INST_0_i_103 : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of Zero_INST_0_i_104 : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of Zero_INST_0_i_111 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of Zero_INST_0_i_112 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of Zero_INST_0_i_114 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of Zero_INST_0_i_115 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of Zero_INST_0_i_116 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of Zero_INST_0_i_24 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of Zero_INST_0_i_26 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of Zero_INST_0_i_27 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of Zero_INST_0_i_28 : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of Zero_INST_0_i_29 : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of Zero_INST_0_i_30 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of Zero_INST_0_i_31 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of Zero_INST_0_i_32 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of Zero_INST_0_i_34 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of Zero_INST_0_i_35 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of Zero_INST_0_i_36 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of Zero_INST_0_i_38 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of Zero_INST_0_i_39 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of Zero_INST_0_i_40 : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of Zero_INST_0_i_41 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of Zero_INST_0_i_42 : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of Zero_INST_0_i_43 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of Zero_INST_0_i_44 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of Zero_INST_0_i_46 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of Zero_INST_0_i_47 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of Zero_INST_0_i_53 : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of Zero_INST_0_i_54 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of Zero_INST_0_i_63 : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of Zero_INST_0_i_64 : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of Zero_INST_0_i_68 : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of Zero_INST_0_i_69 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of Zero_INST_0_i_70 : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of Zero_INST_0_i_71 : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of Zero_INST_0_i_87 : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of Zero_INST_0_i_88 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of Zero_INST_0_i_89 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of Zero_INST_0_i_90 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of Zero_INST_0_i_91 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of Zero_INST_0_i_92 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of Zero_INST_0_i_93 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of Zero_INST_0_i_94 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of Zero_INST_0_i_95 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of Zero_INST_0_i_96 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of Zero_INST_0_i_97 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of Zero_INST_0_i_98 : label is "soft_lutpair13";
begin
  Result(31) <= \^sign\;
  Result(30 downto 0) <= \^result\(30 downto 0);
  Sign <= \^sign\;
\Result[0]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCB8CC88"
    )
        port map (
      I0 => B(0),
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => A(0),
      I4 => \Result[1]_INST_0_i_4_n_0\,
      O => \Result[0]_INST_0_i_3_n_0\
    );
\Result[10]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[10]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[11]_INST_0_i_5_n_0\,
      I4 => A(0),
      I5 => \Result[10]_INST_0_i_4_n_0\,
      O => \Result[10]_INST_0_i_2_n_0\
    );
\Result[10]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(10),
      I1 => B(10),
      O => \Result[10]_INST_0_i_3_n_0\
    );
\Result[10]_INST_0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Zero_INST_0_i_102_n_0,
      I1 => A(1),
      I2 => \Result[12]_INST_0_i_5_n_0\,
      O => \Result[10]_INST_0_i_4_n_0\
    );
\Result[11]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000030BB3088"
    )
        port map (
      I0 => B(4),
      I1 => A(2),
      I2 => B(0),
      I3 => A(3),
      I4 => B(8),
      I5 => A(4),
      O => \Result[11]_INST_0_i_10_n_0\
    );
\Result[11]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[11]_INST_0_i_4_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[12]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[11]_INST_0_i_5_n_0\,
      O => \Result[11]_INST_0_i_2_n_0\
    );
\Result[11]_INST_0_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \Result[7]_INST_0_i_4_n_0\,
      CO(3) => \Result[11]_INST_0_i_3_n_0\,
      CO(2) => \Result[11]_INST_0_i_3_n_1\,
      CO(1) => \Result[11]_INST_0_i_3_n_2\,
      CO(0) => \Result[11]_INST_0_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(11 downto 8),
      O(3) => \Result[11]_INST_0_i_3_n_4\,
      O(2) => \Result[11]_INST_0_i_3_n_5\,
      O(1) => \Result[11]_INST_0_i_3_n_6\,
      O(0) => \Result[11]_INST_0_i_3_n_7\,
      S(3) => \Result[11]_INST_0_i_6_n_0\,
      S(2) => \Result[11]_INST_0_i_7_n_0\,
      S(1) => \Result[11]_INST_0_i_8_n_0\,
      S(0) => \Result[11]_INST_0_i_9_n_0\
    );
\Result[11]_INST_0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(11),
      I1 => B(11),
      O => \Result[11]_INST_0_i_4_n_0\
    );
\Result[11]_INST_0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[11]_INST_0_i_10_n_0\,
      I1 => A(1),
      I2 => \Result[13]_INST_0_i_5_n_0\,
      O => \Result[11]_INST_0_i_5_n_0\
    );
\Result[11]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(11),
      I1 => B(11),
      O => \Result[11]_INST_0_i_6_n_0\
    );
\Result[11]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(10),
      I1 => B(10),
      O => \Result[11]_INST_0_i_7_n_0\
    );
\Result[11]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(9),
      I1 => B(9),
      O => \Result[11]_INST_0_i_8_n_0\
    );
\Result[11]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(8),
      I1 => B(8),
      O => \Result[11]_INST_0_i_9_n_0\
    );
\Result[12]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(12),
      I1 => B(12),
      O => \Result[12]_INST_0_i_2_n_0\
    );
\Result[12]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => Zero_INST_0_i_55_n_0,
      I1 => \Result[13]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[12]_INST_0_i_4_n_0\,
      O => \Result[12]_INST_0_i_3_n_0\
    );
\Result[12]_INST_0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[12]_INST_0_i_5_n_0\,
      I1 => A(1),
      I2 => \Result[14]_INST_0_i_5_n_0\,
      O => \Result[12]_INST_0_i_4_n_0\
    );
\Result[12]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000030BB3088"
    )
        port map (
      I0 => B(5),
      I1 => A(2),
      I2 => B(1),
      I3 => A(3),
      I4 => B(9),
      I5 => A(4),
      O => \Result[12]_INST_0_i_5_n_0\
    );
\Result[13]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(13),
      I1 => B(13),
      O => \Result[13]_INST_0_i_2_n_0\
    );
\Result[13]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => Zero_INST_0_i_55_n_0,
      I1 => \Result[14]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[13]_INST_0_i_4_n_0\,
      O => \Result[13]_INST_0_i_3_n_0\
    );
\Result[13]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \Result[13]_INST_0_i_5_n_0\,
      I1 => A(1),
      I2 => \Result[15]_INST_0_i_10_n_0\,
      I3 => A(2),
      I4 => \Result[19]_INST_0_i_10_n_0\,
      O => \Result[13]_INST_0_i_4_n_0\
    );
\Result[13]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000030BB3088"
    )
        port map (
      I0 => B(6),
      I1 => A(2),
      I2 => B(2),
      I3 => A(3),
      I4 => B(10),
      I5 => A(4),
      O => \Result[13]_INST_0_i_5_n_0\
    );
\Result[14]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(14),
      I1 => B(14),
      O => \Result[14]_INST_0_i_2_n_0\
    );
\Result[14]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => Zero_INST_0_i_55_n_0,
      I1 => \Result[15]_INST_0_i_5_n_0\,
      I2 => A(0),
      I3 => \Result[14]_INST_0_i_4_n_0\,
      O => \Result[14]_INST_0_i_3_n_0\
    );
\Result[14]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \Result[14]_INST_0_i_5_n_0\,
      I1 => A(1),
      I2 => \Result[16]_INST_0_i_5_n_0\,
      I3 => A(2),
      I4 => \Result[20]_INST_0_i_5_n_0\,
      O => \Result[14]_INST_0_i_4_n_0\
    );
\Result[14]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000030BB3088"
    )
        port map (
      I0 => B(7),
      I1 => A(2),
      I2 => B(3),
      I3 => A(3),
      I4 => B(11),
      I5 => A(4),
      O => \Result[14]_INST_0_i_5_n_0\
    );
\Result[15]_INST_0_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(0),
      I1 => A(3),
      I2 => B(8),
      I3 => A(4),
      O => \Result[15]_INST_0_i_10_n_0\
    );
\Result[15]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(15),
      I1 => B(15),
      O => \Result[15]_INST_0_i_2_n_0\
    );
\Result[15]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => Zero_INST_0_i_55_n_0,
      I1 => \Result[16]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[15]_INST_0_i_5_n_0\,
      O => \Result[15]_INST_0_i_3_n_0\
    );
\Result[15]_INST_0_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \Result[11]_INST_0_i_3_n_0\,
      CO(3) => \Result[15]_INST_0_i_4_n_0\,
      CO(2) => \Result[15]_INST_0_i_4_n_1\,
      CO(1) => \Result[15]_INST_0_i_4_n_2\,
      CO(0) => \Result[15]_INST_0_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(15 downto 12),
      O(3) => \Result[15]_INST_0_i_4_n_4\,
      O(2) => \Result[15]_INST_0_i_4_n_5\,
      O(1) => \Result[15]_INST_0_i_4_n_6\,
      O(0) => \Result[15]_INST_0_i_4_n_7\,
      S(3) => \Result[15]_INST_0_i_6_n_0\,
      S(2) => \Result[15]_INST_0_i_7_n_0\,
      S(1) => \Result[15]_INST_0_i_8_n_0\,
      S(0) => \Result[15]_INST_0_i_9_n_0\
    );
\Result[15]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[15]_INST_0_i_10_n_0\,
      I1 => \Result[19]_INST_0_i_10_n_0\,
      I2 => A(1),
      I3 => \Result[17]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[21]_INST_0_i_5_n_0\,
      O => \Result[15]_INST_0_i_5_n_0\
    );
\Result[15]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(15),
      I1 => B(15),
      O => \Result[15]_INST_0_i_6_n_0\
    );
\Result[15]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(14),
      I1 => B(14),
      O => \Result[15]_INST_0_i_7_n_0\
    );
\Result[15]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(13),
      I1 => B(13),
      O => \Result[15]_INST_0_i_8_n_0\
    );
\Result[15]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(12),
      I1 => B(12),
      O => \Result[15]_INST_0_i_9_n_0\
    );
\Result[16]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[16]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[17]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[16]_INST_0_i_4_n_0\,
      O => \Result[16]_INST_0_i_2_n_0\
    );
\Result[16]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(16),
      I1 => B(16),
      O => \Result[16]_INST_0_i_3_n_0\
    );
\Result[16]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[16]_INST_0_i_5_n_0\,
      I1 => \Result[20]_INST_0_i_5_n_0\,
      I2 => A(1),
      I3 => \Result[18]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[22]_INST_0_i_5_n_0\,
      O => \Result[16]_INST_0_i_4_n_0\
    );
\Result[16]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(1),
      I1 => A(3),
      I2 => B(9),
      I3 => A(4),
      O => \Result[16]_INST_0_i_5_n_0\
    );
\Result[17]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[17]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[18]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[17]_INST_0_i_4_n_0\,
      O => \Result[17]_INST_0_i_2_n_0\
    );
\Result[17]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(17),
      I1 => B(17),
      O => \Result[17]_INST_0_i_3_n_0\
    );
\Result[17]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[17]_INST_0_i_5_n_0\,
      I1 => \Result[21]_INST_0_i_5_n_0\,
      I2 => A(1),
      I3 => \Result[19]_INST_0_i_10_n_0\,
      I4 => A(2),
      I5 => \Result[23]_INST_0_i_10_n_0\,
      O => \Result[17]_INST_0_i_4_n_0\
    );
\Result[17]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(2),
      I1 => A(3),
      I2 => B(10),
      I3 => A(4),
      O => \Result[17]_INST_0_i_5_n_0\
    );
\Result[18]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[18]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[19]_INST_0_i_5_n_0\,
      I4 => A(0),
      I5 => \Result[18]_INST_0_i_4_n_0\,
      O => \Result[18]_INST_0_i_2_n_0\
    );
\Result[18]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(18),
      I1 => B(18),
      O => \Result[18]_INST_0_i_3_n_0\
    );
\Result[18]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[18]_INST_0_i_5_n_0\,
      I1 => \Result[22]_INST_0_i_5_n_0\,
      I2 => A(1),
      I3 => \Result[20]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[24]_INST_0_i_5_n_0\,
      O => \Result[18]_INST_0_i_4_n_0\
    );
\Result[18]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(3),
      I1 => A(3),
      I2 => B(11),
      I3 => A(4),
      O => \Result[18]_INST_0_i_5_n_0\
    );
\Result[19]_INST_0_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(4),
      I1 => A(3),
      I2 => B(12),
      I3 => A(4),
      O => \Result[19]_INST_0_i_10_n_0\
    );
\Result[19]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[19]_INST_0_i_4_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[20]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[19]_INST_0_i_5_n_0\,
      O => \Result[19]_INST_0_i_2_n_0\
    );
\Result[19]_INST_0_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \Result[15]_INST_0_i_4_n_0\,
      CO(3) => \Result[19]_INST_0_i_3_n_0\,
      CO(2) => \Result[19]_INST_0_i_3_n_1\,
      CO(1) => \Result[19]_INST_0_i_3_n_2\,
      CO(0) => \Result[19]_INST_0_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(19 downto 16),
      O(3) => \Result[19]_INST_0_i_3_n_4\,
      O(2) => \Result[19]_INST_0_i_3_n_5\,
      O(1) => \Result[19]_INST_0_i_3_n_6\,
      O(0) => \Result[19]_INST_0_i_3_n_7\,
      S(3) => \Result[19]_INST_0_i_6_n_0\,
      S(2) => \Result[19]_INST_0_i_7_n_0\,
      S(1) => \Result[19]_INST_0_i_8_n_0\,
      S(0) => \Result[19]_INST_0_i_9_n_0\
    );
\Result[19]_INST_0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(19),
      I1 => B(19),
      O => \Result[19]_INST_0_i_4_n_0\
    );
\Result[19]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[19]_INST_0_i_10_n_0\,
      I1 => \Result[23]_INST_0_i_10_n_0\,
      I2 => A(1),
      I3 => \Result[21]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[25]_INST_0_i_5_n_0\,
      O => \Result[19]_INST_0_i_5_n_0\
    );
\Result[19]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(19),
      I1 => B(19),
      O => \Result[19]_INST_0_i_6_n_0\
    );
\Result[19]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(18),
      I1 => B(18),
      O => \Result[19]_INST_0_i_7_n_0\
    );
\Result[19]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(17),
      I1 => B(17),
      O => \Result[19]_INST_0_i_8_n_0\
    );
\Result[19]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(16),
      I1 => B(16),
      O => \Result[19]_INST_0_i_9_n_0\
    );
\Result[1]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[1]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[2]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[1]_INST_0_i_4_n_0\,
      O => \Result[1]_INST_0_i_2_n_0\
    );
\Result[1]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(1),
      I1 => B(1),
      O => \Result[1]_INST_0_i_3_n_0\
    );
\Result[1]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => A(2),
      I1 => A(4),
      I2 => B(0),
      I3 => A(3),
      I4 => A(1),
      O => \Result[1]_INST_0_i_4_n_0\
    );
\Result[20]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[20]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[21]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[20]_INST_0_i_4_n_0\,
      O => \Result[20]_INST_0_i_2_n_0\
    );
\Result[20]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(20),
      I1 => B(20),
      O => \Result[20]_INST_0_i_3_n_0\
    );
\Result[20]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[20]_INST_0_i_5_n_0\,
      I1 => \Result[24]_INST_0_i_5_n_0\,
      I2 => A(1),
      I3 => \Result[22]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[26]_INST_0_i_5_n_0\,
      O => \Result[20]_INST_0_i_4_n_0\
    );
\Result[20]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(5),
      I1 => A(3),
      I2 => B(13),
      I3 => A(4),
      O => \Result[20]_INST_0_i_5_n_0\
    );
\Result[21]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[21]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[22]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[21]_INST_0_i_4_n_0\,
      O => \Result[21]_INST_0_i_2_n_0\
    );
\Result[21]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(21),
      I1 => B(21),
      O => \Result[21]_INST_0_i_3_n_0\
    );
\Result[21]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[21]_INST_0_i_5_n_0\,
      I1 => \Result[25]_INST_0_i_5_n_0\,
      I2 => A(1),
      I3 => \Result[23]_INST_0_i_10_n_0\,
      I4 => A(2),
      I5 => \Result[27]_INST_0_i_10_n_0\,
      O => \Result[21]_INST_0_i_4_n_0\
    );
\Result[21]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(6),
      I1 => A(3),
      I2 => B(14),
      I3 => A(4),
      O => \Result[21]_INST_0_i_5_n_0\
    );
\Result[22]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(22),
      I1 => B(22),
      O => \Result[22]_INST_0_i_2_n_0\
    );
\Result[22]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => Zero_INST_0_i_55_n_0,
      I1 => \Result[23]_INST_0_i_5_n_0\,
      I2 => A(0),
      I3 => \Result[22]_INST_0_i_4_n_0\,
      O => \Result[22]_INST_0_i_3_n_0\
    );
\Result[22]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[22]_INST_0_i_5_n_0\,
      I1 => \Result[26]_INST_0_i_5_n_0\,
      I2 => A(1),
      I3 => \Result[24]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[28]_INST_0_i_5_n_0\,
      O => \Result[22]_INST_0_i_4_n_0\
    );
\Result[22]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(7),
      I1 => A(3),
      I2 => B(15),
      I3 => A(4),
      O => \Result[22]_INST_0_i_5_n_0\
    );
\Result[23]_INST_0_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => B(8),
      I1 => A(3),
      I2 => B(0),
      I3 => A(4),
      I4 => B(16),
      O => \Result[23]_INST_0_i_10_n_0\
    );
\Result[23]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(23),
      I1 => B(23),
      O => \Result[23]_INST_0_i_2_n_0\
    );
\Result[23]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => Zero_INST_0_i_55_n_0,
      I1 => \Result[24]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[23]_INST_0_i_5_n_0\,
      O => \Result[23]_INST_0_i_3_n_0\
    );
\Result[23]_INST_0_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \Result[19]_INST_0_i_3_n_0\,
      CO(3) => \Result[23]_INST_0_i_4_n_0\,
      CO(2) => \Result[23]_INST_0_i_4_n_1\,
      CO(1) => \Result[23]_INST_0_i_4_n_2\,
      CO(0) => \Result[23]_INST_0_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(23 downto 20),
      O(3) => \Result[23]_INST_0_i_4_n_4\,
      O(2) => \Result[23]_INST_0_i_4_n_5\,
      O(1) => \Result[23]_INST_0_i_4_n_6\,
      O(0) => \Result[23]_INST_0_i_4_n_7\,
      S(3) => \Result[23]_INST_0_i_6_n_0\,
      S(2) => \Result[23]_INST_0_i_7_n_0\,
      S(1) => \Result[23]_INST_0_i_8_n_0\,
      S(0) => \Result[23]_INST_0_i_9_n_0\
    );
\Result[23]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[23]_INST_0_i_10_n_0\,
      I1 => \Result[27]_INST_0_i_10_n_0\,
      I2 => A(1),
      I3 => \Result[25]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[29]_INST_0_i_5_n_0\,
      O => \Result[23]_INST_0_i_5_n_0\
    );
\Result[23]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(23),
      I1 => B(23),
      O => \Result[23]_INST_0_i_6_n_0\
    );
\Result[23]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(22),
      I1 => B(22),
      O => \Result[23]_INST_0_i_7_n_0\
    );
\Result[23]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(21),
      I1 => B(21),
      O => \Result[23]_INST_0_i_8_n_0\
    );
\Result[23]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(20),
      I1 => B(20),
      O => \Result[23]_INST_0_i_9_n_0\
    );
\Result[24]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[24]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[25]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[24]_INST_0_i_4_n_0\,
      O => \Result[24]_INST_0_i_2_n_0\
    );
\Result[24]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(24),
      I1 => B(24),
      O => \Result[24]_INST_0_i_3_n_0\
    );
\Result[24]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[24]_INST_0_i_5_n_0\,
      I1 => \Result[28]_INST_0_i_5_n_0\,
      I2 => A(1),
      I3 => \Result[26]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[30]_INST_0_i_5_n_0\,
      O => \Result[24]_INST_0_i_4_n_0\
    );
\Result[24]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => B(9),
      I1 => A(3),
      I2 => B(1),
      I3 => A(4),
      I4 => B(17),
      O => \Result[24]_INST_0_i_5_n_0\
    );
\Result[25]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[25]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[26]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[25]_INST_0_i_4_n_0\,
      O => \Result[25]_INST_0_i_2_n_0\
    );
\Result[25]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(25),
      I1 => B(25),
      O => \Result[25]_INST_0_i_3_n_0\
    );
\Result[25]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[25]_INST_0_i_5_n_0\,
      I1 => \Result[29]_INST_0_i_5_n_0\,
      I2 => A(1),
      I3 => \Result[27]_INST_0_i_10_n_0\,
      I4 => A(2),
      I5 => \Result[31]_INST_0_i_22_n_0\,
      O => \Result[25]_INST_0_i_4_n_0\
    );
\Result[25]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => B(10),
      I1 => A(3),
      I2 => B(2),
      I3 => A(4),
      I4 => B(18),
      O => \Result[25]_INST_0_i_5_n_0\
    );
\Result[26]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[26]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[27]_INST_0_i_5_n_0\,
      I4 => A(0),
      I5 => \Result[26]_INST_0_i_4_n_0\,
      O => \Result[26]_INST_0_i_2_n_0\
    );
\Result[26]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(26),
      I1 => B(26),
      O => \Result[26]_INST_0_i_3_n_0\
    );
\Result[26]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[26]_INST_0_i_5_n_0\,
      I1 => \Result[30]_INST_0_i_5_n_0\,
      I2 => A(1),
      I3 => \Result[28]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[31]_INST_0_i_18_n_0\,
      O => \Result[26]_INST_0_i_4_n_0\
    );
\Result[26]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => B(11),
      I1 => A(3),
      I2 => B(3),
      I3 => A(4),
      I4 => B(19),
      O => \Result[26]_INST_0_i_5_n_0\
    );
\Result[27]_INST_0_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => B(12),
      I1 => A(3),
      I2 => B(4),
      I3 => A(4),
      I4 => B(20),
      O => \Result[27]_INST_0_i_10_n_0\
    );
\Result[27]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[27]_INST_0_i_4_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[28]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[27]_INST_0_i_5_n_0\,
      O => \Result[27]_INST_0_i_2_n_0\
    );
\Result[27]_INST_0_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \Result[23]_INST_0_i_4_n_0\,
      CO(3) => \Result[27]_INST_0_i_3_n_0\,
      CO(2) => \Result[27]_INST_0_i_3_n_1\,
      CO(1) => \Result[27]_INST_0_i_3_n_2\,
      CO(0) => \Result[27]_INST_0_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(27 downto 24),
      O(3) => \Result[27]_INST_0_i_3_n_4\,
      O(2) => \Result[27]_INST_0_i_3_n_5\,
      O(1) => \Result[27]_INST_0_i_3_n_6\,
      O(0) => \Result[27]_INST_0_i_3_n_7\,
      S(3) => \Result[27]_INST_0_i_6_n_0\,
      S(2) => \Result[27]_INST_0_i_7_n_0\,
      S(1) => \Result[27]_INST_0_i_8_n_0\,
      S(0) => \Result[27]_INST_0_i_9_n_0\
    );
\Result[27]_INST_0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(27),
      I1 => B(27),
      O => \Result[27]_INST_0_i_4_n_0\
    );
\Result[27]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[27]_INST_0_i_10_n_0\,
      I1 => \Result[31]_INST_0_i_22_n_0\,
      I2 => A(1),
      I3 => \Result[29]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[31]_INST_0_i_24_n_0\,
      O => \Result[27]_INST_0_i_5_n_0\
    );
\Result[27]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(27),
      I1 => B(27),
      O => \Result[27]_INST_0_i_6_n_0\
    );
\Result[27]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(26),
      I1 => B(26),
      O => \Result[27]_INST_0_i_7_n_0\
    );
\Result[27]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(25),
      I1 => B(25),
      O => \Result[27]_INST_0_i_8_n_0\
    );
\Result[27]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(24),
      I1 => B(24),
      O => \Result[27]_INST_0_i_9_n_0\
    );
\Result[28]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[28]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[29]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[28]_INST_0_i_4_n_0\,
      O => \Result[28]_INST_0_i_2_n_0\
    );
\Result[28]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(28),
      I1 => B(28),
      O => \Result[28]_INST_0_i_3_n_0\
    );
\Result[28]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[28]_INST_0_i_5_n_0\,
      I1 => \Result[31]_INST_0_i_18_n_0\,
      I2 => A(1),
      I3 => \Result[30]_INST_0_i_5_n_0\,
      I4 => A(2),
      I5 => \Result[31]_INST_0_i_20_n_0\,
      O => \Result[28]_INST_0_i_4_n_0\
    );
\Result[28]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => B(13),
      I1 => A(3),
      I2 => B(5),
      I3 => A(4),
      I4 => B(21),
      O => \Result[28]_INST_0_i_5_n_0\
    );
\Result[29]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[29]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[30]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[29]_INST_0_i_4_n_0\,
      O => \Result[29]_INST_0_i_2_n_0\
    );
\Result[29]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(29),
      I1 => B(29),
      O => \Result[29]_INST_0_i_3_n_0\
    );
\Result[29]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[29]_INST_0_i_5_n_0\,
      I1 => \Result[31]_INST_0_i_24_n_0\,
      I2 => A(1),
      I3 => \Result[31]_INST_0_i_22_n_0\,
      I4 => A(2),
      I5 => \Result[31]_INST_0_i_23_n_0\,
      O => \Result[29]_INST_0_i_4_n_0\
    );
\Result[29]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => B(14),
      I1 => A(3),
      I2 => B(6),
      I3 => A(4),
      I4 => B(22),
      O => \Result[29]_INST_0_i_5_n_0\
    );
\Result[2]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[2]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[3]_INST_0_i_5_n_0\,
      I4 => A(0),
      I5 => \Result[2]_INST_0_i_4_n_0\,
      O => \Result[2]_INST_0_i_2_n_0\
    );
\Result[2]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(2),
      I1 => B(2),
      O => \Result[2]_INST_0_i_3_n_0\
    );
\Result[2]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => A(2),
      I1 => A(4),
      I2 => B(1),
      I3 => A(3),
      I4 => A(1),
      O => \Result[2]_INST_0_i_4_n_0\
    );
\Result[30]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[30]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[31]_INST_0_i_9_n_0\,
      I4 => A(0),
      I5 => \Result[30]_INST_0_i_4_n_0\,
      O => \Result[30]_INST_0_i_2_n_0\
    );
\Result[30]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(30),
      I1 => B(30),
      O => \Result[30]_INST_0_i_3_n_0\
    );
\Result[30]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[30]_INST_0_i_5_n_0\,
      I1 => \Result[31]_INST_0_i_20_n_0\,
      I2 => A(1),
      I3 => \Result[31]_INST_0_i_18_n_0\,
      I4 => A(2),
      I5 => \Result[31]_INST_0_i_19_n_0\,
      O => \Result[30]_INST_0_i_4_n_0\
    );
\Result[30]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => B(15),
      I1 => A(3),
      I2 => B(7),
      I3 => A(4),
      I4 => B(23),
      O => \Result[30]_INST_0_i_5_n_0\
    );
\Result[31]_INST_0_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(31),
      I1 => B(31),
      O => \Result[31]_INST_0_i_10_n_0\
    );
\Result[31]_INST_0_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(30),
      I1 => B(30),
      O => \Result[31]_INST_0_i_11_n_0\
    );
\Result[31]_INST_0_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(29),
      I1 => B(29),
      O => \Result[31]_INST_0_i_12_n_0\
    );
\Result[31]_INST_0_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(28),
      I1 => B(28),
      O => \Result[31]_INST_0_i_13_n_0\
    );
\Result[31]_INST_0_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => A(15),
      I1 => A(16),
      I2 => A(13),
      I3 => A(14),
      O => \Result[31]_INST_0_i_14_n_0\
    );
\Result[31]_INST_0_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => A(7),
      I1 => A(8),
      I2 => A(5),
      I3 => A(6),
      O => \Result[31]_INST_0_i_15_n_0\
    );
\Result[31]_INST_0_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => A(23),
      I1 => A(24),
      I2 => A(21),
      I3 => A(22),
      O => \Result[31]_INST_0_i_16_n_0\
    );
\Result[31]_INST_0_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => A(27),
      I1 => A(28),
      I2 => A(25),
      I3 => A(26),
      O => \Result[31]_INST_0_i_17_n_0\
    );
\Result[31]_INST_0_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => B(1),
      I1 => B(17),
      I2 => A(3),
      I3 => B(9),
      I4 => A(4),
      I5 => B(25),
      O => \Result[31]_INST_0_i_18_n_0\
    );
\Result[31]_INST_0_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => B(5),
      I1 => B(21),
      I2 => A(3),
      I3 => B(13),
      I4 => A(4),
      I5 => B(29),
      O => \Result[31]_INST_0_i_19_n_0\
    );
\Result[31]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(31),
      I1 => B(31),
      O => p_4_in
    );
\Result[31]_INST_0_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => B(3),
      I1 => B(19),
      I2 => A(3),
      I3 => B(11),
      I4 => A(4),
      I5 => B(27),
      O => \Result[31]_INST_0_i_20_n_0\
    );
\Result[31]_INST_0_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => B(7),
      I1 => B(23),
      I2 => A(3),
      I3 => B(15),
      I4 => A(4),
      I5 => B(31),
      O => \Result[31]_INST_0_i_21_n_0\
    );
\Result[31]_INST_0_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => B(0),
      I1 => B(16),
      I2 => A(3),
      I3 => B(8),
      I4 => A(4),
      I5 => B(24),
      O => \Result[31]_INST_0_i_22_n_0\
    );
\Result[31]_INST_0_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => B(4),
      I1 => B(20),
      I2 => A(3),
      I3 => B(12),
      I4 => A(4),
      I5 => B(28),
      O => \Result[31]_INST_0_i_23_n_0\
    );
\Result[31]_INST_0_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => B(2),
      I1 => B(18),
      I2 => A(3),
      I3 => B(10),
      I4 => A(4),
      I5 => B(26),
      O => \Result[31]_INST_0_i_24_n_0\
    );
\Result[31]_INST_0_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => B(6),
      I1 => B(22),
      I2 => A(3),
      I3 => B(14),
      I4 => A(4),
      I5 => B(30),
      O => \Result[31]_INST_0_i_25_n_0\
    );
\Result[31]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010000000100"
    )
        port map (
      I0 => \Result[31]_INST_0_i_5_n_0\,
      I1 => \Result[31]_INST_0_i_6_n_0\,
      I2 => \Result[31]_INST_0_i_7_n_0\,
      I3 => \Result[31]_INST_0_i_8_n_0\,
      I4 => A(0),
      I5 => \Result[31]_INST_0_i_9_n_0\,
      O => data2
    );
\Result[31]_INST_0_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \Result[27]_INST_0_i_3_n_0\,
      CO(3) => \NLW_Result[31]_INST_0_i_4_CO_UNCONNECTED\(3),
      CO(2) => \Result[31]_INST_0_i_4_n_1\,
      CO(1) => \Result[31]_INST_0_i_4_n_2\,
      CO(0) => \Result[31]_INST_0_i_4_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => A(30 downto 28),
      O(3) => data0,
      O(2) => \Result[31]_INST_0_i_4_n_5\,
      O(1) => \Result[31]_INST_0_i_4_n_6\,
      O(0) => \Result[31]_INST_0_i_4_n_7\,
      S(3) => \Result[31]_INST_0_i_10_n_0\,
      S(2) => \Result[31]_INST_0_i_11_n_0\,
      S(1) => \Result[31]_INST_0_i_12_n_0\,
      S(0) => \Result[31]_INST_0_i_13_n_0\
    );
\Result[31]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => A(18),
      I1 => A(17),
      I2 => A(20),
      I3 => A(19),
      I4 => \Result[31]_INST_0_i_14_n_0\,
      O => \Result[31]_INST_0_i_5_n_0\
    );
\Result[31]_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => A(10),
      I1 => A(9),
      I2 => A(12),
      I3 => A(11),
      I4 => \Result[31]_INST_0_i_15_n_0\,
      O => \Result[31]_INST_0_i_6_n_0\
    );
\Result[31]_INST_0_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => A(30),
      I1 => A(29),
      I2 => A(31),
      I3 => \Result[31]_INST_0_i_16_n_0\,
      I4 => \Result[31]_INST_0_i_17_n_0\,
      O => \Result[31]_INST_0_i_7_n_0\
    );
\Result[31]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[31]_INST_0_i_18_n_0\,
      I1 => \Result[31]_INST_0_i_19_n_0\,
      I2 => A(1),
      I3 => \Result[31]_INST_0_i_20_n_0\,
      I4 => A(2),
      I5 => \Result[31]_INST_0_i_21_n_0\,
      O => \Result[31]_INST_0_i_8_n_0\
    );
\Result[31]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[31]_INST_0_i_22_n_0\,
      I1 => \Result[31]_INST_0_i_23_n_0\,
      I2 => A(1),
      I3 => \Result[31]_INST_0_i_24_n_0\,
      I4 => A(2),
      I5 => \Result[31]_INST_0_i_25_n_0\,
      O => \Result[31]_INST_0_i_9_n_0\
    );
\Result[3]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[3]_INST_0_i_4_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[4]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[3]_INST_0_i_5_n_0\,
      O => \Result[3]_INST_0_i_2_n_0\
    );
\Result[3]_INST_0_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \Result[3]_INST_0_i_3_n_0\,
      CO(2) => \Result[3]_INST_0_i_3_n_1\,
      CO(1) => \Result[3]_INST_0_i_3_n_2\,
      CO(0) => \Result[3]_INST_0_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(3 downto 0),
      O(3) => \Result[3]_INST_0_i_3_n_4\,
      O(2) => \Result[3]_INST_0_i_3_n_5\,
      O(1) => \Result[3]_INST_0_i_3_n_6\,
      O(0) => \Result[3]_INST_0_i_3_n_7\,
      S(3) => \Result[3]_INST_0_i_6_n_0\,
      S(2) => \Result[3]_INST_0_i_7_n_0\,
      S(1) => \Result[3]_INST_0_i_8_n_0\,
      S(0) => \Result[3]_INST_0_i_9_n_0\
    );
\Result[3]_INST_0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(3),
      I1 => B(3),
      O => \Result[3]_INST_0_i_4_n_0\
    );
\Result[3]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000B08"
    )
        port map (
      I0 => B(0),
      I1 => A(1),
      I2 => A(3),
      I3 => B(2),
      I4 => A(4),
      I5 => A(2),
      O => \Result[3]_INST_0_i_5_n_0\
    );
\Result[3]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(3),
      I1 => B(3),
      O => \Result[3]_INST_0_i_6_n_0\
    );
\Result[3]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(2),
      I1 => B(2),
      O => \Result[3]_INST_0_i_7_n_0\
    );
\Result[3]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(1),
      I1 => B(1),
      O => \Result[3]_INST_0_i_8_n_0\
    );
\Result[3]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(0),
      I1 => B(0),
      O => \Result[3]_INST_0_i_9_n_0\
    );
\Result[4]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(4),
      I1 => B(4),
      O => \Result[4]_INST_0_i_2_n_0\
    );
\Result[4]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => Zero_INST_0_i_55_n_0,
      I1 => \Result[5]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[4]_INST_0_i_4_n_0\,
      O => \Result[4]_INST_0_i_3_n_0\
    );
\Result[4]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000B08"
    )
        port map (
      I0 => B(1),
      I1 => A(1),
      I2 => A(3),
      I3 => B(3),
      I4 => A(4),
      I5 => A(2),
      O => \Result[4]_INST_0_i_4_n_0\
    );
\Result[5]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(5),
      I1 => B(5),
      O => \Result[5]_INST_0_i_2_n_0\
    );
\Result[5]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => Zero_INST_0_i_55_n_0,
      I1 => \Result[6]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[5]_INST_0_i_4_n_0\,
      O => \Result[5]_INST_0_i_3_n_0\
    );
\Result[5]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004FFFF00040000"
    )
        port map (
      I0 => A(3),
      I1 => B(2),
      I2 => A(4),
      I3 => A(2),
      I4 => A(1),
      I5 => \Result[7]_INST_0_i_5_n_0\,
      O => \Result[5]_INST_0_i_4_n_0\
    );
\Result[6]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(6),
      I1 => B(6),
      O => \Result[6]_INST_0_i_2_n_0\
    );
\Result[6]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00B8000000B800"
    )
        port map (
      I0 => \Result[7]_INST_0_i_5_n_0\,
      I1 => A(1),
      I2 => \Result[7]_INST_0_i_6_n_0\,
      I3 => Zero_INST_0_i_55_n_0,
      I4 => A(0),
      I5 => \Result[6]_INST_0_i_4_n_0\,
      O => \Result[6]_INST_0_i_3_n_0\
    );
\Result[6]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004FFFF00040000"
    )
        port map (
      I0 => A(3),
      I1 => B(3),
      I2 => A(4),
      I3 => A(2),
      I4 => A(1),
      I5 => Zero_INST_0_i_101_n_0,
      O => \Result[6]_INST_0_i_4_n_0\
    );
\Result[7]_INST_0_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(4),
      I1 => B(4),
      O => \Result[7]_INST_0_i_10_n_0\
    );
\Result[7]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(7),
      I1 => B(7),
      O => \Result[7]_INST_0_i_2_n_0\
    );
\Result[7]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B800B800FF000000"
    )
        port map (
      I0 => \Result[7]_INST_0_i_5_n_0\,
      I1 => A(1),
      I2 => \Result[7]_INST_0_i_6_n_0\,
      I3 => Zero_INST_0_i_55_n_0,
      I4 => \Result[8]_INST_0_i_4_n_0\,
      I5 => A(0),
      O => \Result[7]_INST_0_i_3_n_0\
    );
\Result[7]_INST_0_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \Result[3]_INST_0_i_3_n_0\,
      CO(3) => \Result[7]_INST_0_i_4_n_0\,
      CO(2) => \Result[7]_INST_0_i_4_n_1\,
      CO(1) => \Result[7]_INST_0_i_4_n_2\,
      CO(0) => \Result[7]_INST_0_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A(7 downto 4),
      O(3) => \Result[7]_INST_0_i_4_n_4\,
      O(2) => \Result[7]_INST_0_i_4_n_5\,
      O(1) => \Result[7]_INST_0_i_4_n_6\,
      O(0) => \Result[7]_INST_0_i_4_n_7\,
      S(3) => \Result[7]_INST_0_i_7_n_0\,
      S(2) => \Result[7]_INST_0_i_8_n_0\,
      S(1) => \Result[7]_INST_0_i_9_n_0\,
      S(0) => \Result[7]_INST_0_i_10_n_0\
    );
\Result[7]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000B08"
    )
        port map (
      I0 => B(0),
      I1 => A(2),
      I2 => A(4),
      I3 => B(4),
      I4 => A(3),
      O => \Result[7]_INST_0_i_5_n_0\
    );
\Result[7]_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000B08"
    )
        port map (
      I0 => B(2),
      I1 => A(2),
      I2 => A(4),
      I3 => B(6),
      I4 => A(3),
      O => \Result[7]_INST_0_i_6_n_0\
    );
\Result[7]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(7),
      I1 => B(7),
      O => \Result[7]_INST_0_i_7_n_0\
    );
\Result[7]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(6),
      I1 => B(6),
      O => \Result[7]_INST_0_i_8_n_0\
    );
\Result[7]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(5),
      I1 => B(5),
      O => \Result[7]_INST_0_i_9_n_0\
    );
\Result[8]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[8]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[9]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[8]_INST_0_i_4_n_0\,
      O => \Result[8]_INST_0_i_2_n_0\
    );
\Result[8]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(8),
      I1 => B(8),
      O => \Result[8]_INST_0_i_3_n_0\
    );
\Result[8]_INST_0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Zero_INST_0_i_101_n_0,
      I1 => A(1),
      I2 => Zero_INST_0_i_102_n_0,
      O => \Result[8]_INST_0_i_4_n_0\
    );
\Result[9]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \Result[9]_INST_0_i_3_n_0\,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_55_n_0,
      I3 => \Result[10]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[9]_INST_0_i_4_n_0\,
      O => \Result[9]_INST_0_i_2_n_0\
    );
\Result[9]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A(9),
      I1 => B(9),
      O => \Result[9]_INST_0_i_3_n_0\
    );
\Result[9]_INST_0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[7]_INST_0_i_6_n_0\,
      I1 => A(1),
      I2 => \Result[11]_INST_0_i_10_n_0\,
      O => \Result[9]_INST_0_i_4_n_0\
    );
Zero_INST_0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => Zero_INST_0_i_40_n_0,
      I1 => B(23),
      I2 => A(23),
      I3 => B(22),
      I4 => A(22),
      I5 => Zero_INST_0_i_41_n_0,
      O => Zero_INST_0_i_10_n_0
    );
Zero_INST_0_i_100: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => A(26),
      I1 => A(25),
      I2 => A(28),
      I3 => A(27),
      I4 => \Result[31]_INST_0_i_16_n_0\,
      O => Zero_INST_0_i_100_n_0
    );
Zero_INST_0_i_101: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000B08"
    )
        port map (
      I0 => B(1),
      I1 => A(2),
      I2 => A(4),
      I3 => B(5),
      I4 => A(3),
      O => Zero_INST_0_i_101_n_0
    );
Zero_INST_0_i_102: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000B08"
    )
        port map (
      I0 => B(3),
      I1 => A(2),
      I2 => A(4),
      I3 => B(7),
      I4 => A(3),
      O => Zero_INST_0_i_102_n_0
    );
Zero_INST_0_i_103: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[2]_INST_0_i_4_n_0\,
      I1 => A(0),
      I2 => \Result[3]_INST_0_i_5_n_0\,
      O => Zero_INST_0_i_103_n_0
    );
Zero_INST_0_i_104: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[3]_INST_0_i_5_n_0\,
      I1 => A(0),
      I2 => \Result[4]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_104_n_0
    );
Zero_INST_0_i_105: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => A(1),
      I1 => A(3),
      I2 => B(0),
      I3 => A(4),
      I4 => A(2),
      I5 => A(0),
      O => Zero_INST_0_i_105_n_0
    );
Zero_INST_0_i_106: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[1]_INST_0_i_4_n_0\,
      I1 => A(0),
      I2 => \Result[2]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_106_n_0
    );
Zero_INST_0_i_107: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Zero_INST_0_i_102_n_0,
      I1 => \Result[12]_INST_0_i_5_n_0\,
      I2 => A(0),
      I3 => \Result[11]_INST_0_i_10_n_0\,
      I4 => A(1),
      I5 => \Result[13]_INST_0_i_5_n_0\,
      O => Zero_INST_0_i_107_n_0
    );
Zero_INST_0_i_108: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[11]_INST_0_i_10_n_0\,
      I1 => \Result[13]_INST_0_i_5_n_0\,
      I2 => A(0),
      I3 => \Result[12]_INST_0_i_5_n_0\,
      I4 => A(1),
      I5 => \Result[14]_INST_0_i_5_n_0\,
      O => Zero_INST_0_i_108_n_0
    );
Zero_INST_0_i_109: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Zero_INST_0_i_101_n_0,
      I1 => Zero_INST_0_i_102_n_0,
      I2 => A(0),
      I3 => \Result[7]_INST_0_i_6_n_0\,
      I4 => A(1),
      I5 => \Result[11]_INST_0_i_10_n_0\,
      O => Zero_INST_0_i_109_n_0
    );
Zero_INST_0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => Zero_INST_0_i_42_n_0,
      I1 => B(30),
      I2 => A(30),
      I3 => B(31),
      I4 => A(31),
      I5 => Zero_INST_0_i_43_n_0,
      O => Zero_INST_0_i_11_n_0
    );
Zero_INST_0_i_110: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[7]_INST_0_i_6_n_0\,
      I1 => \Result[11]_INST_0_i_10_n_0\,
      I2 => A(0),
      I3 => Zero_INST_0_i_102_n_0,
      I4 => A(1),
      I5 => \Result[12]_INST_0_i_5_n_0\,
      O => Zero_INST_0_i_110_n_0
    );
Zero_INST_0_i_111: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => B(17),
      I1 => A(17),
      I2 => B(16),
      I3 => A(16),
      O => Zero_INST_0_i_111_n_0
    );
Zero_INST_0_i_112: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => B(25),
      I1 => A(25),
      I2 => B(24),
      I3 => A(24),
      O => Zero_INST_0_i_112_n_0
    );
Zero_INST_0_i_113: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => B(1),
      I1 => A(1),
      I2 => B(0),
      I3 => A(0),
      O => Zero_INST_0_i_113_n_0
    );
Zero_INST_0_i_114: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => B(9),
      I1 => A(9),
      I2 => B(8),
      I3 => A(8),
      O => Zero_INST_0_i_114_n_0
    );
Zero_INST_0_i_115: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => A(19),
      I1 => A(20),
      I2 => A(17),
      I3 => A(18),
      O => Zero_INST_0_i_115_n_0
    );
Zero_INST_0_i_116: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => A(11),
      I1 => A(12),
      I2 => A(9),
      I3 => A(10),
      O => Zero_INST_0_i_116_n_0
    );
Zero_INST_0_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => Zero_INST_0_i_44_n_0,
      I1 => B(7),
      I2 => A(7),
      I3 => B(6),
      I4 => A(6),
      I5 => Zero_INST_0_i_45_n_0,
      O => Zero_INST_0_i_12_n_0
    );
Zero_INST_0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => Zero_INST_0_i_46_n_0,
      I1 => B(15),
      I2 => A(15),
      I3 => B(14),
      I4 => A(14),
      I5 => Zero_INST_0_i_47_n_0,
      O => Zero_INST_0_i_13_n_0
    );
Zero_INST_0_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => Zero_INST_0_i_48_n_0,
      I1 => Zero_INST_0_i_49_n_0,
      I2 => Zero_INST_0_i_50_n_0,
      I3 => Zero_INST_0_i_51_n_0,
      O => Zero_INST_0_i_14_n_0
    );
Zero_INST_0_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEAA"
    )
        port map (
      I0 => Zero_INST_0_i_52_n_0,
      I1 => Zero_INST_0_i_53_n_0,
      I2 => Zero_INST_0_i_54_n_0,
      I3 => Zero_INST_0_i_55_n_0,
      I4 => Zero_INST_0_i_56_n_0,
      I5 => Zero_INST_0_i_57_n_0,
      O => Zero_INST_0_i_15_n_0
    );
Zero_INST_0_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Zero_INST_0_i_58_n_0,
      I1 => Zero_INST_0_i_59_n_0,
      I2 => Zero_INST_0_i_60_n_0,
      I3 => data2,
      I4 => Zero_INST_0_i_61_n_0,
      I5 => Zero_INST_0_i_62_n_0,
      O => Zero_INST_0_i_16_n_0
    );
Zero_INST_0_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF0F0F0E0"
    )
        port map (
      I0 => Zero_INST_0_i_63_n_0,
      I1 => Zero_INST_0_i_64_n_0,
      I2 => Zero_INST_0_i_55_n_0,
      I3 => Zero_INST_0_i_65_n_0,
      I4 => Zero_INST_0_i_66_n_0,
      I5 => Zero_INST_0_i_67_n_0,
      O => Zero_INST_0_i_17_n_0
    );
Zero_INST_0_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF0F0F0E0"
    )
        port map (
      I0 => Zero_INST_0_i_68_n_0,
      I1 => Zero_INST_0_i_69_n_0,
      I2 => Zero_INST_0_i_55_n_0,
      I3 => Zero_INST_0_i_70_n_0,
      I4 => Zero_INST_0_i_71_n_0,
      I5 => Zero_INST_0_i_72_n_0,
      O => Zero_INST_0_i_18_n_0
    );
Zero_INST_0_i_22: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => Zero_INST_0_i_79_n_0,
      I1 => Zero_INST_0_i_80_n_0,
      I2 => Zero_INST_0_i_81_n_0,
      I3 => Zero_INST_0_i_82_n_0,
      O => Zero_INST_0_i_22_n_0
    );
Zero_INST_0_i_23: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBFF"
    )
        port map (
      I0 => Zero_INST_0_i_83_n_0,
      I1 => Zero_INST_0_i_84_n_0,
      I2 => Zero_INST_0_i_85_n_0,
      I3 => Zero_INST_0_i_86_n_0,
      O => Zero_INST_0_i_23_n_0
    );
Zero_INST_0_i_24: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(21),
      I1 => A(21),
      I2 => B(20),
      I3 => A(20),
      O => Zero_INST_0_i_24_n_0
    );
Zero_INST_0_i_25: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(23),
      I1 => B(23),
      O => Zero_INST_0_i_25_n_0
    );
Zero_INST_0_i_26: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(17),
      I1 => A(17),
      I2 => B(16),
      I3 => A(16),
      O => Zero_INST_0_i_26_n_0
    );
Zero_INST_0_i_27: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(19),
      I1 => A(19),
      I2 => B(18),
      I3 => A(18),
      O => Zero_INST_0_i_27_n_0
    );
Zero_INST_0_i_28: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(29),
      I1 => A(29),
      I2 => B(28),
      I3 => A(28),
      O => Zero_INST_0_i_28_n_0
    );
Zero_INST_0_i_29: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(31),
      I1 => B(31),
      O => Zero_INST_0_i_29_n_0
    );
Zero_INST_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888888888888888B"
    )
        port map (
      I0 => Zero_INST_0_i_14_n_0,
      I1 => AluOp(0),
      I2 => Zero_INST_0_i_15_n_0,
      I3 => Zero_INST_0_i_16_n_0,
      I4 => Zero_INST_0_i_17_n_0,
      I5 => Zero_INST_0_i_18_n_0,
      O => Zero_INST_0_i_3_n_0
    );
Zero_INST_0_i_30: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(25),
      I1 => A(25),
      I2 => B(24),
      I3 => A(24),
      O => Zero_INST_0_i_30_n_0
    );
Zero_INST_0_i_31: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(27),
      I1 => A(27),
      I2 => B(26),
      I3 => A(26),
      O => Zero_INST_0_i_31_n_0
    );
Zero_INST_0_i_32: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(5),
      I1 => A(5),
      I2 => B(4),
      I3 => A(4),
      O => Zero_INST_0_i_32_n_0
    );
Zero_INST_0_i_33: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(7),
      I1 => B(7),
      O => Zero_INST_0_i_33_n_0
    );
Zero_INST_0_i_34: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(1),
      I1 => A(1),
      I2 => B(0),
      I3 => A(0),
      O => Zero_INST_0_i_34_n_0
    );
Zero_INST_0_i_35: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(3),
      I1 => A(3),
      I2 => B(2),
      I3 => A(2),
      O => Zero_INST_0_i_35_n_0
    );
Zero_INST_0_i_36: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(13),
      I1 => A(13),
      I2 => B(12),
      I3 => A(12),
      O => Zero_INST_0_i_36_n_0
    );
Zero_INST_0_i_37: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A(15),
      I1 => B(15),
      O => Zero_INST_0_i_37_n_0
    );
Zero_INST_0_i_38: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(9),
      I1 => A(9),
      I2 => B(8),
      I3 => A(8),
      O => Zero_INST_0_i_38_n_0
    );
Zero_INST_0_i_39: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => B(11),
      I1 => A(11),
      I2 => B(10),
      I3 => A(10),
      O => Zero_INST_0_i_39_n_0
    );
Zero_INST_0_i_40: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => B(21),
      I1 => A(21),
      I2 => B(20),
      I3 => A(20),
      O => Zero_INST_0_i_40_n_0
    );
Zero_INST_0_i_41: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => A(18),
      I1 => B(18),
      I2 => A(19),
      I3 => B(19),
      I4 => Zero_INST_0_i_87_n_0,
      O => Zero_INST_0_i_41_n_0
    );
Zero_INST_0_i_42: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => B(29),
      I1 => A(29),
      I2 => B(28),
      I3 => A(28),
      O => Zero_INST_0_i_42_n_0
    );
Zero_INST_0_i_43: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => A(26),
      I1 => B(26),
      I2 => A(27),
      I3 => B(27),
      I4 => Zero_INST_0_i_88_n_0,
      O => Zero_INST_0_i_43_n_0
    );
Zero_INST_0_i_44: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => B(5),
      I1 => A(5),
      I2 => B(4),
      I3 => A(4),
      O => Zero_INST_0_i_44_n_0
    );
Zero_INST_0_i_45: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => A(2),
      I1 => B(2),
      I2 => A(3),
      I3 => B(3),
      I4 => Zero_INST_0_i_89_n_0,
      O => Zero_INST_0_i_45_n_0
    );
Zero_INST_0_i_46: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => B(13),
      I1 => A(13),
      I2 => B(12),
      I3 => A(12),
      O => Zero_INST_0_i_46_n_0
    );
Zero_INST_0_i_47: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => A(10),
      I1 => B(10),
      I2 => A(11),
      I3 => B(11),
      I4 => Zero_INST_0_i_90_n_0,
      O => Zero_INST_0_i_47_n_0
    );
Zero_INST_0_i_48: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Zero_INST_0_i_91_n_0,
      I1 => B(23),
      I2 => A(23),
      I3 => B(22),
      I4 => A(22),
      I5 => Zero_INST_0_i_92_n_0,
      O => Zero_INST_0_i_48_n_0
    );
Zero_INST_0_i_49: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Zero_INST_0_i_93_n_0,
      I1 => B(30),
      I2 => A(30),
      I3 => B(31),
      I4 => A(31),
      I5 => Zero_INST_0_i_94_n_0,
      O => Zero_INST_0_i_49_n_0
    );
Zero_INST_0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFE"
    )
        port map (
      I0 => Zero_INST_0_i_24_n_0,
      I1 => Zero_INST_0_i_25_n_0,
      I2 => B(22),
      I3 => A(22),
      I4 => Zero_INST_0_i_26_n_0,
      I5 => Zero_INST_0_i_27_n_0,
      O => Zero_INST_0_i_5_n_0
    );
Zero_INST_0_i_50: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Zero_INST_0_i_95_n_0,
      I1 => B(7),
      I2 => A(7),
      I3 => B(6),
      I4 => A(6),
      I5 => Zero_INST_0_i_96_n_0,
      O => Zero_INST_0_i_50_n_0
    );
Zero_INST_0_i_51: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Zero_INST_0_i_97_n_0,
      I1 => B(15),
      I2 => A(15),
      I3 => B(14),
      I4 => A(14),
      I5 => Zero_INST_0_i_98_n_0,
      O => Zero_INST_0_i_51_n_0
    );
Zero_INST_0_i_52: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFCA"
    )
        port map (
      I0 => \Result[22]_INST_0_i_4_n_0\,
      I1 => \Result[20]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[21]_INST_0_i_4_n_0\,
      I4 => \Result[31]_INST_0_i_7_n_0\,
      I5 => Zero_INST_0_i_99_n_0,
      O => Zero_INST_0_i_52_n_0
    );
Zero_INST_0_i_53: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[23]_INST_0_i_5_n_0\,
      I1 => A(0),
      I2 => \Result[24]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_53_n_0
    );
Zero_INST_0_i_54: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[22]_INST_0_i_4_n_0\,
      I1 => A(0),
      I2 => \Result[23]_INST_0_i_5_n_0\,
      O => Zero_INST_0_i_54_n_0
    );
Zero_INST_0_i_55: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => Zero_INST_0_i_100_n_0,
      I1 => A(31),
      I2 => A(29),
      I3 => A(30),
      I4 => \Result[31]_INST_0_i_6_n_0\,
      I5 => \Result[31]_INST_0_i_5_n_0\,
      O => Zero_INST_0_i_55_n_0
    );
Zero_INST_0_i_56: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFCA"
    )
        port map (
      I0 => \Result[18]_INST_0_i_4_n_0\,
      I1 => \Result[16]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[17]_INST_0_i_4_n_0\,
      I4 => \Result[31]_INST_0_i_7_n_0\,
      I5 => Zero_INST_0_i_99_n_0,
      O => Zero_INST_0_i_56_n_0
    );
Zero_INST_0_i_57: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFCA"
    )
        port map (
      I0 => \Result[20]_INST_0_i_4_n_0\,
      I1 => \Result[18]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[19]_INST_0_i_5_n_0\,
      I4 => \Result[31]_INST_0_i_7_n_0\,
      I5 => Zero_INST_0_i_99_n_0,
      O => Zero_INST_0_i_57_n_0
    );
Zero_INST_0_i_58: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010000000100"
    )
        port map (
      I0 => \Result[31]_INST_0_i_5_n_0\,
      I1 => \Result[31]_INST_0_i_6_n_0\,
      I2 => \Result[31]_INST_0_i_7_n_0\,
      I3 => \Result[30]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[29]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_58_n_0
    );
Zero_INST_0_i_59: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010000000100"
    )
        port map (
      I0 => \Result[31]_INST_0_i_5_n_0\,
      I1 => \Result[31]_INST_0_i_6_n_0\,
      I2 => \Result[31]_INST_0_i_7_n_0\,
      I3 => \Result[29]_INST_0_i_4_n_0\,
      I4 => A(0),
      I5 => \Result[28]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_59_n_0
    );
Zero_INST_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFBE"
    )
        port map (
      I0 => Zero_INST_0_i_28_n_0,
      I1 => B(30),
      I2 => A(30),
      I3 => Zero_INST_0_i_29_n_0,
      I4 => Zero_INST_0_i_30_n_0,
      I5 => Zero_INST_0_i_31_n_0,
      O => Zero_INST_0_i_6_n_0
    );
Zero_INST_0_i_60: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010000000100"
    )
        port map (
      I0 => \Result[31]_INST_0_i_5_n_0\,
      I1 => \Result[31]_INST_0_i_6_n_0\,
      I2 => \Result[31]_INST_0_i_7_n_0\,
      I3 => \Result[31]_INST_0_i_9_n_0\,
      I4 => A(0),
      I5 => \Result[30]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_60_n_0
    );
Zero_INST_0_i_61: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFCA"
    )
        port map (
      I0 => \Result[26]_INST_0_i_4_n_0\,
      I1 => \Result[24]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[25]_INST_0_i_4_n_0\,
      I4 => \Result[31]_INST_0_i_7_n_0\,
      I5 => Zero_INST_0_i_99_n_0,
      O => Zero_INST_0_i_61_n_0
    );
Zero_INST_0_i_62: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFCA"
    )
        port map (
      I0 => \Result[28]_INST_0_i_4_n_0\,
      I1 => \Result[26]_INST_0_i_4_n_0\,
      I2 => A(0),
      I3 => \Result[27]_INST_0_i_5_n_0\,
      I4 => \Result[31]_INST_0_i_7_n_0\,
      I5 => Zero_INST_0_i_99_n_0,
      O => Zero_INST_0_i_62_n_0
    );
Zero_INST_0_i_63: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[5]_INST_0_i_4_n_0\,
      I1 => A(0),
      I2 => \Result[6]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_63_n_0
    );
Zero_INST_0_i_64: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[4]_INST_0_i_4_n_0\,
      I1 => A(0),
      I2 => \Result[5]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_64_n_0
    );
Zero_INST_0_i_65: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \Result[7]_INST_0_i_5_n_0\,
      I1 => \Result[7]_INST_0_i_6_n_0\,
      I2 => A(0),
      I3 => Zero_INST_0_i_101_n_0,
      I4 => A(1),
      I5 => Zero_INST_0_i_102_n_0,
      O => Zero_INST_0_i_65_n_0
    );
Zero_INST_0_i_66: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00B8B8"
    )
        port map (
      I0 => \Result[7]_INST_0_i_5_n_0\,
      I1 => A(1),
      I2 => \Result[7]_INST_0_i_6_n_0\,
      I3 => \Result[6]_INST_0_i_4_n_0\,
      I4 => A(0),
      O => Zero_INST_0_i_66_n_0
    );
Zero_INST_0_i_67: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F000F000F000E"
    )
        port map (
      I0 => Zero_INST_0_i_103_n_0,
      I1 => Zero_INST_0_i_104_n_0,
      I2 => Zero_INST_0_i_99_n_0,
      I3 => \Result[31]_INST_0_i_7_n_0\,
      I4 => Zero_INST_0_i_105_n_0,
      I5 => Zero_INST_0_i_106_n_0,
      O => Zero_INST_0_i_67_n_0
    );
Zero_INST_0_i_68: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[13]_INST_0_i_4_n_0\,
      I1 => A(0),
      I2 => \Result[14]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_68_n_0
    );
Zero_INST_0_i_69: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[12]_INST_0_i_4_n_0\,
      I1 => A(0),
      I2 => \Result[13]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_69_n_0
    );
Zero_INST_0_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFE"
    )
        port map (
      I0 => Zero_INST_0_i_32_n_0,
      I1 => Zero_INST_0_i_33_n_0,
      I2 => B(6),
      I3 => A(6),
      I4 => Zero_INST_0_i_34_n_0,
      I5 => Zero_INST_0_i_35_n_0,
      O => Zero_INST_0_i_7_n_0
    );
Zero_INST_0_i_70: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[15]_INST_0_i_5_n_0\,
      I1 => A(0),
      I2 => \Result[16]_INST_0_i_4_n_0\,
      O => Zero_INST_0_i_70_n_0
    );
Zero_INST_0_i_71: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \Result[14]_INST_0_i_4_n_0\,
      I1 => A(0),
      I2 => \Result[15]_INST_0_i_5_n_0\,
      O => Zero_INST_0_i_71_n_0
    );
Zero_INST_0_i_72: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F000F000F000E"
    )
        port map (
      I0 => Zero_INST_0_i_107_n_0,
      I1 => Zero_INST_0_i_108_n_0,
      I2 => Zero_INST_0_i_99_n_0,
      I3 => \Result[31]_INST_0_i_7_n_0\,
      I4 => Zero_INST_0_i_109_n_0,
      I5 => Zero_INST_0_i_110_n_0,
      O => Zero_INST_0_i_72_n_0
    );
Zero_INST_0_i_79: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Result[27]_INST_0_i_3_n_6\,
      I1 => \Result[27]_INST_0_i_3_n_7\,
      I2 => \Result[27]_INST_0_i_3_n_4\,
      I3 => \Result[27]_INST_0_i_3_n_5\,
      O => Zero_INST_0_i_79_n_0
    );
Zero_INST_0_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFE"
    )
        port map (
      I0 => Zero_INST_0_i_36_n_0,
      I1 => Zero_INST_0_i_37_n_0,
      I2 => B(14),
      I3 => A(14),
      I4 => Zero_INST_0_i_38_n_0,
      I5 => Zero_INST_0_i_39_n_0,
      O => Zero_INST_0_i_8_n_0
    );
Zero_INST_0_i_80: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \Result[31]_INST_0_i_4_n_5\,
      I1 => data0,
      I2 => \Result[31]_INST_0_i_4_n_6\,
      I3 => \Result[31]_INST_0_i_4_n_7\,
      O => Zero_INST_0_i_80_n_0
    );
Zero_INST_0_i_81: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \Result[23]_INST_0_i_4_n_4\,
      I1 => \Result[23]_INST_0_i_4_n_5\,
      I2 => \Result[23]_INST_0_i_4_n_6\,
      I3 => \Result[23]_INST_0_i_4_n_7\,
      O => Zero_INST_0_i_81_n_0
    );
Zero_INST_0_i_82: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \Result[19]_INST_0_i_3_n_4\,
      I1 => \Result[19]_INST_0_i_3_n_5\,
      I2 => \Result[19]_INST_0_i_3_n_6\,
      I3 => \Result[19]_INST_0_i_3_n_7\,
      O => Zero_INST_0_i_82_n_0
    );
Zero_INST_0_i_83: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Result[3]_INST_0_i_3_n_6\,
      I1 => \Result[3]_INST_0_i_3_n_7\,
      I2 => \Result[3]_INST_0_i_3_n_4\,
      I3 => \Result[3]_INST_0_i_3_n_5\,
      O => Zero_INST_0_i_83_n_0
    );
Zero_INST_0_i_84: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \Result[7]_INST_0_i_4_n_4\,
      I1 => \Result[7]_INST_0_i_4_n_5\,
      I2 => \Result[7]_INST_0_i_4_n_6\,
      I3 => \Result[7]_INST_0_i_4_n_7\,
      O => Zero_INST_0_i_84_n_0
    );
Zero_INST_0_i_85: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Result[11]_INST_0_i_3_n_6\,
      I1 => \Result[11]_INST_0_i_3_n_7\,
      I2 => \Result[11]_INST_0_i_3_n_4\,
      I3 => \Result[11]_INST_0_i_3_n_5\,
      O => Zero_INST_0_i_85_n_0
    );
Zero_INST_0_i_86: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \Result[15]_INST_0_i_4_n_4\,
      I1 => \Result[15]_INST_0_i_4_n_5\,
      I2 => \Result[15]_INST_0_i_4_n_6\,
      I3 => \Result[15]_INST_0_i_4_n_7\,
      O => Zero_INST_0_i_86_n_0
    );
Zero_INST_0_i_87: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => B(17),
      I1 => A(17),
      I2 => B(16),
      I3 => A(16),
      O => Zero_INST_0_i_87_n_0
    );
Zero_INST_0_i_88: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => B(25),
      I1 => A(25),
      I2 => B(24),
      I3 => A(24),
      O => Zero_INST_0_i_88_n_0
    );
Zero_INST_0_i_89: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => B(1),
      I1 => A(1),
      I2 => B(0),
      I3 => A(0),
      O => Zero_INST_0_i_89_n_0
    );
Zero_INST_0_i_90: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => B(9),
      I1 => A(9),
      I2 => B(8),
      I3 => A(8),
      O => Zero_INST_0_i_90_n_0
    );
Zero_INST_0_i_91: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => B(21),
      I1 => A(21),
      I2 => B(20),
      I3 => A(20),
      O => Zero_INST_0_i_91_n_0
    );
Zero_INST_0_i_92: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => A(18),
      I1 => B(18),
      I2 => A(19),
      I3 => B(19),
      I4 => Zero_INST_0_i_111_n_0,
      O => Zero_INST_0_i_92_n_0
    );
Zero_INST_0_i_93: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => B(29),
      I1 => A(29),
      I2 => B(28),
      I3 => A(28),
      O => Zero_INST_0_i_93_n_0
    );
Zero_INST_0_i_94: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => A(26),
      I1 => B(26),
      I2 => A(27),
      I3 => B(27),
      I4 => Zero_INST_0_i_112_n_0,
      O => Zero_INST_0_i_94_n_0
    );
Zero_INST_0_i_95: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => B(5),
      I1 => A(5),
      I2 => B(4),
      I3 => A(4),
      O => Zero_INST_0_i_95_n_0
    );
Zero_INST_0_i_96: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => A(2),
      I1 => B(2),
      I2 => A(3),
      I3 => B(3),
      I4 => Zero_INST_0_i_113_n_0,
      O => Zero_INST_0_i_96_n_0
    );
Zero_INST_0_i_97: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => B(13),
      I1 => A(13),
      I2 => B(12),
      I3 => A(12),
      O => Zero_INST_0_i_97_n_0
    );
Zero_INST_0_i_98: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => A(10),
      I1 => B(10),
      I2 => A(11),
      I3 => B(11),
      I4 => Zero_INST_0_i_114_n_0,
      O => Zero_INST_0_i_98_n_0
    );
Zero_INST_0_i_99: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \Result[31]_INST_0_i_14_n_0\,
      I1 => Zero_INST_0_i_115_n_0,
      I2 => \Result[31]_INST_0_i_15_n_0\,
      I3 => Zero_INST_0_i_116_n_0,
      O => Zero_INST_0_i_99_n_0
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ALU
     port map (
      A(31 downto 0) => A(31 downto 0),
      \A[14]_0\ => \Result[1]_INST_0_i_2_n_0\,
      \A[14]_1\ => \Result[2]_INST_0_i_2_n_0\,
      \A[14]_10\ => \Result[11]_INST_0_i_2_n_0\,
      \A[14]_11\ => \Result[12]_INST_0_i_3_n_0\,
      \A[14]_12\ => \Result[13]_INST_0_i_3_n_0\,
      \A[14]_13\ => \Result[14]_INST_0_i_3_n_0\,
      \A[14]_14\ => \Result[15]_INST_0_i_3_n_0\,
      \A[14]_15\ => \Result[16]_INST_0_i_2_n_0\,
      \A[14]_16\ => \Result[17]_INST_0_i_2_n_0\,
      \A[14]_17\ => \Result[18]_INST_0_i_2_n_0\,
      \A[14]_18\ => \Result[19]_INST_0_i_2_n_0\,
      \A[14]_19\ => \Result[20]_INST_0_i_2_n_0\,
      \A[14]_2\ => \Result[3]_INST_0_i_2_n_0\,
      \A[14]_20\ => \Result[21]_INST_0_i_2_n_0\,
      \A[14]_21\ => \Result[22]_INST_0_i_3_n_0\,
      \A[14]_22\ => \Result[23]_INST_0_i_3_n_0\,
      \A[14]_23\ => \Result[24]_INST_0_i_2_n_0\,
      \A[14]_24\ => \Result[25]_INST_0_i_2_n_0\,
      \A[14]_25\ => \Result[26]_INST_0_i_2_n_0\,
      \A[14]_26\ => \Result[27]_INST_0_i_2_n_0\,
      \A[14]_27\ => \Result[28]_INST_0_i_2_n_0\,
      \A[14]_28\ => \Result[29]_INST_0_i_2_n_0\,
      \A[14]_29\ => \Result[30]_INST_0_i_2_n_0\,
      \A[14]_3\ => \Result[4]_INST_0_i_3_n_0\,
      \A[14]_4\ => \Result[5]_INST_0_i_3_n_0\,
      \A[14]_5\ => \Result[6]_INST_0_i_3_n_0\,
      \A[14]_6\ => \Result[7]_INST_0_i_3_n_0\,
      \A[14]_7\ => \Result[8]_INST_0_i_2_n_0\,
      \A[14]_8\ => \Result[9]_INST_0_i_2_n_0\,
      \A[14]_9\ => \Result[10]_INST_0_i_2_n_0\,
      \A_0__s_port_\ => Zero_INST_0_i_12_n_0,
      \A_10__s_port_\ => Zero_INST_0_i_8_n_0,
      \A_14__s_port_\ => \Result[0]_INST_0_i_3_n_0\,
      \A_16__s_port_\ => Zero_INST_0_i_10_n_0,
      \A_18__s_port_\ => Zero_INST_0_i_5_n_0,
      \A_24__s_port_\ => Zero_INST_0_i_11_n_0,
      \A_26__s_port_\ => Zero_INST_0_i_6_n_0,
      \A_2__s_port_\ => Zero_INST_0_i_7_n_0,
      \A_4__s_port_\ => Zero_INST_0_i_3_n_0,
      \A_8__s_port_\ => Zero_INST_0_i_13_n_0,
      AluOp(2 downto 0) => AluOp(2 downto 0),
      B(31 downto 0) => B(31 downto 0),
      \B[0]\(3) => \Result[3]_INST_0_i_3_n_4\,
      \B[0]\(2) => \Result[3]_INST_0_i_3_n_5\,
      \B[0]\(1) => \Result[3]_INST_0_i_3_n_6\,
      \B[0]\(0) => \Result[3]_INST_0_i_3_n_7\,
      \B[0]_0\(3) => \Result[7]_INST_0_i_4_n_4\,
      \B[0]_0\(2) => \Result[7]_INST_0_i_4_n_5\,
      \B[0]_0\(1) => \Result[7]_INST_0_i_4_n_6\,
      \B[0]_0\(0) => \Result[7]_INST_0_i_4_n_7\,
      \B[0]_1\(3) => \Result[11]_INST_0_i_3_n_4\,
      \B[0]_1\(2) => \Result[11]_INST_0_i_3_n_5\,
      \B[0]_1\(1) => \Result[11]_INST_0_i_3_n_6\,
      \B[0]_1\(0) => \Result[11]_INST_0_i_3_n_7\,
      \B[0]_2\(3) => \Result[15]_INST_0_i_4_n_4\,
      \B[0]_2\(2) => \Result[15]_INST_0_i_4_n_5\,
      \B[0]_2\(1) => \Result[15]_INST_0_i_4_n_6\,
      \B[0]_2\(0) => \Result[15]_INST_0_i_4_n_7\,
      \B[0]_3\(3) => \Result[19]_INST_0_i_3_n_4\,
      \B[0]_3\(2) => \Result[19]_INST_0_i_3_n_5\,
      \B[0]_3\(1) => \Result[19]_INST_0_i_3_n_6\,
      \B[0]_3\(0) => \Result[19]_INST_0_i_3_n_7\,
      \B[0]_4\(3) => \Result[23]_INST_0_i_4_n_4\,
      \B[0]_4\(2) => \Result[23]_INST_0_i_4_n_5\,
      \B[0]_4\(1) => \Result[23]_INST_0_i_4_n_6\,
      \B[0]_4\(0) => \Result[23]_INST_0_i_4_n_7\,
      \B[0]_5\(3) => \Result[27]_INST_0_i_3_n_4\,
      \B[0]_5\(2) => \Result[27]_INST_0_i_3_n_5\,
      \B[0]_5\(1) => \Result[27]_INST_0_i_3_n_6\,
      \B[0]_5\(0) => \Result[27]_INST_0_i_3_n_7\,
      \B[0]_6\ => Zero_INST_0_i_22_n_0,
      \B[12]_0\ => Zero_INST_0_i_23_n_0,
      \B_12__s_port_\ => \Result[12]_INST_0_i_2_n_0\,
      \B_13__s_port_\ => \Result[13]_INST_0_i_2_n_0\,
      \B_14__s_port_\ => \Result[14]_INST_0_i_2_n_0\,
      \B_15__s_port_\ => \Result[15]_INST_0_i_2_n_0\,
      \B_22__s_port_\ => \Result[22]_INST_0_i_2_n_0\,
      \B_23__s_port_\ => \Result[23]_INST_0_i_2_n_0\,
      \B_4__s_port_\ => \Result[4]_INST_0_i_2_n_0\,
      \B_5__s_port_\ => \Result[5]_INST_0_i_2_n_0\,
      \B_6__s_port_\ => \Result[6]_INST_0_i_2_n_0\,
      \B_7__s_port_\ => \Result[7]_INST_0_i_2_n_0\,
      O(3) => data0,
      O(2) => \Result[31]_INST_0_i_4_n_5\,
      O(1) => \Result[31]_INST_0_i_4_n_6\,
      O(0) => \Result[31]_INST_0_i_4_n_7\,
      Result(31) => \^sign\,
      Result(30 downto 0) => \^result\(30 downto 0),
      Zero => Zero,
      data2 => data2,
      p_4_in => p_4_in
    );
end STRUCTURE;
