//K is how much you want to divide the clock by
//It has to be a multiple of 2

module clkdiv_16(
clkin,
clkout,
K,
en
);


	parameter N_BIT = 16;
	
	input clkin;
	input [N_BIT-1:0] K;
	input en;
	
	output clkout;
	
	reg [N_BIT-1:0] count;
	reg clkout;
	
	initial count = 16'b0;
	initial clkout = 1'b0;
	
	always @ (posedge clkin)
	begin
		if(en == 1'b1)
		begin
			if(count == 16'b0)
			begin
				clkout <= ~clkout;
				count <= ((K >> 1) - 1);
			end
			else
			begin
				count <= count - 1'b1;
			end
		end
	end

endmodule
