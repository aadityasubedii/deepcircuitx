//polynomial 1 + X + X^7

module LFSR_7(data_out, clk);


	input clk;
	output [7:1] data_out;

	reg [7:1] sreg;

	initial sreg = 7'b1;

	always @ (posedge clk)
	begin
		sreg <= {sreg[6:1], sreg[1] ^ sreg[7]};
	end
			
	assign data_out = sreg;
	
endmodule
	