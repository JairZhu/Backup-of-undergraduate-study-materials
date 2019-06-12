
################################################################
# This is a generated script based on design: sy9
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source sy9_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name sy9

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set CLK1 [ create_bd_port -dir I CLK1 ]
  set CLR1_n [ create_bd_port -dir I CLR1_n ]
  set D [ create_bd_port -dir I D ]
  set J1 [ create_bd_port -dir I J1 ]
  set PR1_n [ create_bd_port -dir I PR1_n ]
  set Q1 [ create_bd_port -dir O Q1 ]
  set Q2 [ create_bd_port -dir O Q2 ]
  set Q3 [ create_bd_port -dir O Q3 ]
  set Q4 [ create_bd_port -dir O Q4 ]

  # Create instance: D_FlipFlop_Set_Reset_0, and set properties
  set D_FlipFlop_Set_Reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:D_FlipFlop_Set_Reset:1.0 D_FlipFlop_Set_Reset_0 ]

  # Create instance: D_FlipFlop_Set_Reset_1, and set properties
  set D_FlipFlop_Set_Reset_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:D_FlipFlop_Set_Reset:1.0 D_FlipFlop_Set_Reset_1 ]

  # Create instance: xup_inv_0, and set properties
  set xup_inv_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_inv:1.0 xup_inv_0 ]

  # Create instance: xup_inv_1, and set properties
  set xup_inv_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_inv:1.0 xup_inv_1 ]

  # Create instance: xup_inv_2, and set properties
  set xup_inv_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_inv:1.0 xup_inv_2 ]

  # Create instance: xup_inv_3, and set properties
  set xup_inv_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_inv:1.0 xup_inv_3 ]

  # Create instance: xup_inv_4, and set properties
  set xup_inv_4 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_inv:1.0 xup_inv_4 ]

  # Create instance: xup_nand2_0, and set properties
  set xup_nand2_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_0 ]

  # Create instance: xup_nand2_1, and set properties
  set xup_nand2_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_1 ]

  # Create instance: xup_nand2_2, and set properties
  set xup_nand2_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_2 ]

  # Create instance: xup_nand2_3, and set properties
  set xup_nand2_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_3 ]

  # Create instance: xup_nand2_4, and set properties
  set xup_nand2_4 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_4 ]

  # Create instance: xup_nand2_5, and set properties
  set xup_nand2_5 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_5 ]

  # Create instance: xup_nand2_6, and set properties
  set xup_nand2_6 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_6 ]

  # Create instance: xup_nand2_7, and set properties
  set xup_nand2_7 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_7 ]

  # Create instance: xup_nand2_8, and set properties
  set xup_nand2_8 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_8 ]

  # Create instance: xup_nand2_9, and set properties
  set xup_nand2_9 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_9 ]

  # Create instance: xup_nand2_10, and set properties
  set xup_nand2_10 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_10 ]

  # Create instance: xup_nand2_11, and set properties
  set xup_nand2_11 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_11 ]

  # Create instance: xup_nand2_12, and set properties
  set xup_nand2_12 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_12 ]

  # Create instance: xup_nand2_13, and set properties
  set xup_nand2_13 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_13 ]

  # Create instance: xup_nand2_14, and set properties
  set xup_nand2_14 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_14 ]

  # Create instance: xup_nand3_0, and set properties
  set xup_nand3_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand3:1.0 xup_nand3_0 ]

  # Create instance: xup_nand3_1, and set properties
  set xup_nand3_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand3:1.0 xup_nand3_1 ]

  # Create instance: xup_nand3_2, and set properties
  set xup_nand3_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand3:1.0 xup_nand3_2 ]

  # Create instance: xup_nand3_3, and set properties
  set xup_nand3_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand3:1.0 xup_nand3_3 ]

  # Create instance: xup_nand3_4, and set properties
  set xup_nand3_4 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand3:1.0 xup_nand3_4 ]

  # Create instance: xup_nand3_5, and set properties
  set xup_nand3_5 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand3:1.0 xup_nand3_5 ]

  # Create instance: xup_nand4_0, and set properties
  set xup_nand4_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand4:1.0 xup_nand4_0 ]

  # Create instance: xup_nand4_1, and set properties
  set xup_nand4_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand4:1.0 xup_nand4_1 ]

  # Create instance: xup_nand4_2, and set properties
  set xup_nand4_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand4:1.0 xup_nand4_2 ]

  # Create instance: xup_xor2_0, and set properties
  set xup_xor2_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_xor2:1.0 xup_xor2_0 ]

  # Create port connections
  connect_bd_net -net CLK1_1 [get_bd_ports CLK1] [get_bd_pins D_FlipFlop_Set_Reset_0/CLK1] [get_bd_pins D_FlipFlop_Set_Reset_0/CLK2] [get_bd_pins D_FlipFlop_Set_Reset_1/CLK1] [get_bd_pins D_FlipFlop_Set_Reset_1/CLK2]
  connect_bd_net -net CLR1_n_1 [get_bd_ports CLR1_n] [get_bd_pins D_FlipFlop_Set_Reset_0/CLR1_n] [get_bd_pins D_FlipFlop_Set_Reset_0/CLR2_n] [get_bd_pins D_FlipFlop_Set_Reset_1/CLR1_n] [get_bd_pins D_FlipFlop_Set_Reset_1/CLR2_n]
  connect_bd_net -net D_1 [get_bd_ports D] [get_bd_pins xup_inv_3/a] [get_bd_pins xup_nand3_2/a] [get_bd_pins xup_nand3_3/a] [get_bd_pins xup_nand4_1/a] [get_bd_pins xup_nand4_2/a] [get_bd_pins xup_xor2_0/a]
  connect_bd_net -net D_FlipFlop_Set_Reset_0_Q1 [get_bd_ports Q1] [get_bd_pins D_FlipFlop_Set_Reset_0/Q1] [get_bd_pins xup_nand2_2/b] [get_bd_pins xup_nand3_1/b] [get_bd_pins xup_nand4_0/b] [get_bd_pins xup_nand4_1/b] [get_bd_pins xup_xor2_0/b]
  connect_bd_net -net D_FlipFlop_Set_Reset_0_Q1_n [get_bd_pins D_FlipFlop_Set_Reset_0/Q1_n] [get_bd_pins xup_nand2_0/a] [get_bd_pins xup_nand3_2/b] [get_bd_pins xup_nand3_5/b] [get_bd_pins xup_nand4_2/b]
  connect_bd_net -net D_FlipFlop_Set_Reset_0_Q2 [get_bd_ports Q2] [get_bd_pins D_FlipFlop_Set_Reset_0/Q2] [get_bd_pins xup_nand2_5/a] [get_bd_pins xup_nand3_1/c] [get_bd_pins xup_nand4_0/c]
  connect_bd_net -net D_FlipFlop_Set_Reset_0_Q2_n [get_bd_pins D_FlipFlop_Set_Reset_0/Q2_n] [get_bd_pins xup_nand2_4/a] [get_bd_pins xup_nand3_2/c] [get_bd_pins xup_nand3_3/b] [get_bd_pins xup_nand4_1/c] [get_bd_pins xup_nand4_2/c]
  connect_bd_net -net D_FlipFlop_Set_Reset_1_Q1 [get_bd_ports Q3] [get_bd_pins D_FlipFlop_Set_Reset_1/Q1] [get_bd_pins xup_nand2_8/b] [get_bd_pins xup_nand2_9/a] [get_bd_pins xup_nand3_5/c] [get_bd_pins xup_nand4_0/d]
  connect_bd_net -net D_FlipFlop_Set_Reset_1_Q1_n [get_bd_pins D_FlipFlop_Set_Reset_1/Q1_n] [get_bd_pins xup_nand2_6/a] [get_bd_pins xup_nand4_1/d] [get_bd_pins xup_nand4_2/d]
  connect_bd_net -net D_FlipFlop_Set_Reset_1_Q2 [get_bd_ports Q4] [get_bd_pins D_FlipFlop_Set_Reset_1/Q2] [get_bd_pins xup_nand2_12/b] [get_bd_pins xup_nand2_9/b]
  connect_bd_net -net D_FlipFlop_Set_Reset_1_Q2_n [get_bd_pins D_FlipFlop_Set_Reset_1/Q2_n] [get_bd_pins xup_nand2_11/a] [get_bd_pins xup_nand3_3/c]
  connect_bd_net -net J1_1 [get_bd_ports J1] [get_bd_pins xup_inv_0/a] [get_bd_pins xup_nand2_0/b]
  connect_bd_net -net PR1_n_1 [get_bd_ports PR1_n] [get_bd_pins D_FlipFlop_Set_Reset_0/PR1_n] [get_bd_pins D_FlipFlop_Set_Reset_0/PR2_n] [get_bd_pins D_FlipFlop_Set_Reset_1/PR1_n] [get_bd_pins D_FlipFlop_Set_Reset_1/PR2_n]
  connect_bd_net -net xup_inv_0_y [get_bd_pins xup_inv_0/y] [get_bd_pins xup_nand2_2/a]
  connect_bd_net -net xup_inv_1_y [get_bd_pins xup_inv_1/y] [get_bd_pins xup_nand2_5/b]
  connect_bd_net -net xup_inv_2_y [get_bd_pins xup_inv_2/y] [get_bd_pins xup_nand2_8/a]
  connect_bd_net -net xup_inv_3_y [get_bd_pins xup_inv_3/y] [get_bd_pins xup_nand3_1/a] [get_bd_pins xup_nand3_5/a] [get_bd_pins xup_nand4_0/a]
  connect_bd_net -net xup_inv_4_y [get_bd_pins xup_inv_4/y] [get_bd_pins xup_nand2_12/a]
  connect_bd_net -net xup_nand2_0_y [get_bd_pins xup_nand2_0/y] [get_bd_pins xup_nand2_1/a]
  connect_bd_net -net xup_nand2_10_y [get_bd_pins D_FlipFlop_Set_Reset_1/D2] [get_bd_pins xup_nand2_10/y]
  connect_bd_net -net xup_nand2_11_y [get_bd_pins xup_nand2_10/a] [get_bd_pins xup_nand2_11/y]
  connect_bd_net -net xup_nand2_12_y [get_bd_pins xup_nand2_10/b] [get_bd_pins xup_nand2_12/y]
  connect_bd_net -net xup_nand2_13_y [get_bd_pins xup_nand2_11/b] [get_bd_pins xup_nand2_13/y]
  connect_bd_net -net xup_nand2_14_y [get_bd_pins xup_inv_4/a] [get_bd_pins xup_nand2_14/y]
  connect_bd_net -net xup_nand2_1_y [get_bd_pins D_FlipFlop_Set_Reset_0/D1] [get_bd_pins xup_nand2_1/y]
  connect_bd_net -net xup_nand2_2_y [get_bd_pins xup_nand2_1/b] [get_bd_pins xup_nand2_2/y]
  connect_bd_net -net xup_nand2_3_y [get_bd_pins D_FlipFlop_Set_Reset_0/D2] [get_bd_pins xup_nand2_3/y]
  connect_bd_net -net xup_nand2_4_y [get_bd_pins xup_nand2_3/a] [get_bd_pins xup_nand2_4/y]
  connect_bd_net -net xup_nand2_5_y [get_bd_pins xup_nand2_3/b] [get_bd_pins xup_nand2_5/y]
  connect_bd_net -net xup_nand2_6_y [get_bd_pins xup_nand2_6/y] [get_bd_pins xup_nand2_7/a]
  connect_bd_net -net xup_nand2_7_y [get_bd_pins D_FlipFlop_Set_Reset_1/D1] [get_bd_pins xup_nand2_7/y]
  connect_bd_net -net xup_nand2_8_y [get_bd_pins xup_nand2_7/b] [get_bd_pins xup_nand2_8/y]
  connect_bd_net -net xup_nand2_9_y [get_bd_pins xup_nand2_9/y] [get_bd_pins xup_nand3_4/c]
  connect_bd_net -net xup_nand3_0_y [get_bd_pins xup_nand2_6/b] [get_bd_pins xup_nand3_0/y]
  connect_bd_net -net xup_nand3_1_y [get_bd_pins xup_nand3_0/a] [get_bd_pins xup_nand3_1/y] [get_bd_pins xup_nand3_4/a]
  connect_bd_net -net xup_nand3_2_y [get_bd_pins xup_nand3_0/b] [get_bd_pins xup_nand3_2/y] [get_bd_pins xup_nand3_4/b]
  connect_bd_net -net xup_nand3_3_y [get_bd_pins xup_nand3_0/c] [get_bd_pins xup_nand3_3/y]
  connect_bd_net -net xup_nand3_4_y [get_bd_pins xup_inv_2/a] [get_bd_pins xup_nand3_4/y]
  connect_bd_net -net xup_nand3_5_y [get_bd_pins xup_nand2_14/a] [get_bd_pins xup_nand3_5/y]
  connect_bd_net -net xup_nand4_0_y [get_bd_pins xup_nand2_13/a] [get_bd_pins xup_nand4_0/y]
  connect_bd_net -net xup_nand4_1_y [get_bd_pins xup_nand2_13/b] [get_bd_pins xup_nand4_1/y]
  connect_bd_net -net xup_nand4_2_y [get_bd_pins xup_nand2_14/b] [get_bd_pins xup_nand4_2/y]
  connect_bd_net -net xup_xor2_0_y [get_bd_pins xup_inv_1/a] [get_bd_pins xup_nand2_4/b] [get_bd_pins xup_xor2_0/y]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port CLK1 -pg 1 -y -230 -defaultsOSRD
preplace port Q1 -pg 1 -y -680 -defaultsOSRD
preplace port D -pg 1 -y -270 -defaultsOSRD
preplace port CLR1_n -pg 1 -y -190 -defaultsOSRD
preplace port Q2 -pg 1 -y -660 -defaultsOSRD
preplace port PR1_n -pg 1 -y -210 -defaultsOSRD
preplace port Q3 -pg 1 -y -640 -defaultsOSRD
preplace port Q4 -pg 1 -y -610 -defaultsOSRD
preplace inst xup_nand4_6 -pg 1 -lvl 2 -y 770 -defaultsOSRD
preplace inst xup_nand3_0 -pg 1 -lvl 2 -y -580 -defaultsOSRD
preplace inst xup_nand4_7 -pg 1 -lvl 2 -y 1050 -defaultsOSRD
preplace inst xup_nand3_1 -pg 1 -lvl 2 -y -460 -defaultsOSRD
preplace inst xup_nand2_1 -pg 1 -lvl 2 -y -1490 -defaultsOSRD
preplace inst xup_nand4_8 -pg 1 -lvl 2 -y 910 -defaultsOSRD
preplace inst xup_nand3_2 -pg 1 -lvl 2 -y -340 -defaultsOSRD
preplace inst xup_nand2_2 -pg 1 -lvl 3 -y -860 -defaultsOSRD
preplace inst xup_nand4_9 -pg 1 -lvl 2 -y 50 -defaultsOSRD
preplace inst xup_nand3_3 -pg 1 -lvl 2 -y -220 -defaultsOSRD
preplace inst xup_nand3_4 -pg 1 -lvl 2 -y -700 -defaultsOSRD
preplace inst xup_inv_0 -pg 1 -lvl 1 -y -1140 -defaultsOSRD
preplace inst D_FlipFlop_Set_Reset_0 -pg 1 -lvl 4 -y -250 -defaultsOSRD
preplace inst xup_nand3_5 -pg 1 -lvl 2 -y -1120 -defaultsOSRD
preplace inst xup_and6_0 -pg 1 -lvl 3 -y 240 -defaultsOSRD
preplace inst D_FlipFlop_Set_Reset_1 -pg 1 -lvl 4 -y -650 -defaultsOSRD
preplace inst xup_and6_1 -pg 1 -lvl 3 -y -1380 -defaultsOSRD
preplace inst xup_nand3_6 -pg 1 -lvl 2 -y -1260 -defaultsOSRD
preplace inst xup_nand3_7 -pg 1 -lvl 2 -y -1380 -defaultsOSRD
preplace inst xup_nand4_0 -pg 1 -lvl 3 -y -520 -defaultsOSRD
preplace inst xup_nand4_1 -pg 1 -lvl 2 -y -90 -defaultsOSRD
preplace inst xup_nand4_2 -pg 1 -lvl 2 -y 210 -defaultsOSRD
preplace inst xup_nand4_10 -pg 1 -lvl 2 -y -830 -defaultsOSRD
preplace inst xup_nand4_3 -pg 1 -lvl 2 -y 350 -defaultsOSRD
preplace inst xup_nand4_11 -pg 1 -lvl 2 -y -990 -defaultsOSRD
preplace inst xup_nand4_4 -pg 1 -lvl 2 -y 490 -defaultsOSRD
preplace inst xup_nand4_12 -pg 1 -lvl 3 -y 880 -defaultsOSRD
preplace inst xup_nand4_5 -pg 1 -lvl 2 -y 630 -defaultsOSRD
preplace netloc xup_nand4_12_y 1 3 1 800
preplace netloc xup_nand4_8_y 1 2 1 560
preplace netloc xup_nand3_5_y 1 2 1 540
preplace netloc xup_nand4_3_y 1 2 1 540
preplace netloc xup_nand4_0_y 1 3 1 770
preplace netloc D_FlipFlop_Set_Reset_1_Q1_n 1 1 4 360 1140 N 1140 780 1140 1050
preplace netloc xup_nand4_11_y 1 2 1 570
preplace netloc xup_and6_0_y 1 2 2 580 140 750
preplace netloc xup_and6_1_y 1 2 2 580 -1280 750
preplace netloc D_FlipFlop_Set_Reset_1_Q2_n 1 1 4 320 1180 NJ 1180 N 1180 1060
preplace netloc D_FlipFlop_Set_Reset_0_Q2_n 1 1 4 340 1170 NJ 1170 NJ 1170 1040
preplace netloc D_FlipFlop_Set_Reset_1_Q1 1 1 4 300 1150 NJ 1150 N 1150 1080
preplace netloc D_FlipFlop_Set_Reset_1_Q2 1 1 4 310 1160 NJ 1160 N 1160 1090
preplace netloc CLK1_1 1 0 4 -70 -1560 NJ -1560 N -1560 810
preplace netloc xup_nand4_7_y 1 2 1 580
preplace netloc xup_nand3_4_y 1 2 1 580
preplace netloc xup_nand4_10_y 1 2 1 560
preplace netloc D_FlipFlop_Set_Reset_0_Q1 1 1 4 330 1130 NJ 1130 NJ 1130 1100
preplace netloc CLR1_n_1 1 0 4 -40 -1190 NJ -1190 N -1190 760
preplace netloc PR1_n_1 1 0 4 -60J -1550 NJ -1550 N -1550 790
preplace netloc xup_nand4_6_y 1 2 1 550
preplace netloc D_FlipFlop_Set_Reset_0_Q2 1 1 4 340 -910 570J -920 NJ -920 1070
preplace netloc xup_nand3_3_y 1 2 1 580
preplace netloc xup_nand4_9_y 1 2 1 560
preplace netloc xup_inv_0_y 1 1 1 280
preplace netloc xup_nand4_1_y 1 2 1 570
preplace netloc xup_nand2_2_y 1 3 1 750J
preplace netloc xup_nand4_5_y 1 2 1 570
preplace netloc xup_nand4_4_y 1 2 1 560
preplace netloc xup_nand4_2_y 1 2 1 540
preplace netloc xup_nand3_7_y 1 2 1 540
preplace netloc xup_nand2_1_y 1 2 1 560
preplace netloc xup_nand3_2_y 1 2 1 570
preplace netloc xup_nand3_6_y 1 2 1 550
preplace netloc xup_nand3_0_y 1 2 1 560
preplace netloc D_1 1 0 2 -50 -360 290
preplace netloc D_FlipFlop_Set_Reset_0_Q1_n 1 1 4 350 130 NJ 130 NJ 130 1030
preplace netloc xup_nand3_1_y 1 2 1 550
levelinfo -pg 1 -90 200 460 670 930 1330 -top -1570 -bot 1410
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


