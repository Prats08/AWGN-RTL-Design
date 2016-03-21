set link_library {   *    lsi_10k.db }
set target_library {  lsi_10k.db  } 
read_file -format sverilog LOG_POLY.sv
create_clock clk -period 50
set_input_delay -clock clk 0 [all_inputs]
set_output_delay -clock clk 0 [all_outputs]
compile
report_area
report_timing
report_resources
write -f verilog -hier -out LOG_NETLIST.v

