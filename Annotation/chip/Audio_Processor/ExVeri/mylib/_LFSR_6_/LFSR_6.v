//polynomial 1 + X + X^6

module LFSR_6(en, clk, prbs);


	input clk;
	input en;
	output [6:1] prbs;

	reg [6:1] sreg;

	initial sreg = 7'b1;

	always @ (posedge clk)
	begin
		if(en == 1'b1)
			sreg <= {sreg[5:1], sreg[1] ^ sreg[6]};
	end
			
	assign prbs = sreg;
	
endmodule
	