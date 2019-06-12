
##
## Create Clock Constraints on BSCAN ports DRCK & UPDATE
##
create_clock -period 30 [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/DRCK]
create_clock -period 60 [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/UPDATE]

##
## Timing Exceptions on DRCK & UPDATE clocks
##
set_false_path -through [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/SHIFT]

set_multicycle_path -setup 2 -from [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/UPDATE]] -to [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/DRCK]]
set_multicycle_path -hold 1 -from [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/UPDATE]] -to [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/DRCK]]

set_clock_groups -asynchronous -group  [list [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/DRCK]] [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/UPDATE]]]
