###############################################################################################
# Company:		Xilinx Inc.
# 
# Create Date:		2/11/2014
# 
# Module Name:		ug480_setup.tcl
# Project Name: 		ug480
# Target Devices:		7 Series
# Tool versions:		2014.1
# Description: 		This example TCL script adds the following TCL commands to be used with
#                     the attached design files.
#                        ug480_create_project - Creates/overwrites ug480_xadc.xpr project    
#                        ug480_run_project    - Opens and runs ug480_xadc.xpr project        
#                        ug480_sim_project    - Performs behavioral simulation 
#                                                         
#                                                          
# Dependencies: 
#
# Revision:		2.0 Updated example design file and adding ug480_setup.tcl for Vivado
#
###############################################################################################

proc ug480_create_project {} {
#######################################
#   "create_project" creates a Vivado #
#   a project for the UltraScale      #
#   System Monitor (XADC)         #
#                                     #
#   Adjust device, package, and XDC   #
#   as needed.                        #
#                                     #
#   "ug480_create_project" completely #
#   rebuilds the project. Previous    #
#   work will be lost.                #
#                                     #
#######################################

create_project ug480_XADC  -force ug480_XADC -part xc7k325tffg900-2
add_files -norecurse {ug480.v ug480.xdc}
import_files -force -norecurse
import_files -fileset sim_1 -norecurse {design.txt ug480_tb.v}
update_compile_order -fileset sim_1
}

proc ug480_run_project {} {
if [string is alnum [current_project -quiet]] then {open_project ./ug480_XADC  /ug480_xadc.xpr} else {puts "project is [current_project]"}

reset_run -quiet synth_1
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1
wait_on_run impl_1
}

proc ug480_sim_project {} {
if [string is alnum [current_project -quiet]] then {open_project ./ug480_XADC/ug480_xadc.xpr} else {puts "project is [current_project]"}
if [string is alnum [current_sim -quiet]] then {} else {close_sim}
set_property xsim.view {ug480_tb.wcfg} [get_filesets sim_1]
launch_xsim -simset sim_1 -mode behavioral
run 150 us
}

puts {################################################################################################
#   TCL script sets up the following commands:                                                 #
#     ug480_create_project - Creates/overwrites ./ug480_xadc/ug480_xadc.xpr project    #
#     ug480_run_project    - Opens and runs ./ug480_xadc/ug480_xadc.xpr project        #
#     ug480_sim_project    - Performs behavioral simulation using the testbench and design.txt #
#                                                                                              #
#   NOTE "ug480_create_project" completely rebuilds the project. Previous work will be lost.   #
################################################################################################
}
