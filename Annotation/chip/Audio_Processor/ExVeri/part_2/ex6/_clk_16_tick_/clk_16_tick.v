module clk_16_tick( //DIVIDE BY 50 000
	clkin,
	tick);

	parameter N_BIT = 16;
	
	input clkin;
	output tick;
	
	reg [N_BIT-1:0] count;
	reg tick;

	
	initial tick = 1'b0;
	initial count = 0;
	
	always @ (posedge clkin)
	begin
			if (count == 16'b1100001101010000) // 16'b1100001101010000 = 50,0000 IN DECIMAL
			begin 
				tick <= 1'b1;
				count <= 0; 
			end
			else
			begin
				count <= count + 1'b1;
				tick <= 1'b0;	
			end
	end
	
endmodule
