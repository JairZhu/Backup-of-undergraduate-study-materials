-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Fri Nov 17 00:08:00 2017
-- Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_InsMemory_0_0/design_1_InsMemory_0_0_stub.vhdl
-- Design      : design_1_InsMemory_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_InsMemory_0_0 is
  Port ( 
    IAddress : in STD_LOGIC_VECTOR ( 31 downto 0 );
    InsMemRW : in STD_LOGIC;
    op : out STD_LOGIC_VECTOR ( 5 downto 0 );
    rs : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rt : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rd : out STD_LOGIC_VECTOR ( 4 downto 0 );
    immediate : out STD_LOGIC_VECTOR ( 15 downto 0 );
    AJshift : out STD_LOGIC_VECTOR ( 25 downto 0 );
    sa : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end design_1_InsMemory_0_0;

architecture stub of design_1_InsMemory_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "IAddress[31:0],InsMemRW,op[5:0],rs[4:0],rt[4:0],rd[4:0],immediate[15:0],AJshift[25:0],sa[4:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "InsMemory,Vivado 2016.4";
begin
end;
