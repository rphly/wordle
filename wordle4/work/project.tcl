set projDir "C:/Users/Bryce/Desktop/wordle/wordle4/work/vivado"
set projName "wordle4"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/au_top_0.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/reset_conditioner_1.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/beta_2.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/buttons_controller_3.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/alu_4.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/game_5.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/regfile_6.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/matrix_controller_7.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/button_8.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/adder_9.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/compare_10.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/boolean_11.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/shifter_12.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/matrix_13.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/button_conditioner_14.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/edge_detector_15.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/led_strip_writer_16.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/white_alphabets_17.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/pipeline_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Bryce/Desktop/wordle/wordle4/work/constraint/alchitry.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
