//K is how mnay clock cycles do you want the tick to measure

module clktick_16(
clkin,
tick,
K,
en
);
	parameter N_BIT = 16;

	input clkin;
	input en;
	input [N_BIT-1:0] K;
	
	output tick;
	
	reg [N_BIT-1:0] count;
	reg tick;
	
	initial count = 0;
	initial tick = 0;
	
	always @ (posedge clkin)
	begin
		if(en == 1'b1)
		begin
			if(count == 16'b0)
			begin
				tick <= 1;
				count <= (K - 16'b1);
			end
			else
			begin
				count <= count - 1'b1;
				tick <= 0;
			end
		end
	end

endmodule
	