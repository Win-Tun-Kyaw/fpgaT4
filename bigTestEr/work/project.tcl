set projDir "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/vivado"
set projName "bigTestEr"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/au_top_0.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/reset_conditioner_1.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/button_conditioner_2.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/multi_seven_seg_3.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/masterTest_4.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/pipeline_5.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/counter_6.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/seven_seg_7.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/decoder_8.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/edge_detector_9.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/addertest_10.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/shifterTest_11.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/sixteen_bit_full_adder_12.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/verilog/shifter16_13.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/constraint/alchitry.xdc" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/bigTestEr/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
