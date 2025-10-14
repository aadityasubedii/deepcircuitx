module i2s_decode
	#(parameter RESOLUTION = 24)
(
	input SCLK, LRCK, data_in,
	output reg[RESOLUTION-1:0] data_out_L, data_out_R
);

reg [RESOLUTION-1:0] count;
reg LR;
reg [RESOLUTION-1:0] data_L, data_R;


always @(posedge SCLK)
	begin
		
	count <= count + 1;

	if (LR != LRCK)
		begin
		count <= 0;
		LR <= LRCK;
		data_out_L <= data_L;
		data_out_R <= data_R;
		end
	
	else if (count < RESOLUTION) begin
		if (LRCK == 0)
			data_L[RESOLUTION-1-count] <= data_in;
		else
			data_R[RESOLUTION-1-count] <= data_in;
		end
	
	end
endmodule
