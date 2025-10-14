module lfsr_race(
	enable,
	clock,
	out
);

	input clock;
	input enable;
	output [15:1] out;

	reg[15:1] sreg;

	initial sreg = 14'd25;

	always @ (posedge clock) 
		begin
		if (enable==1'b1)
			sreg<= {sreg[14:1], sreg[14] ^ sreg[10] ^ sreg[6] ^ sreg[1]};
		end
	assign out = sreg;
	
endmodule 


