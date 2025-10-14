module shiftreg32bsp (clk, reset, shift, in, missatge);
	input clk;
	input reset;
	input shift;
	input in;
	
	output [31:0] missatge;
	
	reg [31:0] missatge;
	
	always @ (posedge clk)
	begin
		if (reset == 1) missatge <= 32'd0;
				else if (shift) missatge <= {missatge[30:0],in};
	end
				
	endmodule
	
