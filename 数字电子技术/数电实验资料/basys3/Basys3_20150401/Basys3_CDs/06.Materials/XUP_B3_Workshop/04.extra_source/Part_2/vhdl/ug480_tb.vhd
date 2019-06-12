-------------------------------------------------------------------------------
--    
--    Company:          Xilinx
--    Engineer:         Jim Tatsukawa
--    Date:             2/10/2014
--    Design Name:      ug480_tb
--    Module Name:      ug480_tb.vhd
--    Version:          2.0 - Initial self contained design
--    Target Devices:   7 Series Family
--    Tool versions:    2014.1
--    Description:      This is a basic demonstration of the XADC
-- 
--    Disclaimer:  XILINX IS PROVIDING THIS DESIGN, CODE, OR
--                 INFORMATION "AS IS" SOLELY FOR USE IN DEVELOPING
--                 PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY
--                 PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
--                 ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
--                 APPLICATION OR STANDARD, XILINX IS MAKING NO
--                 REPRESENTATION THAT THIS IMPLEMENTATION IS FREE
--                 FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE
--                 RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY
--                 REQUIRE FOR YOUR IMPLEMENTATION.  XILINX
--                 EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH
--                 RESPECT TO THE ADEQUACY OF THE IMPLEMENTATION,
--                 INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
--                 REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
--                 FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES
--                 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
--                 PURPOSE.
 
--                 (c) Copyright 2013-2014 Xilinx, Inc.
--                 All rights reserved.
 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
library std;
use std.textio.all;
library work;
use work.all;

Library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity ug480_tb is
end entity ug480_tb;

architecture tb of ug480_tb is
    signal DCLK               : STD_LOGIC :='0'; 
    signal RESET              : STD_LOGIC :='0';
    signal MEASURED_TEMP      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_VCCAUX    : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_VCCINT    : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_VCCBRAM   : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_AUX0      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_AUX1      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_AUX2      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_AUX3      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
   
    signal ALM                : STD_LOGIC_VECTOR (7 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal CHANNEL            : STD_LOGIC_VECTOR (4 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal OT                 : STD_LOGIC;   -- Output data bus for dynamic reconfiguration port
    signal EOC         : STD_LOGIC;   -- Output data bus for dynamic reconfiguration port
    signal EOS         : STD_LOGIC;   -- Output data bus for dynamic reconfiguration port
    signal VP                  : STD_LOGIC;
    signal VN                  : STD_LOGIC;

    component ug480
        port
        (
         DCLK               : in  STD_LOGIC;                         -- Clock input for the dynamic reconfiguration port
         RESET              : in  STD_LOGIC;                         -- Reset signal for the System Monitor control logic
         VAUXP, VAUXN       : in  STD_LOGIC_VECTOR (3 downto 0);     -- Input data bus for the dynamic reconfiguration port
         VP, VN             : in  STD_LOGIC;                         -- Clock input for the dynamic reconfiguration port
        
         MEASURED_TEMP      : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
         MEASURED_VCCAUX    : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
         MEASURED_VCCINT    : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
         MEASURED_VCCBRAM   : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
         MEASURED_AUX0      : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
         MEASURED_AUX1      : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
         MEASURED_AUX2      : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
         MEASURED_AUX3      : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
        
         ALM                : out  STD_LOGIC_VECTOR (7 downto 0);   -- Output data bus for dynamic reconfiguration port
         CHANNEL            : out  STD_LOGIC_VECTOR (4 downto 0);   -- Output data bus for dynamic reconfiguration port
         OT                 : out  STD_LOGIC;   -- Output data bus for dynamic reconfiguration port
         EOC         : out  STD_LOGIC;   -- Output data bus for dynamic reconfiguration port
         EOS         : out  STD_LOGIC   -- Output data bus for dynamic reconfiguration port
        );
    end component;

begin
   ug480_inst : ug480
   port map(
        DCLK                => DCLK,
        RESET               => RESET,
        VAUXP               => "0000", -- unused during simulation
        VAUXN               => "0000", -- unused during simulation
        VP                  => '0', -- unused during simulation
        VN                  => '0', -- unused during simulation
    
        MEASURED_TEMP       => MEASURED_TEMP,   
        MEASURED_VCCAUX     => MEASURED_VCCAUX,   
        MEASURED_VCCINT     => MEASURED_VCCINT,
        MEASURED_VCCBRAM    => MEASURED_VCCBRAM,
        MEASURED_AUX0       => MEASURED_AUX0,
        MEASURED_AUX1       => MEASURED_AUX1,
        MEASURED_AUX2       => MEASURED_AUX2,
        MEASURED_AUX3       => MEASURED_AUX3,
    
        ALM                 => ALM,               
        CHANNEL             => CHANNEL,
        OT                  => OT,
        EOC                 => EOC,
        EOS                 => EOS
   );

   DCLK <= not DCLK after 10 ns;
end architecture tb;

