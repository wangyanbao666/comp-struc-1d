set projDir "E:/comp\ struc/project/alu2/work/vivado"
set projName "alu2"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "E:/comp\ struc/project/alu2/work/verilog/au_top_0.v" "E:/comp\ struc/project/alu2/work/verilog/fsm_combine_1.v" "E:/comp\ struc/project/alu2/work/verilog/reset_conditioner_2.v" "E:/comp\ struc/project/alu2/work/verilog/input_mode_3.v" "E:/comp\ struc/project/alu2/work/verilog/fsm_test_4.v" "E:/comp\ struc/project/alu2/work/verilog/button_conditioner_5.v" "E:/comp\ struc/project/alu2/work/verilog/edge_detector_6.v" "E:/comp\ struc/project/alu2/work/verilog/multi_seven_seg_7.v" "E:/comp\ struc/project/alu2/work/verilog/time_countdown_8.v" "E:/comp\ struc/project/alu2/work/verilog/random_choose_9.v" "E:/comp\ struc/project/alu2/work/verilog/alu_10.v" "E:/comp\ struc/project/alu2/work/verilog/counter_11.v" "E:/comp\ struc/project/alu2/work/verilog/rom_12.v" "E:/comp\ struc/project/alu2/work/verilog/pipeline_13.v" "E:/comp\ struc/project/alu2/work/verilog/counter_14.v" "E:/comp\ struc/project/alu2/work/verilog/seven_seg_15.v" "E:/comp\ struc/project/alu2/work/verilog/decoder_16.v" "E:/comp\ struc/project/alu2/work/verilog/pn_gen_17.v" "E:/comp\ struc/project/alu2/work/verilog/random_rom_18.v" "E:/comp\ struc/project/alu2/work/verilog/adder_19.v" "E:/comp\ struc/project/alu2/work/verilog/comparator_20.v" "E:/comp\ struc/project/alu2/work/verilog/boolean_21.v" "E:/comp\ struc/project/alu2/work/verilog/shifter_22.v" "E:/comp\ struc/project/alu2/work/verilog/flip_23.v" "E:/comp\ struc/project/alu2/work/verilog/find_neighbor_24.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "E:/comp\ struc/project/alu2/work/constraint/alchitry.xdc" "E:/comp\ struc/project/alu2/work/constraint/io.xdc" "E:/comp\ struc/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
