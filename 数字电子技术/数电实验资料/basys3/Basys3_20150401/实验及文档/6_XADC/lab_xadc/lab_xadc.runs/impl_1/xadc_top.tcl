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
  set_property webtalk.parent_dir C:/Xilinx_Lab/lab_xadc/lab_xadc.cache/wt [current_project]
  set_property parent.project_dir C:/Xilinx_Lab/lab_xadc [current_project]
  add_files -quiet C:/Xilinx_Lab/lab_xadc/lab_xadc.runs/synth_1/xadc_top.dcp
  add_files -quiet C:/Xilinx_Lab/lab_xadc/lab_xadc.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp
  set_property netlist_only true [get_files C:/Xilinx_Lab/lab_xadc/lab_xadc.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp]
  read_xdc -mode out_of_context -ref clk_wiz_0 -cells inst c:/Xilinx_Lab/lab_xadc/lab_xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc
  set_property processing_order EARLY [get_files c:/Xilinx_Lab/lab_xadc/lab_xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]
  read_xdc -ref clk_wiz_0 -cells inst c:/Xilinx_Lab/lab_xadc/lab_xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc
  set_property processing_order EARLY [get_files c:/Xilinx_Lab/lab_xadc/lab_xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_0 -cells inst c:/Xilinx_Lab/lab_xadc/lab_xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc
  set_property processing_order EARLY [get_files c:/Xilinx_Lab/lab_xadc/lab_xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
  read_xdc C:/Xilinx_Lab/lab_xadc/lab_xadc.srcs/constrs_1/imports/file_xadc/ug480.xdc
  link_design -top xadc_top -part xc7a35tcpg236-1
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
  catch {update_ip_catalog -quiet -current_ip_cache {c:/Xilinx_Lab/lab_xadc/lab_xadc.cache} }
  opt_design 
  write_checkpoint -force xadc_top_opt.dcp
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
  write_checkpoint -force xadc_top_placed.dcp
  catch { report_io -file xadc_top_io_placed.rpt }
  catch { report_clock_utilization -file xadc_top_clock_utilization_placed.rpt }
  catch { report_utilization -file xadc_top_utilization_placed.rpt -pb xadc_top_utilization_placed.pb }
  catch { report_control_sets -verbose -file xadc_top_control_sets_placed.rpt }
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
  write_checkpoint -force xadc_top_routed.dcp
  catch { report_drc -file xadc_top_drc_routed.rpt -pb xadc_top_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -file xadc_top_timing_summary_routed.rpt -pb xadc_top_timing_summary_routed.pb }
  catch { report_power -file xadc_top_power_routed.rpt -pb xadc_top_power_summary_routed.pb }
  catch { report_route_status -file xadc_top_route_status.rpt -pb xadc_top_route_status.pb }
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
  write_bitstream -force xadc_top.bit 
  if { [file exists C:/Xilinx_Lab/lab_xadc/lab_xadc.runs/synth_1/xadc_top.hwdef] } {
    catch { write_sysdef -hwdef C:/Xilinx_Lab/lab_xadc/lab_xadc.runs/synth_1/xadc_top.hwdef -bitfile xadc_top.bit -meminfo xadc_top_bd.bmm -file xadc_top.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

