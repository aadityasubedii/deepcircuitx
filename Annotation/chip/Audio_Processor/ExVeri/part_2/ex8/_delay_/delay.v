module delay(
sysclk,
trigger,
n,
time_out);

	//Define number of bits in delay counter
	parameter BIT_SZ = 16;

	//Ports
	input sysclk, trigger;
	input [BIT_SZ-1:0] n;
	output time_out;

	//reg declaration
	reg[BIT_SZ-1:0] count;
	reg time_out;

	always @ (posedge sysclk)
	begin
		if(trigger==1'b1)
		begin
			if(count==n)
				time_out <= 1'b1;
			else
				count <= count + 1'b1;
		end
		else
		begin
				count <= 0;
				time_out <= 0;
		end
	end
	

endmodule //end of module


