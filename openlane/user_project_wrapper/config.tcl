# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_project_wrapper
set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(PDN_CFG) $script_dir/pdn.tcl
set ::env(FP_PDN_CORE_RING) 1
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 2920 3520"

set ::unit 2.4
set ::env(FP_IO_VEXTEND) [expr 2*$::unit]
set ::env(FP_IO_HEXTEND) [expr 2*$::unit]
set ::env(FP_IO_VLENGTH) $::unit
set ::env(FP_IO_HLENGTH) $::unit

set ::env(FP_IO_VTHICKNESS_MULT) 4
set ::env(FP_IO_HTHICKNESS_MULT) 4

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i"

set ::env(CLOCK_PERIOD) "10"
set ::env(ROUTING_CORES) 12

set ::env(SYNTH_STRATEGY) 3

#0.185
set ::env(PL_TARGET_DENSITY) 0.15
set ::env(GLB_RT_ADJUSTMENT) 0.4
set ::env(GLB_RT_MAXLAYER) 5

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 1
set ::env(PSN_ENABLE_PIN_SWAP) 0

# Need to fix a FastRoute bug for this to work, but it's good
# for a sense of "isolation"
set ::env(MAGIC_ZEROIZE_ORIGIN) 0
set ::env(MAGIC_WRITE_FULL_LEF) 0

# to be REMOVED -- just to get over magic hanging
set ::env(MAGIC_GENERATE_LEF) 0

set ::env(SYNTH_READ_BLACKBOX_LIB) 1
set ::env(SYNTH_DEFINES) "NO_HC_CACHE"

set ::env(VERILOG_FILES) "\
    $script_dir/../../verilog/rtl/acc/AHB_SPM.v
    $script_dir/../../verilog/rtl/IPs/AHBSRAM.v
    $script_dir/../../verilog/rtl/IPs/GPIO.v
    $script_dir/../../verilog/rtl/IPs/RAM_1024x64.v
    $script_dir/../../verilog/rtl/IPs/DFFRAMBB.v
    $script_dir/../../verilog/rtl/IPs/QSPI_XIP_CTRL.v
    $script_dir/../../verilog/rtl/AHB_sys_0/*.v
    $script_dir/../../verilog/rtl/el2_n5_soc_wrapper.v
    $script_dir/../../verilog/rtl/soc_core.v
    $script_dir/../../verilog/rtl/user_project_wrapper.v"

set ::env(VERILOG_FILES_BLACKBOX) "\
	$script_dir/../../verilog/rtl/IPs/DFFRAM_4K.v
	$script_dir/../../verilog/rtl/IPs/DMC_32x16.v
	$script_dir/../../verilog/rtl/el2.v
	$script_dir/../../verilog/rtl/AHB_sys_0/APB_sys_0/APB_sys_0.v"

set ::env(EXTRA_LEFS) "\
    $script_dir/../../lef/apb_sys_0.lef
	$script_dir/../../lef/DFFRAM_4K.lef
	$script_dir/../../lef/el2_swerv_wrapper.lef
	$script_dir/../../lef/DMC_32x16.lef"

set ::env(EXTRA_GDS_FILES) "\
	$script_dir/../../gds/apb_sys_0.gds
	$script_dir/../../gds/DFFRAM_4K.gds
	$script_dir/../../gds/el2_swerv_wrapper.gds
 	$script_dir/../../gds/DMC_32x16.gds"
 	
set ::env(DIODE_INSERTION_STRATEGY) "4"
