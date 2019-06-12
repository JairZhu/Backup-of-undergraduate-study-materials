proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir C:/Xilinx_Lab/lab_vga/lab_vga.cache/wt [current_project]
  set_property parent.project_dir C:/Xilinx_Lab/lab_vga [current_project]
  add_files -quiet C:/Xilinx_Lab/lab_vga/lab_vga.runs/synth_1/vga.dcp
  add_files -quiet C:/Xilinx_Lab/lab_vga/lab_vga.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp
  set_property netlist_only true [get_files C:/Xilinx_Lab/lab_vga/lab_vga.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp]
  read_xdc -mode out_of_context -ref clk_wiz_0 -cells inst c:/Xilinx_Lab/lab_vga/lab_vga.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc
  set_property processing_order EARLY [get_files c:/Xilinx_Lab/lab_vga/lab_vga.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]
  read_xdc -ref clk_wiz_0 -cells inst c:/Xilinx_Lab/lab_vga/lab_vga.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc
  set_property processing_order EARLY [get_files c:/Xilinx_Lab/lab_vga/lab_vga.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_0 -cells inst c:/Xilinx_Lab/lab_vga/lab_vga.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc
  set_property processing_order EARLY [get_files c:/Xilinx_Lab/lab_vga/lab_vga.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
  read_xdc C:/Xilinx_Lab/lab_vga/lab_vga.srcs/constrs_1/imports/file_vga/vga.xdc
  link_design -top vga -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  catch {update_ip_catalog -quiet -current_ip_cache {c:/Xilinx_Lab/lab_vga/lab_vga.cache} }
  opt_design 
  write_checkpoint -force vga_opt.dcp
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force vga_placed.dcp
  catch { report_io -file vga_io_placed.rpt }
  catch { report_clock_utilization -file vga_clock_utilization_placed.rpt }
  catch { report_utilization -file vga_utilization_placed.rpt -pb vga_utilization_placed.pb }
  catch { report_control_sets -verbose -file vga_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force vga_routed.dcp
  catch { report_drc -file vga_drc_routed.rpt -pb vga_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -file vga_timing_summary_routed.rpt -pb vga_timing_summary_routed.pb }
  catch { report_power -file vga_power_routed.rpt -pb vga_power_summary_routed.pb }
  catch { report_route_status -file vga_route_status.rpt -pb vga_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  write_bitstream -force vga.bit 
  if { [file exists C:/Xilinx_Lab/lab_vga/lab_vga.runs/synth_1/vga.hwdef] } {
    catch { write_sysdef -hwdef C:/Xilinx_Lab/lab_vga/lab_vga.runs/synth_1/vga.hwdef -bitfile vga.bit -meminfo vga_bd.bmm -file vga.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

