# Basys3 xdc
# LED [7:0]
############################
# On-board led             #
############################
set_property PACKAGE_PIN U16 [get_ports led_pins[0]]
set_property IOSTANDARD LVCMOS33 [get_ports led_pins[0]]
set_property PACKAGE_PIN E19 [get_ports led_pins[1]]
set_property IOSTANDARD LVCMOS33 [get_ports led_pins[1]]
set_property PACKAGE_PIN U19 [get_ports led_pins[2]]
set_property IOSTANDARD LVCMOS33 [get_ports led_pins[2]]
set_property PACKAGE_PIN V19 [get_ports led_pins[3]]
set_property IOSTANDARD LVCMOS33 [get_ports led_pins[3]]
set_property PACKAGE_PIN W18 [get_ports led_pins[4]]
set_property IOSTANDARD LVCMOS33 [get_ports led_pins[4]]
set_property PACKAGE_PIN U15 [get_ports led_pins[5]]
set_property IOSTANDARD LVCMOS33 [get_ports led_pins[5]]
set_property PACKAGE_PIN U14 [get_ports led_pins[6]]
set_property IOSTANDARD LVCMOS33 [get_ports led_pins[6]]
set_property PACKAGE_PIN V14 [get_ports led_pins[7]]
set_property IOSTANDARD LVCMOS33 [get_ports led_pins[7]]

# CLK source 100 MHz
set_property PACKAGE_PIN W5 [get_ports clk_pin]
set_property IOSTANDARD LVCMOS33 [get_ports clk_pin]

# BTNU
set_property PACKAGE_PIN T18 [get_ports btn_pin]
set_property IOSTANDARD LVCMOS33 [get_ports btn_pin]

# RXD UART JA2 on Basys3
set_property PACKAGE_PIN L2 [get_ports rxd_pin]
set_property IOSTANDARD LVCMOS33 [get_ports rxd_pin]

# Reset - BTNC
set_property PACKAGE_PIN U18 [get_ports rst_pin]
set_property IOSTANDARD LVCMOS33 [get_ports rst_pin]




## Nexys4 xdc
## LED [7:0]
############################
## On-board led             #
############################
#set_property PACKAGE_PIN T8 [get_ports led_pins[0]]
#set_property IOSTANDARD LVCMOS33 [get_ports led_pins[0]]
#set_property PACKAGE_PIN V9 [get_ports led_pins[1]]
#set_property IOSTANDARD LVCMOS33 [get_ports led_pins[1]]
#set_property PACKAGE_PIN R8 [get_ports led_pins[2]]
#set_property IOSTANDARD LVCMOS33 [get_ports led_pins[2]]
#set_property PACKAGE_PIN T6 [get_ports led_pins[3]]
#set_property IOSTANDARD LVCMOS33 [get_ports led_pins[3]]
#set_property PACKAGE_PIN T5 [get_ports led_pins[4]]
#set_property IOSTANDARD LVCMOS33 [get_ports led_pins[4]]
#set_property PACKAGE_PIN T4 [get_ports led_pins[5]]
#set_property IOSTANDARD LVCMOS33 [get_ports led_pins[5]]
#set_property PACKAGE_PIN U7 [get_ports led_pins[6]]
#set_property IOSTANDARD LVCMOS33 [get_ports led_pins[6]]
#set_property PACKAGE_PIN U6 [get_ports led_pins[7]]
#set_property IOSTANDARD LVCMOS33 [get_ports led_pins[7]]

## CLK source 100 MHz
#set_property PACKAGE_PIN E3 [get_ports clk_pin]
#set_property IOSTANDARD LVCMOS33 [get_ports clk_pin]

## BTNU
#set_property PACKAGE_PIN F15 [get_ports btn_pin]
#set_property IOSTANDARD LVCMOS33 [get_ports btn_pin]

## RXD UART 
#set_property PACKAGE_PIN C4 [get_ports rxd_pin]
#set_property IOSTANDARD LVCMOS33 [get_ports rxd_pin]

## Reset - BTNC
#set_property PACKAGE_PIN E16 [get_ports rst_pin]
#set_property IOSTANDARD LVCMOS33 [get_ports rst_pin]


