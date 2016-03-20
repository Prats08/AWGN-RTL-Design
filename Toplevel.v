/* Top Level for AWGN */

module AWGN(input clk, input reset, output reg Valid, output reg [15:0] X0, output reg [15:0] X1);


wire [31:0] Taus1, Taus2;
reg [47:0] LogIn;
reg [15:0] Sin1, Cos1;
wire [16:0] Sqrt;
wire [30:0] LogOut;
wire [16:0] SqrtOut;
wire [15:0] Sin11, Cos11;

reg [15:0] Angle;
reg [15:0] Sin, Sin2, Sin3, Sin4, Sin5, Sin6, Sin7, Sin8;
reg [15:0] Cos, Cos2, Cos3, Cos4, Cos5, Cos6, Cos7, Cos8;
reg [31:0] RegX0, RegX1;
reg SignX1, SignX0;

always @(posedge clk)
begin
	if(!reset)
	begin

		LogIn <= {Taus1[31:0], Taus2[31:16]};
		Angle <= Taus2[15:0];
		
		Sin2 <= Sin1;	Cos2 <= Cos1; 	// 2 Cycles
		Sin3 <= Sin2;	Cos3 <= Cos2;	// 3 Cycles	
		Sin4 <= Sin3;	Cos4 <= Cos3;	// 4 Cycles
		Sin5 <= Sin4;	Cos5 <= Cos4;	// 5 Cycles
		Sin6 <= Sin5;	Cos6 <= Cos5;	// 6 Cycles
		Sin7 <= Sin6;	Cos7 <= Cos6;	// 7 Cycles
		Sin8 <= Sin7;	Cos8 <= Cos7;	// 8 Cycles
		Sin <= Sin8;	Cos <= Cos8;	// 9 Cycles

		X0[15] <= Sin[15];
		X1[15] <= Cos[15];

		RegX0 <= Sin[14:0] * SqrtOut[16:0];
		RegX1 <= Cos[14:0] * SqrtOut[16:0];
		 
		X0[14:11] <= RegX0[31:28];
		X0[10:0] <= RegX0[27:17];

		X1[14:11] <= RegX1[31:28];
		X1[10:0] <= RegX1[27:17];

		if(X1[0]^X1[1]^X1[2]^X1[3]^X1[4]^X1[5]^X1[6]^X1[7]^X1[8]^X1[9]^X1[10]^X1[11]^X1[12]^X1[13]^X1[14]^X1[15] != 1'bx) Valid <= 1'b1;
		else Valid <= 1'b0;

		if(X0[0]^X0[1]^X0[2]^X0[3]^X0[4]^X0[5]^X0[6]^X0[7]^X0[8]^X0[9]^X0[10]^X0[11]^X0[12]^X0[13]^X0[14]^X0[15] != 1'bx) Valid <= 1'b1;
		else Valid <= 1'b0;

	end
end

assign Sin1 = Sin11;
assign Cos1 = Cos11;

Taus T1(clk, reset, Taus1[31:0]);	// 1 Cycle
Taus T2(clk, reset, Taus2[31:0]);	// 1 Cycle

LOG_POLY L1(clk, reset, LogIn, LogOut);		// 6 Cycles
SQRT_POLY S1(clk,reset, LogOut, SqrtOut);	// 3 Cycles

SinBlock SinInst1(clk,reset, 1'b0, Angle, Sin11);	// 1 Cycle
SinBlock CosInst1(clk,reset, 1'b1, Angle, Cos11);	// 1 Cycle



endmodule
