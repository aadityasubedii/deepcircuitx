/*******************************************

					EASY DELAY
					
				filter time = 2^N / Fclk

********************************************/

module delay (clk, pin, pout);	 

	//-----PARAMETERS -----
	parameter N = 4;	// counter size

	//-----I/O-----
	input clk;
	input pin;
	output reg pout =0;

	//-----VARIABLES-----
	reg [N-1:0] tcnt =0;

	//-----TIMER-----
	always @(negedge pin or posedge clk)
	begin
		if(!pin)
		begin
			tcnt <= 0;
			pout <= 1'b0;
		end
		else begin
			if(&tcnt)	
			begin
				pout <= 1'b1;
			end
			else begin
				tcnt <= tcnt + 1'b1;
				pout <= 1'b0;
			end
		end
	end

endmodule












