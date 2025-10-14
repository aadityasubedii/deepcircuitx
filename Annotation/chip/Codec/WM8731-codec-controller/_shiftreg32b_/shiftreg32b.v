module shiftreg32b (clk, reset, shift, carrega, in, regout);
	input clk;
	input reset, shift;
	input carrega; // per carregar dades
	input [31:0] in;
	
	output regout;
	
	reg [31:0] missatge;
	
	assign regout = missatge[31];
	
	always @ (posedge clk)
	begin
		if (reset == 1) missatge <= 32'd0;
			else if (carrega) missatge <= in;
				else if (shift) missatge <= {missatge[30:0], 1'b0};
	end
				
endmodule
	
