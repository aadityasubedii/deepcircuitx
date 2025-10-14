module echo
	#(parameter RESOLUTION = 32, DEPTH = 128)
	( 
	input clk, enable,
	input [RESOLUTION - 1:0] data_in,
	output reg [RESOLUTION - 1:0] data_out
	);
		
	reg [RESOLUTION - 1:0] buffer [DEPTH-1:0];
	integer i;
	
	always @(posedge clk)
		begin
			if (!enable)
				data_out <= data_in;
			else begin
				data_out <= data_in + (buffer[DEPTH-1]<<2);
				
				for (i = DEPTH-1; i>0; i = i-1)
					begin
						buffer[i] <= buffer[i-1];
					end
					
				buffer[0] <= data_in;
			end
		end
		
	endmodule
	