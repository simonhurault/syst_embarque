# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/cygwin/home/simon/plasma/vhdl/plasma_hw.cache/wt [current_project]
set_property parent.project_path C:/cygwin/home/simon/plasma/vhdl/plasma_hw.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/cygwin/home/simon/plasma/vhdl/plasma_hw.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files -quiet C:/cygwin/home/simon/plasma/vhdl/plasma_hw.srcs/sources_1/ip/RAM_PROGRAM/RAM_PROGRAM.dcp
set_property used_in_implementation false [get_files C:/cygwin/home/simon/plasma/vhdl/plasma_hw.srcs/sources_1/ip/RAM_PROGRAM/RAM_PROGRAM.dcp]
read_vhdl -library xil_defaultlib {
  C:/cygwin/home/simon/plasma/vhdl/mlite_pack.vhd
  C:/cygwin/home/simon/plasma/vhdl/shifter.vhd
  C:/cygwin/home/simon/plasma/vhdl/reg_bank.vhd
  C:/cygwin/home/simon/plasma/vhdl/pipeline.vhd
  C:/cygwin/home/simon/plasma/vhdl/pc_next.vhd
  C:/cygwin/home/simon/plasma/vhdl/mult.vhd
  C:/cygwin/home/simon/plasma/vhdl/mem_ctrl.vhd
  C:/cygwin/home/simon/plasma/vhdl/control.vhd
  C:/cygwin/home/simon/plasma/vhdl/bus_mux.vhd
  C:/cygwin/home/simon/plasma/vhdl/alu.vhd
  C:/cygwin/home/simon/plasma/vhdl/uart.vhd
  C:/cygwin/home/simon/plasma/vhdl/ram_image.vhd
  C:/cygwin/home/simon/plasma/vhdl/mlite_cpu.vhd
  C:/cygwin/home/simon/plasma/vhdl/eth_dma.vhd
  C:/cygwin/home/simon/plasma/vhdl/cache.vhd
  C:/cygwin/home/simon/plasma/vhdl/7seg/clk50.vhd
  C:/cygwin/home/simon/plasma/vhdl/7seg/gestion_an.vhd
  C:/cygwin/home/simon/plasma/vhdl/7seg/clk190.vhd
  C:/cygwin/home/simon/plasma/vhdl/7seg/hex7seg.vhd
  C:/cygwin/home/simon/plasma/vhdl/7seg/mux_7.vhd
  C:/cygwin/home/simon/plasma/vhdl/7seg/cpt.vhd
  C:/cygwin/home/simon/plasma/vhdl/Clkdiv.vhd
  C:/cygwin/home/simon/plasma/vhdl/plasma.vhd
  C:/cygwin/home/simon/plasma/vhdl/7seg/7seg_top.vhd
  C:/cygwin/home/simon/plasma/vhdl/plasma_hw.srcs/sources_1/new/plasma_basys3.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/cygwin/home/simon/plasma/vhdl/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/cygwin/home/simon/plasma/vhdl/Basys3_Master.xdc]


synth_design -top plasma_basys3 -part xc7a35tcpg236-1


write_checkpoint -force -noxdef plasma_basys3.dcp

catch { report_utilization -file plasma_basys3_utilization_synth.rpt -pb plasma_basys3_utilization_synth.pb }
