/*******************************************

					Edge detector

*******************************************/

module one_shot (clk, din, dout);
	
	parameter EDGE = 0; 				// 0 - front edge detect; 1 - back edge detect; 2 - both edges detect 
	parameter PULSE_WIDTH = 1;		// number of delay registers	
		
	input clk;
	input din;
	output reg dout =0;
	

	reg [PULSE_WIDTH:0]buff =0;
		
	always @(posedge clk)
	begin
		buff[PULSE_WIDTH] <= din;
	end

	genvar i;
	generate
		for(i = 0; i < PULSE_WIDTH; i = i + 1)		
		begin: iLoop
			if(PULSE_WIDTH > 0)
			begin: LONG_LOOP
				always @(posedge clk)
				begin
					buff[i] <= buff[i+1];
				end
			end
		end
	endgenerate
	

	
	always @*
	begin
		case(EDGE)
			0: dout = din & ~buff[0]; // front edge detect
			1: dout = ~din & buff[0]; // back edge detect
			2: dout = din ^ buff[0]; // both edges detect
			default: dout = 0;
		endcase
	end
	
endmodule






