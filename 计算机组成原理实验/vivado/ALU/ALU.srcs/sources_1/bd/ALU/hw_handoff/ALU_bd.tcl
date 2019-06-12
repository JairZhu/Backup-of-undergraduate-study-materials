
################################################################
# This is a generated script based on design: ALU
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
# source ALU_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name ALU

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
  set OA [ create_bd_port -dir O OA ]
  set OB [ create_bd_port -dir O OB ]
  set OC [ create_bd_port -dir O OC ]
  set OS1 [ create_bd_port -dir O OS1 ]
  set OS2 [ create_bd_port -dir O OS2 ]
  set S0 [ create_bd_port -dir I S0 ]
  set S1 [ create_bd_port -dir I S1 ]
  set S2 [ create_bd_port -dir I S2 ]
  set VCC [ create_bd_port -dir I VCC ]
  set Y1 [ create_bd_port -dir O Y1 ]
  set Y2 [ create_bd_port -dir O Y2 ]
  set a [ create_bd_port -dir I a ]
  set b [ create_bd_port -dir I b ]
  set c [ create_bd_port -dir I c ]
  set ground [ create_bd_port -dir I ground ]
  set oS0 [ create_bd_port -dir O oS0 ]

  # Create instance: decode138_0, and set properties
  set decode138_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:decode138:1.0 decode138_0 ]

  # Create instance: mux_8_to_1_0, and set properties
  set mux_8_to_1_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_0 ]

  # Create instance: xup_and2_0, and set properties
  set xup_and2_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and2:1.0 xup_and2_0 ]

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

  # Create instance: xup_nand2_1, and set properties
  set xup_nand2_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand2:1.0 xup_nand2_1 ]

  # Create instance: xup_nand3_0, and set properties
  set xup_nand3_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand3:1.0 xup_nand3_0 ]

  # Create instance: xup_nand4_0, and set properties
  set xup_nand4_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand4:1.0 xup_nand4_0 ]

  # Create instance: xup_nand4_1, and set properties
  set xup_nand4_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand4:1.0 xup_nand4_1 ]

  # Create instance: xup_nand4_2, and set properties
  set xup_nand4_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand4:1.0 xup_nand4_2 ]

  # Create instance: xup_nand4_3, and set properties
  set xup_nand4_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand4:1.0 xup_nand4_3 ]

  # Create instance: xup_nand4_4, and set properties
  set xup_nand4_4 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand4:1.0 xup_nand4_4 ]

  # Create instance: xup_nand4_5, and set properties
  set xup_nand4_5 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand4:1.0 xup_nand4_5 ]

  # Create instance: xup_nand5_0, and set properties
  set xup_nand5_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_nand5:1.0 xup_nand5_0 ]

  # Create instance: xup_or2_0, and set properties
  set xup_or2_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_or2:1.0 xup_or2_0 ]

  # Create instance: xup_xor2_0, and set properties
  set xup_xor2_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_xor2:1.0 xup_xor2_0 ]

  # Create port connections
  connect_bd_net -net S0_1 [get_bd_ports S0] [get_bd_ports oS0] [get_bd_pins mux_8_to_1_0/A0] [get_bd_pins xup_inv_3/a] [get_bd_pins xup_nand4_3/c] [get_bd_pins xup_nand4_5/b]
  connect_bd_net -net S1_1 [get_bd_ports OS1] [get_bd_ports S1] [get_bd_pins mux_8_to_1_0/A1] [get_bd_pins xup_inv_2/a] [get_bd_pins xup_nand4_4/b] [get_bd_pins xup_nand4_5/c]
  connect_bd_net -net S2_1 [get_bd_ports OS2] [get_bd_ports S2] [get_bd_pins mux_8_to_1_0/A2] [get_bd_pins xup_inv_4/a] [get_bd_pins xup_nand4_3/a] [get_bd_pins xup_nand4_4/a] [get_bd_pins xup_nand4_5/a]
  connect_bd_net -net VCC_1 [get_bd_ports VCC] [get_bd_pins decode138_0/E1]
  connect_bd_net -net a_1 [get_bd_ports OA] [get_bd_ports a] [get_bd_pins decode138_0/A1] [get_bd_pins xup_and2_0/b] [get_bd_pins xup_inv_0/a] [get_bd_pins xup_or2_0/b] [get_bd_pins xup_xor2_0/b]
  connect_bd_net -net b_1 [get_bd_ports OB] [get_bd_ports b] [get_bd_pins decode138_0/A0] [get_bd_pins xup_and2_0/a] [get_bd_pins xup_inv_1/a] [get_bd_pins xup_or2_0/a] [get_bd_pins xup_xor2_0/a]
  connect_bd_net -net c_1 [get_bd_ports OC] [get_bd_ports c] [get_bd_pins decode138_0/A2]
  connect_bd_net -net decode138_0_Y1_n [get_bd_pins decode138_0/Y1_n] [get_bd_pins xup_nand4_0/a] [get_bd_pins xup_nand4_2/a]
  connect_bd_net -net decode138_0_Y2_n [get_bd_pins decode138_0/Y2_n] [get_bd_pins xup_nand4_0/b] [get_bd_pins xup_nand4_2/b]
  connect_bd_net -net decode138_0_Y3_n [get_bd_pins decode138_0/Y3_n] [get_bd_pins xup_nand4_1/a] [get_bd_pins xup_nand4_2/c]
  connect_bd_net -net decode138_0_Y4_n [get_bd_pins decode138_0/Y4_n] [get_bd_pins xup_nand4_0/c]
  connect_bd_net -net decode138_0_Y5_n [get_bd_pins decode138_0/Y5_n] [get_bd_pins xup_nand4_1/b]
  connect_bd_net -net decode138_0_Y6_n [get_bd_pins decode138_0/Y6_n] [get_bd_pins xup_nand4_1/c]
  connect_bd_net -net decode138_0_Y7_n [get_bd_pins decode138_0/Y7_n] [get_bd_pins xup_nand4_0/d] [get_bd_pins xup_nand4_1/d] [get_bd_pins xup_nand4_2/d]
  connect_bd_net -net ground_1 [get_bd_ports ground] [get_bd_pins decode138_0/E2_n] [get_bd_pins decode138_0/E3_n] [get_bd_pins mux_8_to_1_0/D7] [get_bd_pins mux_8_to_1_0/S_n] [get_bd_pins xup_nand4_5/d]
  connect_bd_net -net mux_8_to_1_0_Q [get_bd_ports Y1] [get_bd_pins mux_8_to_1_0/Q]
  connect_bd_net -net mux_8_to_1_0_Q_n [get_bd_pins mux_8_to_1_0/Q_n] [get_bd_pins xup_nand2_1/b] [get_bd_pins xup_nand3_0/c]
  connect_bd_net -net xup_and2_0_y [get_bd_pins mux_8_to_1_0/D0] [get_bd_pins xup_and2_0/y]
  connect_bd_net -net xup_inv_0_y [get_bd_pins mux_8_to_1_0/D2] [get_bd_pins xup_inv_0/y]
  connect_bd_net -net xup_inv_1_y [get_bd_pins mux_8_to_1_0/D3] [get_bd_pins xup_inv_1/y]
  connect_bd_net -net xup_inv_2_y [get_bd_pins xup_inv_2/y] [get_bd_pins xup_nand3_0/b] [get_bd_pins xup_nand4_3/b]
  connect_bd_net -net xup_inv_3_y [get_bd_pins xup_inv_3/y] [get_bd_pins xup_nand3_0/a] [get_bd_pins xup_nand4_4/c]
  connect_bd_net -net xup_inv_4_y [get_bd_pins xup_inv_4/y] [get_bd_pins xup_nand2_1/a]
  connect_bd_net -net xup_nand2_1_y [get_bd_pins xup_nand2_1/y] [get_bd_pins xup_nand5_0/b]
  connect_bd_net -net xup_nand3_0_y [get_bd_pins xup_nand3_0/y] [get_bd_pins xup_nand5_0/e]
  connect_bd_net -net xup_nand4_0_y [get_bd_pins mux_8_to_1_0/D5] [get_bd_pins mux_8_to_1_0/D6] [get_bd_pins xup_nand4_0/y]
  connect_bd_net -net xup_nand4_1_y [get_bd_pins xup_nand4_1/y] [get_bd_pins xup_nand4_3/d]
  connect_bd_net -net xup_nand4_2_y [get_bd_pins xup_nand4_2/y] [get_bd_pins xup_nand4_4/d]
  connect_bd_net -net xup_nand4_3_y [get_bd_pins xup_nand4_3/y] [get_bd_pins xup_nand5_0/d]
  connect_bd_net -net xup_nand4_4_y [get_bd_pins xup_nand4_4/y] [get_bd_pins xup_nand5_0/c]
  connect_bd_net -net xup_nand4_5_y [get_bd_pins xup_nand4_5/y] [get_bd_pins xup_nand5_0/a]
  connect_bd_net -net xup_nand5_0_y [get_bd_ports Y2] [get_bd_pins xup_nand5_0/y]
  connect_bd_net -net xup_or2_0_y [get_bd_pins mux_8_to_1_0/D1] [get_bd_pins xup_or2_0/y]
  connect_bd_net -net xup_xor2_0_y [get_bd_pins mux_8_to_1_0/D4] [get_bd_pins xup_xor2_0/y]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port OA -pg 1 -y 260 -defaultsOSRD
preplace port a -pg 1 -y 250 -defaultsOSRD
preplace port oS0 -pg 1 -y 330 -defaultsOSRD
preplace port OB -pg 1 -y 230 -defaultsOSRD
preplace port b -pg 1 -y 230 -defaultsOSRD
preplace port OC -pg 1 -y 300 -defaultsOSRD
preplace port c -pg 1 -y 270 -defaultsOSRD
preplace port Y1 -pg 1 -y 520 -defaultsOSRD
preplace port Y2 -pg 1 -y 610 -defaultsOSRD
preplace port OS1 -pg 1 -y 360 -defaultsOSRD
preplace port S0 -pg 1 -y 790 -defaultsOSRD
preplace port OS2 -pg 1 -y 400 -defaultsOSRD
preplace port S1 -pg 1 -y 810 -defaultsOSRD
preplace port VCC -pg 1 -y 290 -defaultsOSRD
preplace port ground -pg 1 -y 310 -defaultsOSRD
preplace port S2 -pg 1 -y 770 -defaultsOSRD
preplace inst xup_nand3_0 -pg 1 -lvl 4 -y 740 -defaultsOSRD
preplace inst xup_nand3_1 -pg 1 -lvl 4 -y 860 -defaultsOSRD
preplace inst xup_nand2_1 -pg 1 -lvl 4 -y 270 -defaultsOSRD
preplace inst xup_xor2_0 -pg 1 -lvl 2 -y 740 -defaultsOSRD
preplace inst xup_inv_0 -pg 1 -lvl 2 -y 450 -defaultsOSRD
preplace inst xup_inv_1 -pg 1 -lvl 2 -y 860 -defaultsOSRD
preplace inst xup_nand6_0 -pg 1 -lvl 5 -y 750 -defaultsOSRD
preplace inst xup_inv_2 -pg 1 -lvl 3 -y 810 -defaultsOSRD
preplace inst xup_inv_3 -pg 1 -lvl 3 -y 730 -defaultsOSRD
preplace inst xup_nand4_0 -pg 1 -lvl 2 -y 310 -defaultsOSRD
preplace inst mux_8_to_1_0 -pg 1 -lvl 3 -y 540 -defaultsOSRD
preplace inst xup_inv_4 -pg 1 -lvl 3 -y 350 -defaultsOSRD
preplace inst xup_nand4_1 -pg 1 -lvl 3 -y 30 -defaultsOSRD
preplace inst xup_nand4_2 -pg 1 -lvl 3 -y 190 -defaultsOSRD
preplace inst xup_nand4_3 -pg 1 -lvl 4 -y 610 -defaultsOSRD
preplace inst decode138_0 -pg 1 -lvl 1 -y 280 -defaultsOSRD
preplace inst xup_or2_0 -pg 1 -lvl 2 -y 540 -defaultsOSRD
preplace inst xup_nand4_4 -pg 1 -lvl 4 -y 440 -defaultsOSRD
preplace inst xup_and2_0 -pg 1 -lvl 2 -y 640 -defaultsOSRD
preplace inst xup_nand4_5 -pg 1 -lvl 4 -y 110 -defaultsOSRD
preplace netloc xup_nand4_3_y 1 4 1 1090
preplace netloc xup_inv_3_y 1 3 1 900
preplace netloc xup_nand4_0_y 1 2 1 610
preplace netloc decode138_0_Y7_n 1 1 2 400 220 610
preplace netloc decode138_0_Y2_n 1 1 2 410 180 NJ
preplace netloc xup_inv_2_y 1 3 1 910
preplace netloc S0_1 1 0 6 10J 100 NJ 100 600 860 870 340 1100J 330 NJ
preplace netloc b_1 1 0 6 40 160 370 160 570J 300 810J 330 1090J 230 NJ
preplace netloc mux_8_to_1_0_Q 1 3 3 NJ 530 NJ 530 1290J
preplace netloc decode138_0_Y6_n 1 1 2 380 40 NJ
preplace netloc xup_nand6_0_y 1 5 1 1280
preplace netloc mux_8_to_1_0_Q_n 1 3 1 920
preplace netloc ground_1 1 0 4 50 110 NJ 110 640 110 920J
preplace netloc xup_xor2_0_y 1 2 1 610
preplace netloc decode138_0_Y5_n 1 1 2 360 20 NJ
preplace netloc S1_1 1 0 6 NJ 810 NJ 810 630 870 880 350 NJ 350 1290J
preplace netloc c_1 1 0 6 30J 150 NJ 150 620J 270 840J 190 NJ 190 1290J
preplace netloc xup_or2_0_y 1 2 1 570
preplace netloc xup_inv_0_y 1 2 1 590J
preplace netloc xup_nand4_1_y 1 3 1 860
preplace netloc S2_1 1 0 6 0J 80 NJ 80 630 290 890 360 NJ 360 1280J
preplace netloc xup_nand4_4_y 1 4 1 1100
preplace netloc xup_nand4_5_y 1 4 1 1120
preplace netloc xup_nand4_2_y 1 3 1 830
preplace netloc decode138_0_Y1_n 1 1 2 390 230 590J
preplace netloc VCC_1 1 0 1 NJ
preplace netloc xup_nand2_1_y 1 4 1 1110
preplace netloc decode138_0_Y4_n 1 1 1 350
preplace netloc xup_nand3_0_y 1 4 1 1080
preplace netloc xup_inv_1_y 1 2 1 580J
preplace netloc xup_and2_0_y 1 2 1 570
preplace netloc a_1 1 0 6 20 400 350 400 620J 280 850J 210 NJ 210 1280J
preplace netloc xup_nand3_1_y 1 4 1 1100
preplace netloc xup_inv_4_y 1 3 1 820
preplace netloc decode138_0_Y3_n 1 1 2 350 0 650
levelinfo -pg 1 -20 290 490 730 1000 1200 1310 -top -110 -bot 920
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


