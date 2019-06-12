-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Wed Nov 15 23:44:02 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_ControlUnit_0_0/design_1_ControlUnit_0_0_stub.vhdl
-- Design      : design_1_ControlUnit_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ControlUnit_0_0 is
  Port ( 
    op : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Zero : in STD_LOGIC;
    Sign : in STD_LOGIC;
    ExtSel : out STD_LOGIC;
    PCWre : out STD_LOGIC;
    InsMemRW : out STD_LOGIC;
    RegDst : out STD_LOGIC;
    RegWre : out STD_LOGIC;
    AluOp : out STD_LOGIC_VECTOR ( 2 downto 0 );
    AluSrcA : out STD_LOGIC;
    AluSrcB : out STD_LOGIC;
    RD : out STD_LOGIC;
    WR : out STD_LOGIC;
    DBDataSrc : out STD_LOGIC;
    PCSrc : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end design_1_ControlUnit_0_0;

architecture stub of design_1_ControlUnit_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "op[5:0],Zero,Sign,ExtSel,PCWre,InsMemRW,RegDst,RegWre,AluOp[2:0],AluSrcA,AluSrcB,RD,WR,DBDataSrc,PCSrc[1:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ControlUnit,Vivado 2016.4";
begin
end;
