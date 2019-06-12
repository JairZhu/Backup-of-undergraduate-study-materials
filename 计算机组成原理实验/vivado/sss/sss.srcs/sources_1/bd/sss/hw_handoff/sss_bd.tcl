
################################################################
# This is a generated script based on design: sss
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
# source sss_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name sss

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
  set BCD_A [ create_bd_port -dir I BCD_A ]
  set BCD_B [ create_bd_port -dir I BCD_B ]
  set BCD_C [ create_bd_port -dir I BCD_C ]
  set BCD_D [ create_bd_port -dir I BCD_D ]
  set BI_RBO_n [ create_bd_port -dir IO BI_RBO_n ]
  set LT_n [ create_bd_port -dir I LT_n ]
  set RBI_n [ create_bd_port -dir I RBI_n ]
  set a [ create_bd_port -dir I a ]
  set a_1 [ create_bd_port -dir I a_1 ]
  set a_2 [ create_bd_port -dir I a_2 ]
  set a_3 [ create_bd_port -dir I a_3 ]
  set a_4 [ create_bd_port -dir O a_4 ]
  set b [ create_bd_port -dir O b ]
  set c [ create_bd_port -dir O c ]
  set d [ create_bd_port -dir O d ]
  set e [ create_bd_port -dir O e ]
  set f [ create_bd_port -dir O f ]
  set g [ create_bd_port -dir O g ]
  set y_1 [ create_bd_port -dir O y_1 ]
  set y_2 [ create_bd_port -dir O y_2 ]
  set y_3 [ create_bd_port -dir O y_3 ]
  set y_4 [ create_bd_port -dir O y_4 ]

  # Create instance: BCD2SEG7_0, and set properties
  set BCD2SEG7_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_0 ]

  # Create instance: xup_inv_1, and set properties
  set xup_inv_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_inv:1.0 xup_inv_1 ]

  # Create instance: xup_inv_2, and set properties
  set xup_inv_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_inv:1.0 xup_inv_2 ]

  # Create instance: xup_inv_3, and set properties
  set xup_inv_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_inv:1.0 xup_inv_3 ]

  # Create instance: xup_inv_4, and set properties
  set xup_inv_4 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_inv:1.0 xup_inv_4 ]

  # Create port connections
  connect_bd_net -net BCD2SEG7_0_a [get_bd_ports a_4] [get_bd_pins BCD2SEG7_0/a]
  connect_bd_net -net BCD2SEG7_0_b [get_bd_ports b] [get_bd_pins BCD2SEG7_0/b]
  connect_bd_net -net BCD2SEG7_0_c [get_bd_ports c] [get_bd_pins BCD2SEG7_0/c]
  connect_bd_net -net BCD2SEG7_0_d [get_bd_ports d] [get_bd_pins BCD2SEG7_0/d]
  connect_bd_net -net BCD2SEG7_0_e [get_bd_ports e] [get_bd_pins BCD2SEG7_0/e]
  connect_bd_net -net BCD2SEG7_0_f [get_bd_ports f] [get_bd_pins BCD2SEG7_0/f]
  connect_bd_net -net BCD2SEG7_0_g [get_bd_ports g] [get_bd_pins BCD2SEG7_0/g]
  connect_bd_net -net BCD_A_1 [get_bd_ports BCD_A] [get_bd_pins BCD2SEG7_0/BCD_A]
  connect_bd_net -net BCD_B_1 [get_bd_ports BCD_B] [get_bd_pins BCD2SEG7_0/BCD_B]
  connect_bd_net -net BCD_C_1 [get_bd_ports BCD_C] [get_bd_pins BCD2SEG7_0/BCD_C]
  connect_bd_net -net BCD_D_1 [get_bd_ports BCD_D] [get_bd_pins BCD2SEG7_0/BCD_D]
  connect_bd_net -net LT_n_1 [get_bd_ports LT_n] [get_bd_pins BCD2SEG7_0/LT_n]
  connect_bd_net -net Net [get_bd_ports BI_RBO_n] [get_bd_pins BCD2SEG7_0/BI_RBO_n]
  connect_bd_net -net RBI_n_1 [get_bd_ports RBI_n] [get_bd_pins BCD2SEG7_0/RBI_n]
  connect_bd_net -net a_1 [get_bd_ports a] [get_bd_pins xup_inv_1/a]
  connect_bd_net -net a_1_1 [get_bd_ports a_1] [get_bd_pins xup_inv_2/a]
  connect_bd_net -net a_2_1 [get_bd_ports a_2] [get_bd_pins xup_inv_3/a]
  connect_bd_net -net a_3_1 [get_bd_ports a_3] [get_bd_pins xup_inv_4/a]
  connect_bd_net -net xup_inv_1_y [get_bd_ports y_1] [get_bd_pins xup_inv_1/y]
  connect_bd_net -net xup_inv_2_y [get_bd_ports y_2] [get_bd_pins xup_inv_2/y]
  connect_bd_net -net xup_inv_3_y [get_bd_ports y_3] [get_bd_pins xup_inv_3/y]
  connect_bd_net -net xup_inv_4_y [get_bd_ports y_4] [get_bd_pins xup_inv_4/y]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


