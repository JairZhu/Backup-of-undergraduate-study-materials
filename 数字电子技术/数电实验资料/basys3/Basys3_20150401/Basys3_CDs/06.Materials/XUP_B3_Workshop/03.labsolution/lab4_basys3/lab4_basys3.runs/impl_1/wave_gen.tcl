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
  set_property webtalk.parent_dir C:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.cache/wt [current_project]
  set_property parent.project_dir C:/xup/fpga_flow/labs/lab4_basys3 [current_project]
  add_files -quiet C:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.runs/synth_1/wave_gen.dcp
  add_files -quiet C:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.runs/clk_core_synth_1/clk_core.dcp
  set_property netlist_only true [get_files C:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.runs/clk_core_synth_1/clk_core.dcp]
  read_xdc -ref char_fifo -cells U0 c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/char_fifo/char_fifo/char_fifo.xdc
  set_property processing_order EARLY [get_files c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/char_fifo/char_fifo/char_fifo.xdc]
  read_xdc -mode out_of_context -ref clk_core -cells inst c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/clk_core_0/clk_core_ooc.xdc
  set_property processing_order EARLY [get_files c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/clk_core_0/clk_core_ooc.xdc]
  read_xdc -ref clk_core -cells inst c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/clk_core_0/clk_core.xdc
  set_property processing_order EARLY [get_files c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/clk_core_0/clk_core.xdc]
  read_xdc -prop_thru_buffers -ref clk_core -cells inst c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/clk_core_0/clk_core_board.xdc
  set_property processing_order EARLY [get_files c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/clk_core_0/clk_core_board.xdc]
  read_xdc C:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/constrs_1/imports/lab4/wave_gen_timing.xdc
  read_xdc C:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/constrs_1/imports/lab4/wave_gen_pins_basys3.xdc
  read_xdc -ref char_fifo -cells U0 c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/char_fifo/char_fifo/char_fifo_clocks.xdc
  set_property processing_order LATE [get_files c:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.srcs/sources_1/ip/char_fifo/char_fifo/char_fifo_clocks.xdc]
  link_design -top wave_gen -part xc7a35tcpg236-1
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
  catch {update_ip_catalog -quiet -current_ip_cache {c:/xup/fpga_flow/labs/lab4/lab4.cache} }
  opt_design 
  write_checkpoint -force wave_gen_opt.dcp
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
  write_checkpoint -force wave_gen_placed.dcp
  catch { report_io -file wave_gen_io_placed.rpt }
  catch { report_clock_utilization -file wave_gen_clock_utilization_placed.rpt }
  catch { report_utilization -file wave_gen_utilization_placed.rpt -pb wave_gen_utilization_placed.pb }
  catch { report_control_sets -verbose -file wave_gen_control_sets_placed.rpt }
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
  write_checkpoint -force wave_gen_routed.dcp
  catch { report_drc -file wave_gen_drc_routed.rpt -pb wave_gen_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -file wave_gen_timing_summary_routed.rpt -pb wave_gen_timing_summary_routed.pb }
  catch { report_power -file wave_gen_power_routed.rpt -pb wave_gen_power_summary_routed.pb }
  catch { report_route_status -file wave_gen_route_status.rpt -pb wave_gen_route_status.pb }
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
  write_bitstream -force wave_gen.bit 
  if { [file exists C:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.runs/synth_1/wave_gen.hwdef] } {
    catch { write_sysdef -hwdef C:/xup/fpga_flow/labs/lab4_basys3/lab4_basys3.runs/synth_1/wave_gen.hwdef -bitfile wave_gen.bit -meminfo wave_gen_bd.bmm -file wave_gen.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

