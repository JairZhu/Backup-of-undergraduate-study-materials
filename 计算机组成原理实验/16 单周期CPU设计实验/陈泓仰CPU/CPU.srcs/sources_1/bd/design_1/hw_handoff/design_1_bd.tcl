
################################################################
# This is a generated script based on design: design_1
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
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# ALU, CLK_div1, ControlUnit, DataMem, DisplayControl, InsMemory, MuxForReadData1, MuxForReadData2, MuxForWriteData, MuxForWriteReg, PC, RegisterFile, SignZeroExtend, avoidshake, choose, clk_40hz, x7seg_msg

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name design_1

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
  set CLK [ create_bd_port -dir I -type clk CLK ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
 ] $CLK
  set Reset [ create_bd_port -dir I Reset ]
  set Switch [ create_bd_port -dir I Switch ]
  set a_to_g [ create_bd_port -dir O -from 6 -to 0 a_to_g ]
  set clr [ create_bd_port -dir I clr ]
  set control [ create_bd_port -dir I -from 1 -to 0 control ]
  set pos [ create_bd_port -dir O -from 3 -to 0 pos ]
  set rst [ create_bd_port -dir I rst ]

  # Create instance: ALU_0, and set properties
  set block_name ALU
  set block_cell_name ALU_0
  if { [catch {set ALU_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALU_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: CLK_div1_0, and set properties
  set block_name CLK_div1
  set block_cell_name CLK_div1_0
  if { [catch {set CLK_div1_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $CLK_div1_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ControlUnit_0, and set properties
  set block_name ControlUnit
  set block_cell_name ControlUnit_0
  if { [catch {set ControlUnit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ControlUnit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: DataMem_0, and set properties
  set block_name DataMem
  set block_cell_name DataMem_0
  if { [catch {set DataMem_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $DataMem_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: DisplayControl_0, and set properties
  set block_name DisplayControl
  set block_cell_name DisplayControl_0
  if { [catch {set DisplayControl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $DisplayControl_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: InsMemory_0, and set properties
  set block_name InsMemory
  set block_cell_name InsMemory_0
  if { [catch {set InsMemory_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $InsMemory_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MuxForReadData1_0, and set properties
  set block_name MuxForReadData1
  set block_cell_name MuxForReadData1_0
  if { [catch {set MuxForReadData1_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MuxForReadData1_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MuxForReadData2_0, and set properties
  set block_name MuxForReadData2
  set block_cell_name MuxForReadData2_0
  if { [catch {set MuxForReadData2_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MuxForReadData2_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MuxForWriteData_0, and set properties
  set block_name MuxForWriteData
  set block_cell_name MuxForWriteData_0
  if { [catch {set MuxForWriteData_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MuxForWriteData_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MuxForWriteReg_0, and set properties
  set block_name MuxForWriteReg
  set block_cell_name MuxForWriteReg_0
  if { [catch {set MuxForWriteReg_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MuxForWriteReg_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PC, and set properties
  set block_name PC
  set block_cell_name PC
  if { [catch {set PC [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PC eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: RegisterFile_0, and set properties
  set block_name RegisterFile
  set block_cell_name RegisterFile_0
  if { [catch {set RegisterFile_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RegisterFile_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SignZeroExtend_0, and set properties
  set block_name SignZeroExtend
  set block_cell_name SignZeroExtend_0
  if { [catch {set SignZeroExtend_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SignZeroExtend_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: avoidshake_0, and set properties
  set block_name avoidshake
  set block_cell_name avoidshake_0
  if { [catch {set avoidshake_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $avoidshake_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: choose_0, and set properties
  set block_name choose
  set block_cell_name choose_0
  if { [catch {set choose_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $choose_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_40hz_0, and set properties
  set block_name clk_40hz
  set block_cell_name clk_40hz_0
  if { [catch {set clk_40hz_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $clk_40hz_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x7seg_msg_0, and set properties
  set block_name x7seg_msg
  set block_cell_name x7seg_msg_0
  if { [catch {set x7seg_msg_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x7seg_msg_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net ALU_0_Result [get_bd_pins ALU_0/Result] [get_bd_pins DataMem_0/DataAddress] [get_bd_pins DisplayControl_0/AluResult] [get_bd_pins MuxForWriteData_0/AluData]
  connect_bd_net -net ALU_0_Sign [get_bd_pins ALU_0/Sign] [get_bd_pins ControlUnit_0/Sign]
  connect_bd_net -net ALU_0_Zero [get_bd_pins ALU_0/Zero] [get_bd_pins ControlUnit_0/Zero]
  connect_bd_net -net CLK_2 [get_bd_ports CLK] [get_bd_pins CLK_div1_0/CLK] [get_bd_pins clk_40hz_0/CLK]
  connect_bd_net -net CLK_div1_0_CLK_1k [get_bd_pins CLK_div1_0/CLK_div] [get_bd_pins x7seg_msg_0/CLK_div]
  connect_bd_net -net ControlUnit_0_AluOp [get_bd_pins ALU_0/AluOp] [get_bd_pins ControlUnit_0/AluOp]
  connect_bd_net -net ControlUnit_0_AluSrcA [get_bd_pins ControlUnit_0/AluSrcA] [get_bd_pins MuxForReadData1_0/AluSrcA]
  connect_bd_net -net ControlUnit_0_AluSrcB [get_bd_pins ControlUnit_0/AluSrcB] [get_bd_pins MuxForReadData2_0/AluSrcB]
  connect_bd_net -net ControlUnit_0_DBDataSrc [get_bd_pins ControlUnit_0/DBDataSrc] [get_bd_pins MuxForWriteData_0/DBDataSrc]
  connect_bd_net -net ControlUnit_0_ExtSel [get_bd_pins ControlUnit_0/ExtSel] [get_bd_pins SignZeroExtend_0/ExtSel]
  connect_bd_net -net ControlUnit_0_InsMemRW [get_bd_pins ControlUnit_0/InsMemRW] [get_bd_pins InsMemory_0/InsMemRW]
  connect_bd_net -net ControlUnit_0_PCSrc [get_bd_pins ControlUnit_0/PCSrc] [get_bd_pins choose_0/PCSrc]
  connect_bd_net -net ControlUnit_0_PCWre [get_bd_pins ControlUnit_0/PCWre] [get_bd_pins choose_0/PCWre]
  connect_bd_net -net ControlUnit_0_RD [get_bd_pins ControlUnit_0/RD] [get_bd_pins DataMem_0/RD]
  connect_bd_net -net ControlUnit_0_RegDst [get_bd_pins ControlUnit_0/RegDst] [get_bd_pins MuxForWriteReg_0/RegDst]
  connect_bd_net -net ControlUnit_0_RegWre [get_bd_pins ControlUnit_0/RegWre] [get_bd_pins RegisterFile_0/RegWre]
  connect_bd_net -net ControlUnit_0_WR [get_bd_pins ControlUnit_0/WR] [get_bd_pins DataMem_0/WR]
  connect_bd_net -net DataMem_0_DataOut [get_bd_pins DataMem_0/DataOut] [get_bd_pins DisplayControl_0/DbResult] [get_bd_pins MuxForWriteData_0/MemData]
  connect_bd_net -net DisplayControl_0_res [get_bd_pins DisplayControl_0/res] [get_bd_pins x7seg_msg_0/res]
  connect_bd_net -net InsMemory_0_AJshift [get_bd_pins InsMemory_0/AJshift] [get_bd_pins choose_0/AJshift]
  connect_bd_net -net InsMemory_0_immediate [get_bd_pins InsMemory_0/immediate] [get_bd_pins SignZeroExtend_0/InData]
  connect_bd_net -net InsMemory_0_op [get_bd_pins ControlUnit_0/op] [get_bd_pins InsMemory_0/op]
  connect_bd_net -net InsMemory_0_rd [get_bd_pins InsMemory_0/rd] [get_bd_pins MuxForWriteReg_0/rd]
  connect_bd_net -net InsMemory_0_rs [get_bd_pins DisplayControl_0/RsAddr] [get_bd_pins InsMemory_0/rs] [get_bd_pins RegisterFile_0/ReadReg1]
  connect_bd_net -net InsMemory_0_rt [get_bd_pins DisplayControl_0/RtAddr] [get_bd_pins InsMemory_0/rt] [get_bd_pins MuxForWriteReg_0/rt] [get_bd_pins RegisterFile_0/ReadReg2]
  connect_bd_net -net InsMemory_0_sa [get_bd_pins InsMemory_0/sa] [get_bd_pins MuxForReadData1_0/Sa]
  connect_bd_net -net MuxForReadData1_0_Result [get_bd_pins ALU_0/A] [get_bd_pins MuxForReadData1_0/Result]
  connect_bd_net -net MuxForReadData2_0_Result [get_bd_pins ALU_0/B] [get_bd_pins MuxForReadData2_0/Result]
  connect_bd_net -net MuxForWriteData_0_Result [get_bd_pins MuxForWriteData_0/Result] [get_bd_pins RegisterFile_0/WriteData]
  connect_bd_net -net MuxForWriteReg_0_Result [get_bd_pins MuxForWriteReg_0/Result] [get_bd_pins RegisterFile_0/WriteReg]
  connect_bd_net -net PC_Outputpc [get_bd_pins DisplayControl_0/NowPC] [get_bd_pins InsMemory_0/IAddress] [get_bd_pins PC/Outputpc] [get_bd_pins choose_0/Inputpc]
  connect_bd_net -net RegisterFile_0_ReadData1 [get_bd_pins DisplayControl_0/RsData] [get_bd_pins MuxForReadData1_0/Data] [get_bd_pins RegisterFile_0/ReadData1]
  connect_bd_net -net RegisterFile_0_ReadData2 [get_bd_pins DataMem_0/Datain] [get_bd_pins DisplayControl_0/RtData] [get_bd_pins MuxForReadData2_0/Data2] [get_bd_pins RegisterFile_0/ReadData2]
  connect_bd_net -net Reset_1 [get_bd_ports Reset] [get_bd_pins PC/Reset]
  connect_bd_net -net SignZeroExtend_0_OutData [get_bd_pins MuxForReadData2_0/ExtendResult] [get_bd_pins SignZeroExtend_0/OutData] [get_bd_pins choose_0/Immediate]
  connect_bd_net -net Switch_1 [get_bd_ports Switch] [get_bd_pins DataMem_0/CLK] [get_bd_pins PC/CLK] [get_bd_pins RegisterFile_0/CLK]
  connect_bd_net -net choose_0_Outputpc [get_bd_pins DisplayControl_0/NextPC] [get_bd_pins PC/Inputpc] [get_bd_pins choose_0/Outputpc]
  connect_bd_net -net clk_40hz_0_clk_40hz [get_bd_pins avoidshake_0/BJ_CLK] [get_bd_pins clk_40hz_0/clk_40hz]
  connect_bd_net -net clr_1 [get_bd_ports clr] [get_bd_pins CLK_div1_0/clr] [get_bd_pins clk_40hz_0/clr] [get_bd_pins x7seg_msg_0/clr]
  connect_bd_net -net control_1 [get_bd_ports control] [get_bd_pins DisplayControl_0/control]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins RegisterFile_0/Reset]
  connect_bd_net -net x7seg_msg_0_a_to_g [get_bd_ports a_to_g] [get_bd_pins x7seg_msg_0/a_to_g]
  connect_bd_net -net x7seg_msg_0_pos [get_bd_ports pos] [get_bd_pins x7seg_msg_0/pos]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   commentid: "",
   guistr: "# # String gsaved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port clr -pg 1 -y -190 -defaultsOSRD
preplace port rst -pg 1 -y 120 -defaultsOSRD
preplace port CLK -pg 1 -y -210 -defaultsOSRD
preplace port Reset -pg 1 -y -30 -defaultsOSRD
preplace port Switch -pg 1 -y -90 -defaultsOSRD
preplace portBus a_to_g -pg 1 -y -290 -defaultsOSRD
preplace portBus control -pg 1 -y -330 -defaultsOSRD
preplace portBus pos -pg 1 -y -270 -defaultsOSRD
preplace inst RegisterFile_0 -pg 1 -lvl 5 -y 220 -defaultsOSRD
preplace inst avoidshake_0 -pg 1 -lvl 2 -y -160 -defaultsOSRD
preplace inst clk_40hz_0 -pg 1 -lvl 1 -y -170 -defaultsOSRD
preplace inst InsMemory_0 -pg 1 -lvl 4 -y 210 -defaultsOSRD
preplace inst DataMem_0 -pg 1 -lvl 8 -y 460 -defaultsOSRD
preplace inst MuxForWriteData_0 -pg 1 -lvl 6 -y 530 -defaultsOSRD
preplace inst ControlUnit_0 -pg 1 -lvl 5 -y -180 -defaultsOSRD
preplace inst DisplayControl_0 -pg 1 -lvl 8 -y -410 -defaultsOSRD
preplace inst ALU_0 -pg 1 -lvl 7 -y 280 -defaultsOSRD
preplace inst SignZeroExtend_0 -pg 1 -lvl 4 -y 570 -defaultsOSRD
preplace inst MuxForReadData1_0 -pg 1 -lvl 6 -y 200 -defaultsOSRD
preplace inst MuxForWriteReg_0 -pg 1 -lvl 5 -y 440 -defaultsOSRD
preplace inst CLK_div1_0 -pg 1 -lvl 9 -y -480 -defaultsOSRD
preplace inst PC -pg 1 -lvl 3 -y -20 -defaultsOSRD
preplace inst x7seg_msg_0 -pg 1 -lvl 10 -y -280 -defaultsOSRD
preplace inst choose_0 -pg 1 -lvl 8 -y -170 -defaultsOSRD
preplace inst MuxForReadData2_0 -pg 1 -lvl 6 -y 370 -defaultsOSRD
preplace netloc clr_1 1 0 10 -1110 -550 NJ -550 NJ -550 NJ -550 NJ -550 NJ -550 NJ -550 NJ -550 2050J -550 2270
preplace netloc control_1 1 0 8 -1130J -350 NJ -350 NJ -350 NJ -350 NJ -350 NJ -350 NJ -350 1650
preplace netloc RegisterFile_0_ReadData2 1 5 3 930 460 NJ 460 1680J
preplace netloc clk_40hz_0_clk_40hz 1 1 1 N
preplace netloc ControlUnit_0_InsMemRW 1 3 3 180 60 NJ 60 920
preplace netloc PC_Outputpc 1 3 5 160 -490 NJ -490 NJ -490 NJ -490 1720J
preplace netloc CLK_2 1 0 9 -1120J -560 NJ -560 NJ -560 NJ -560 NJ -560 NJ -560 NJ -560 NJ -560 2040J
preplace netloc ControlUnit_0_AluSrcA 1 5 1 1000
preplace netloc rst_1 1 0 5 -1120J 100 NJ 100 NJ 100 NJ 100 520
preplace netloc SignZeroExtend_0_OutData 1 4 4 NJ 570 990J -120 NJ -120 1670J
preplace netloc ALU_0_Zero 1 4 4 600 10 NJ 10 NJ 10 1620
preplace netloc ControlUnit_0_AluSrcB 1 5 1 980
preplace netloc MuxForReadData1_0_Result 1 6 1 1350
preplace netloc Switch_1 1 0 8 NJ -90 NJ -90 -690J -90 NJ -90 560J 80 NJ 80 NJ 80 1640
preplace netloc InsMemory_0_rd 1 4 1 510
preplace netloc DataMem_0_DataOut 1 5 4 1010 110 NJ 110 1700J 110 2030J
preplace netloc InsMemory_0_op 1 4 1 510
preplace netloc ControlUnit_0_RegDst 1 4 2 580 -360 950
preplace netloc ALU_0_Sign 1 4 4 610 70 NJ 70 NJ 70 1610
preplace netloc ControlUnit_0_WR 1 5 3 NJ -110 NJ -110 1630
preplace netloc ControlUnit_0_RegWre 1 4 2 590 -340 940
preplace netloc InsMemory_0_sa 1 4 2 570J 90 970J
preplace netloc InsMemory_0_immediate 1 3 2 190 80 500
preplace netloc ControlUnit_0_AluOp 1 5 2 NJ -190 1360
preplace netloc ControlUnit_0_ExtSel 1 3 3 170 0 NJ 0 930
preplace netloc InsMemory_0_rs 1 4 4 540 -450 NJ -450 NJ -450 NJ
preplace netloc InsMemory_0_rt 1 4 4 550 -410 NJ -410 NJ -410 NJ
preplace netloc CLK_div1_0_CLK_1k 1 9 1 2260
preplace netloc ControlUnit_0_PCWre 1 5 3 NJ -270 NJ -270 1710
preplace netloc x7seg_msg_0_pos 1 10 1 N
preplace netloc MuxForWriteData_0_Result 1 4 3 600 100 NJ 100 1340
preplace netloc choose_0_Outputpc 1 2 7 -680J -470 NJ -470 NJ -470 NJ -470 NJ -470 1700J -540 2030
preplace netloc x7seg_msg_0_a_to_g 1 10 1 N
preplace netloc DisplayControl_0_res 1 8 2 NJ -410 2250
preplace netloc Reset_1 1 0 3 -1120J -20 N -20 N
preplace netloc ControlUnit_0_DBDataSrc 1 5 1 950
preplace netloc ControlUnit_0_RD 1 5 3 NJ -130 NJ -130 1650
preplace netloc ControlUnit_0_PCSrc 1 5 3 NJ -70 NJ -70 1660
preplace netloc MuxForWriteReg_0_Result 1 4 2 610 110 920
preplace netloc InsMemory_0_AJshift 1 4 4 530 -20 NJ -20 NJ -20 1720J
preplace netloc ALU_0_Result 1 5 3 1020 440 NJ 440 1690
preplace netloc MuxForReadData2_0_Result 1 6 1 1370
preplace netloc RegisterFile_0_ReadData1 1 5 3 960 -430 NJ -430 NJ
levelinfo -pg 1 -1150 -1010 -800 20 360 770 1190 1490 1880 2160 2640 2780 -top -640 -bot 620
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


