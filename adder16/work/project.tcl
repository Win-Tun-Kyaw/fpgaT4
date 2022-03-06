set projDir "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/vivado"
set projName "adder16"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/au_top_0.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/reset_conditioner_1.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/button_conditioner_2.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/multi_seven_seg_3.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/addertest_4.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/pipeline_5.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/counter_6.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/seven_seg_7.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/decoder_8.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/sixteen_bit_full_adder_9.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/verilog/edge_detector_10.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/constraint/alchitry.xdc" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/comp\ struct\ 50.002/fpgaT4/adder16/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
