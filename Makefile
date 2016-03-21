all: clean
	
clean: 
	\rm -rf simv* csrc

run: clean
	vcs Toplevel.v Taus.v LOG_POLY.sv SQRT_POLY.sv SinBlock.sv TausTB.v +v2k -sverilog -debug_all -timescale=1ns/1ps 
	./simv -gui&
	dc_shell-t

AWGN: clean
	vcs AWGN.sv TausTB.v +v2k -sverilog -debug_all -timescale=1ns/1ps 
	./simv -gui&
	dc_shell-t

netlist: clean
	vcs AWGN_NETLIST.v TausTB.v lsi_10k.v +v2k -sverilog -debug_all -timescale=1ns/1ps 
	./simv -gui&

