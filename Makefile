all: clean
	
clean: 
	\rm -rf simv* csrc

run: clean
	vcs Toplevel.v Taus.v LOG_POLY.sv SQRT_POLY.sv SinBlock.v TausTB.v +v2k -sverilog -debug_all -timescale=1ns/1ps 
	./simv -gui&

lzd: clean
	vcs LZD.v LZDTB.v +v2k -debug_all -timescale=1ns/1ps 
	./simv

sincos: clean
	vcs SinBlock.v SinTB.v +v2k -sverilog -debug_all -timescale=1ns/1ps 
	./simv -gui&


