module rj_memory (input write_enable, read_enable, Sclk,
						input [15:0] in_data,
                                           input [3:0] rjwrite, rjread,	
						output [15:0] data_rj);
	reg [15:0] rjmem [0:15];
	always @(posedge Sclk)
	begin
		if(write_enable == 1'b1)
			rjmem[rjwrite] = in_data;
		else
			rjmem[rjwrite] = rjmem[rjwrite];		
	end

	assign data_rj = (read_enable) ? rjmem[rjread] : 16'd0;
endmodule
