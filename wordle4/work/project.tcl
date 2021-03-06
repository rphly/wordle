set projDir "C:/Users/Bryce/Desktop/wordle/wordle4/work/vivado"
set projName "wordle4"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/au_top_0.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/reset_conditioner_1.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/led_strip_writer_2.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/beta_3.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/buttons_controller_4.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/panel_controller_5.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/alu_6.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/game_7.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/regfile_8.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/matrix_controller_9.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/pn_gen_10.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/words_11.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/button_12.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/adder_13.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/compare_14.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/boolean_15.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/shifter_16.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/matrix_17.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/button_conditioner_18.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/edge_detector_19.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/led_strip_writer_20.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/white_alphabets_21.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/yellow_alphabets_22.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/green_alphabets_23.v" "C:/Users/Bryce/Desktop/wordle/wordle4/work/verilog/pipeline_24.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Bryce/Desktop/wordle/wordle4/work/constraint/alchitry.xdc" "C:/Users/Bryce/Desktop/wordle/wordle4/constraint/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
