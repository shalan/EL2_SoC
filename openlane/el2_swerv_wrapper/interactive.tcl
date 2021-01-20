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

package require openlane
set script_dir [file dirname [file normalize [info script]]]

prep -design $script_dir -tag el2_swerv_wrapper -overwrite
set save_path $script_dir/../..

verilog_elaborate

run_floorplan
run_placement
run_cts
run_routing

if { ($::env(DIODE_INSERTION_STRATEGY) == 2) || ($::env(DIODE_INSERTION_STRATEGY) == 5) } {
    run_antenna_check
    heal_antenna_violators; # modifies the routed DEF
}

if { $::env(LVS_INSERT_POWER_PINS) } {
    write_powered_verilog
    set_netlist $::env(lvs_result_file_tag).powered.v
}

run_magic

run_magic_spice_export

save_views       -lef_path $::env(magic_result_file_tag).lef \
                 -def_path $::env(tritonRoute_result_file_tag).def \
                 -gds_path $::env(magic_result_file_tag).gds \
                 -mag_path $::env(magic_result_file_tag).mag \
                 -save_path $save_path \
                 -tag $::env(RUN_TAG)

# Physical verification

run_magic_drc

run_lvs; # requires run_magic_spice_export

run_antenna_check

run_lef_cvc

generate_final_summary_report
