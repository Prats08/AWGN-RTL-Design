/* Testbench for sin block */

module tb();

reg clk, reset;
reg [30:0] x;
wire [16:0] SqrtValue;

initial begin

	clk = 1'b0;
	reset = 1'b1;

	#30; reset = 1'b0;

	x = 31'b111111_11_11111111_11111111_1111111; // 128
	#20;
	x = 31'b00000010_00000000_00000000_0000000; // 1
	#20;
	x = 31'b00000100_00000000_00000000_0000000; // 2
	#20;
	x = 31'b00001000_00000000_00000000_0000000; // 4
	#20;
	x = 31'b00010010_00000000_00000000_0000000; // 9
	#20;
	x = 31'b01000110_00000000_00000000_0000000; // 35
	#20;

	#20; $finish;
end

always #10 clk = !clk;

always @(posedge clk)
	$display("Sqrt = %b", SqrtValue);

SQRT_POLY l1(clk, reset, x, SqrtValue);

endmodule
