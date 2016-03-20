/* Verilog code for The Logarithm block of AWGN Project

	Log takes input of 31 bits in Q23 format.
	Output is 17 bits wide in Q13 format.

	Method: Polyfit coffecients are found using MATLAB. A memory is created to store those coefficients.

	Latency = 3;

*/


module SQRT_POLY(input clk, input reset, input [30:0] RootIn, output reg [16:0] RootOut);

bit [11:0] Sqrt_C1[64];
bit [19:0] Sqrt_C0[64];

reg [42:0] Term1;
reg [19:0] Term2;

reg [42:0] Term11;
reg [19:0] Term21;
reg [12:0] Root;

reg [13:0] FractionBit;
reg [3:0] IntegerBits;

always @(posedge clk)
begin
	if(!reset)
	begin

		// Cycle 1
		Term1 <= RootIn * Sqrt_C1[RootIn[30:25]];
		Term2 <= Sqrt_C0[RootIn[30:25]];


		// Cycle 2
		FractionBit <= Term1[35:23] + Term2[16:4];
		//Pipelining
		Term11 <= Term1;
		Term21 <= Term2;

		// Cycle 3
		IntegerBits <=  Term11[39:36] + Term21[19:17] + FractionBit[13];
		Root[12:0] <=  FractionBit[12:0];	// Pipelining

		RootOut[12:0] <= Root[12:0];		
		RootOut[16:13] <= IntegerBits[3:0];

	end

	else begin

	// C1 Coefficient Table

		Sqrt_C1[0] <= 12'b100100010001;
		Sqrt_C1[1] <= 12'b010010101001;
		Sqrt_C1[2] <= 12'b001110010111;
		Sqrt_C1[3] <= 12'b001100000111;
		Sqrt_C1[4] <= 12'b001010101011;
		Sqrt_C1[5] <= 12'b001001101010;
		Sqrt_C1[6] <= 12'b001000111000;
		Sqrt_C1[7] <= 12'b001000010001;
		Sqrt_C1[8] <= 12'b000111110001;
		Sqrt_C1[9] <= 12'b000111010110;
		Sqrt_C1[10] <= 12'b000110111111;
		Sqrt_C1[11] <= 12'b000110101011;
		Sqrt_C1[12] <= 12'b000110011010;
		Sqrt_C1[13] <= 12'b000110001010;
		Sqrt_C1[14] <= 12'b000101111100;
		Sqrt_C1[15] <= 12'b000101110000;
		Sqrt_C1[16] <= 12'b000101100101;
		Sqrt_C1[17] <= 12'b000101011010;
		Sqrt_C1[18] <= 12'b000101010001;
		Sqrt_C1[19] <= 12'b000101001000;
		Sqrt_C1[20] <= 12'b000101000000;
		Sqrt_C1[21] <= 12'b000100111000;
		Sqrt_C1[22] <= 12'b000100110001;
		Sqrt_C1[23] <= 12'b000100101011;
		Sqrt_C1[24] <= 12'b000100100101;
		Sqrt_C1[25] <= 12'b000100011111;
		Sqrt_C1[26] <= 12'b000100011001;
		Sqrt_C1[27] <= 12'b000100010100;
		Sqrt_C1[28] <= 12'b000100001111;
		Sqrt_C1[29] <= 12'b000100001011;
		Sqrt_C1[30] <= 12'b000100000110;
		Sqrt_C1[31] <= 12'b000100000010;
		Sqrt_C1[32] <= 12'b000011111110;
		Sqrt_C1[33] <= 12'b000011111010;
		Sqrt_C1[34] <= 12'b000011110111;
		Sqrt_C1[35] <= 12'b000011110011;
		Sqrt_C1[36] <= 12'b000011110000;
		Sqrt_C1[37] <= 12'b000011101100;
		Sqrt_C1[38] <= 12'b000011101001;
		Sqrt_C1[39] <= 12'b000011100110;
		Sqrt_C1[40] <= 12'b000011100100;
		Sqrt_C1[41] <= 12'b000011100001;
		Sqrt_C1[42] <= 12'b000011011110;
		Sqrt_C1[43] <= 12'b000011011100;
		Sqrt_C1[44] <= 12'b000011011001;
		Sqrt_C1[45] <= 12'b000011010111;
		Sqrt_C1[46] <= 12'b000011010100;
		Sqrt_C1[47] <= 12'b000011010010;
		Sqrt_C1[48] <= 12'b000011010000;
		Sqrt_C1[49] <= 12'b000011001110;
		Sqrt_C1[50] <= 12'b000011001100;
		Sqrt_C1[51] <= 12'b000011001010;
		Sqrt_C1[52] <= 12'b000011001000;
		Sqrt_C1[53] <= 12'b000011000110;
		Sqrt_C1[54] <= 12'b000011000100;
		Sqrt_C1[55] <= 12'b000011000010;
		Sqrt_C1[56] <= 12'b000011000001;
		Sqrt_C1[57] <= 12'b000010111111;
		Sqrt_C1[58] <= 12'b000010111101;
		Sqrt_C1[59] <= 12'b000010111100;
		Sqrt_C1[60] <= 12'b000010111010;
		Sqrt_C1[61] <= 12'b000010111001;
		Sqrt_C1[62] <= 12'b000010110111;
		Sqrt_C1[63] <= 12'b000010110110;

	// C0 Coefficient Table

		Sqrt_C0[0] <= 20'b00001100000001100001;
		Sqrt_C0[1] <= 20'b00011011001101011001;
		Sqrt_C0[2] <= 20'b00100011100011000010;
		Sqrt_C0[3] <= 20'b00101010001100011011;
		Sqrt_C0[4] <= 20'b00101111111001111101;
		Sqrt_C0[5] <= 20'b00110100111111110000;
		Sqrt_C0[6] <= 20'b00111001101000100111;
		Sqrt_C0[7] <= 20'b00111101111011001000;
		Sqrt_C0[8] <= 20'b01000001111011101111;
		Sqrt_C0[9] <= 20'b01000101101101100011;
		Sqrt_C0[10] <= 20'b01001001010010110111;
		Sqrt_C0[11] <= 20'b01001100101101011101;
		Sqrt_C0[12] <= 20'b01001111111110101101;
		Sqrt_C0[13] <= 20'b01010011000111101101;
		Sqrt_C0[14] <= 20'b01010110001001010111;
		Sqrt_C0[15] <= 20'b01011001000100011101;
		Sqrt_C0[16] <= 20'b01011011111001100101;
		Sqrt_C0[17] <= 20'b01011110101001010010;
		Sqrt_C0[18] <= 20'b01100001010100000010;
		Sqrt_C0[19] <= 20'b01100011111010001101;
		Sqrt_C0[20] <= 20'b01100110011100001011;
		Sqrt_C0[21] <= 20'b01101000111010001111;
		Sqrt_C0[22] <= 20'b01101011010100101010;
		Sqrt_C0[23] <= 20'b01101101101011101100;
		Sqrt_C0[24] <= 20'b01101111111111100010;
		Sqrt_C0[25] <= 20'b01110010010000011000;
		Sqrt_C0[26] <= 20'b01110100011110011010;
		Sqrt_C0[27] <= 20'b01110110101001110010;
		Sqrt_C0[28] <= 20'b01111000110010101010;
		Sqrt_C0[29] <= 20'b01111010111001001001;
		Sqrt_C0[30] <= 20'b01111100111101010111;
		Sqrt_C0[31] <= 20'b01111110111111011011;
		Sqrt_C0[32] <= 20'b10000000111111011100;
		Sqrt_C0[33] <= 20'b10000010111101100000;
		Sqrt_C0[34] <= 20'b10000100111001101101;
		Sqrt_C0[35] <= 20'b10000110110100000111;
		Sqrt_C0[36] <= 20'b10001000101100110011;
		Sqrt_C0[37] <= 20'b10001010100011110110;
		Sqrt_C0[38] <= 20'b10001100011001010101;
		Sqrt_C0[39] <= 20'b10001110001101010010;
		Sqrt_C0[40] <= 20'b10001111111111110010;
		Sqrt_C0[41] <= 20'b10010001110000111000;
		Sqrt_C0[42] <= 20'b10010011100000100111;
		Sqrt_C0[43] <= 20'b10010101001111000010;
		Sqrt_C0[44] <= 20'b10010110111100001101;
		Sqrt_C0[45] <= 20'b10011000101000001010;
		Sqrt_C0[46] <= 20'b10011010010010111011;
		Sqrt_C0[47] <= 20'b10011011111100100011;
		Sqrt_C0[48] <= 20'b10011101100101000100;
		Sqrt_C0[49] <= 20'b10011111001100100000;
		Sqrt_C0[50] <= 20'b10100000110010111010;
		Sqrt_C0[51] <= 20'b10100010011000010100;
		Sqrt_C0[52] <= 20'b10100011111100101110;
		Sqrt_C0[53] <= 20'b10100101100000001100;
		Sqrt_C0[54] <= 20'b10100111000010101111;
		Sqrt_C0[55] <= 20'b10101000100100011000;
		Sqrt_C0[56] <= 20'b10101010000101001001;
		Sqrt_C0[57] <= 20'b10101011100101000011;
		Sqrt_C0[58] <= 20'b10101101000100001000;
		Sqrt_C0[59] <= 20'b10101110100010011001;
		Sqrt_C0[60] <= 20'b10101111111111111000;
		Sqrt_C0[61] <= 20'b10110001011100100110;
		Sqrt_C0[62] <= 20'b10110010111000100011;
		Sqrt_C0[63] <= 20'b10110100010011110010;

	end
end
endmodule
