/* 32-bit Tausworthe Uniform Random Number Generator */

module Taus(input clk, input reset, output [31:0] Tout);

	reg [31:0] s0, s1, s2, b;


always @(posedge clk) begin

	if(!reset)
	begin

		b = ((( s0 << 13) ^ s0) >> 19);

		s0 = ((( s0 & 32'hFFFFFFFE) << 12 ) ^ b);

		b = ((( s1 << 2) ^ s1) >> 25);

		s1 = ((( s1 & 32'hFFFF_FFF8) << 4 ) ^ b);

		b = ((( s2 << 3) ^ s2) >> 11);
	
		s2 = ((( s2 & 32'hFFFF_FFF0) << 17 ) ^ b);

	end

	else begin

		s0 = 2;
		s1 = 7;
		s2 = 5;
	end
end

	assign Tout = s0 ^ s1 ^ s2;

endmodule



