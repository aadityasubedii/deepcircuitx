module clktick_16( //DIVIDE BY 500
clkin,
tick);
	
	input clkin;
	output tick;
	
	reg [13:0] count;
	reg tick;

	
	initial tick = 1'b0;
	initial count = 0;
	
	always @ (posedge clkin)
	begin
			if (count == 3'd500) 
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
