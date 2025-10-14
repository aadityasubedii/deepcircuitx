module clk500(
en,
tick);
	
	input en;
	output tick;
	
	reg [8:0] count;
	reg tick;

	
	initial tick = 1'b0;
	initial count = 0;
	
	always @ (posedge en)
	begin
			if (count == 9'b111110100) 
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