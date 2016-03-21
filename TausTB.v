/* 32-bit Tausworthe Uniform Random Number Generator Testbench */

module tb();

reg reset, clk;

initial begin

	clk = 0;
	reset = 1;

	#60;

	reset = 0;

	#1000;

	$finish;
end

always #10 clk = !clk;

wire valid;
wire [15:0] X0, X1;

AWGN a1(clk, reset, valid, X0, X1);

endmodule
