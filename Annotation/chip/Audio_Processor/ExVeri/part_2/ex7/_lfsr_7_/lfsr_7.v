module lfsr_7(
	enable,
	clock,
	out
);

	input clock;
	input enable;
	output [7:1] out;

	reg[7:1] sreg;

	initial sreg = 7'b1;

	always @ (posedge clock) 
		begin
		if (enable==1'b1)
			sreg<= {sreg[6:1], sreg[7] ^ sreg[1]};
		end 
	assign out = sreg;
	
endmodule 
