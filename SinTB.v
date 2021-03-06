/* Testbench for sin block */

module tb();

reg clk, reset;
reg [15:0] x;
wire [15:0] sineValue;
reg func;

initial begin

	clk = 1'b0;
	reset = 1'b1;

	#30; reset = 1'b0; func = 1'b0;
	#20; x = 16'b0000_0000_0000_0000;
	#20; x = 16'b0000_1000_1100_0000;
	#20; x = 16'b0011_1111_1111_1110;
	#20; x = 16'b0000_0000_0110_1110;

	#20; x = 16'b0100_0000_0000_0000;
	#20; x = 16'b0100_1000_1100_0000;
	#20; x = 16'b0111_1111_1111_1110;
	#20; x = 16'b0100_0000_0110_1110;

	#20; x = 16'b1000_0000_0000_0000;
	#20; x = 16'b1000_1000_1100_0000;
	#20; x = 16'b1011_1111_1111_1110;
	#20; x = 16'b1000_0000_0110_1110;

	#20; x = 16'b1100_0000_0000_0000;
	#20; x = 16'b1100_1000_1100_0000;
	#20; x = 16'b1111_1111_1111_1110;
	#20; x = 16'b1100_0000_0110_1110;


	#20; func = 1'b1;
	x = 16'b0000_0000_0000_0000;
	#20; x = 16'b0000_1000_1100_0000;
	#20; x = 16'b0011_1111_1111_1110;
	#20; x = 16'b0000_0000_0110_1110;

	#20; x = 16'b0100_0000_0000_0000;
	#20; x = 16'b0100_1000_1100_0000;
	#20; x = 16'b0111_1111_1111_1110;
	#20; x = 16'b0100_0000_0110_1110;

	#20; x = 16'b1000_0000_0000_0000;
	#20; x = 16'b1000_1000_1100_0000;
	#20; x = 16'b1011_1111_1111_1110;
	#20; x = 16'b1000_0000_0110_1110;

	#20; x = 16'b1100_0000_0000_0000;
	#20; x = 16'b1100_1000_1100_0000;
	#20; x = 16'b1111_1111_1111_1110;
	#20; x = 16'b1100_0000_0110_1110;


	#80; $finish;
end

always #10 clk = !clk;

always @(posedge clk)	if(func==1'b0) $display("Sin = %b\n", sineValue);

always @(posedge clk)	if(func==1'b1) $display("Cos = %b\n", sineValue);

SinBlock s1(clk, reset, func, x, sineValue);

endmodule
