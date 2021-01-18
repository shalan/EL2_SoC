set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) el2_n5_soc_wrapper
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 1200 1400"
#set ::env(DIE_AREA) "0 0 1200 1400"

set ::env(GLB_RT_OBS) "met5 $::env(DIE_AREA)"

set ::env(CLOCK_PORT) "HCLK"
set ::env(CLOCK_NET) "HCLK"

set ::env(CLOCK_PERIOD) "8"

set ::env(ROUTING_CORES) 12

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0

set ::env(SYNTH_STRATEGY) 3

set ::env(PL_TARGET_DENSITY) 0.4
#set ::env(PL_TARGET_DENSITY) 0.4
set ::env(CELL_PAD) 0

set ::env(DESIGN_IS_CORE) 0
# Need to fix a FastRoute bug for this to work, but it's good
# for a sense of "isolation"
set ::env(MAGIC_ZEROIZE_ORIGIN) 0
set ::env(MAGIC_WRITE_FULL_LEF) 0
set ::env(SYNTH_READ_BLACKBOX_LIB) 1

set ::env(VERILOG_FILES) "\
   $script_dir/../../verilog/rtl/el2_n5_soc_wrapper.v
   $script_dir/../../verilog/rtl/el2.v"

#set ::env(VERILOG_FILES_BLACKBOX) "$script_dir/../../verilog/rtl/ibex/ibex_fetch_fifo.v"
    
set ::env(GLB_RT_MAXLAYER) 5
set ::env(GLB_RT_ADJUSTMENT) 0.35

set ::env(PDN_CFG) $script_dir/pdn.tcl
 	
set ::env(DIODE_INSERTION_STRATEGY) "4"
