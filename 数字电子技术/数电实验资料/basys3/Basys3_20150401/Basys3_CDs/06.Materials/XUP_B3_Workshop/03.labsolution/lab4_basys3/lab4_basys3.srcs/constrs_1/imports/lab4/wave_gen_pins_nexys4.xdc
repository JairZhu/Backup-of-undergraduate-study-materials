# Nexys4 xdc
# LED [7:0]
############################
# On-board led             #
############################
set_property PACKAGE_PIN H17 [get_ports {led_pins[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[0]}]
set_property PACKAGE_PIN K15 [get_ports {led_pins[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[1]}]
set_property PACKAGE_PIN J13 [get_ports {led_pins[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[2]}]
set_property PACKAGE_PIN N14 [get_ports {led_pins[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[3]}]
set_property PACKAGE_PIN R18 [get_ports {led_pins[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[4]}]
set_property PACKAGE_PIN V17 [get_ports {led_pins[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[5]}]
set_property PACKAGE_PIN U17 [get_ports {led_pins[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[6]}]
set_property PACKAGE_PIN U16 [get_ports {led_pins[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[7]}]

# CLK source 100 MHz
set_property PACKAGE_PIN E3 [get_ports clk_pin]
set_property IOSTANDARD LVCMOS33 [get_ports clk_pin]

# SW0
set_property PACKAGE_PIN J15 [get_ports lb_sel_pin]
set_property IOSTANDARD LVCMOS33 [get_ports lb_sel_pin]

# RXD UART 
set_property PACKAGE_PIN C4 [get_ports rxd_pin]
set_property IOSTANDARD LVCMOS33 [get_ports rxd_pin]

# TXD UART 
set_property PACKAGE_PIN D4 [get_ports txd_pin]
set_property IOSTANDARD LVCMOS33 [get_ports txd_pin]

# Reset - BTNC
set_property PACKAGE_PIN N17 [get_ports rst_pin]
set_property IOSTANDARD LVCMOS33 [get_ports rst_pin]

# dac_clr_n_pin - JB PMOD connector Pin 1, just a placeholder
# Use appropriate pin when SPI DAC is available
set_property LOC K2 [get_ports dac_clr_n_pin]
set_property IOSTANDARD LVCMOS33 [get_ports dac_clr_n_pin]

# dac_cs_n_pin - - JB PMOD connector Pin 2, just a placeholder
# Use appropriate pin when SPI DAC is available
set_property LOC E7 [get_ports dac_cs_n_pin]
set_property IOSTANDARD LVCMOS33 [get_ports dac_cs_n_pin]

# spi_clk_pin - - JB PMOD connector Pin 3, just a placeholdere
# Use appropriate pin when SPI DAC is available
set_property LOC J3 [get_ports spi_clk_pin]
set_property IOSTANDARD LVCMOS33 [get_ports spi_clk_pin]

# spi_mosi_pin - - JB PMOD connector Pin 4, just a placeholder
# Use appropriate pin when SPI DAC is available
set_property LOC J4 [get_ports spi_mosi_pin]
set_property IOSTANDARD LVCMOS33 [get_ports spi_mosi_pin]

set_property IOB TRUE [all_fanin -only_cells -startpoints_only -flat [all_outputs]]



