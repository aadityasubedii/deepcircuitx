module rj_memory (input wr_en, rd_en, Sclk,
						input [3:0] rj_wr_addr, rj_rd_addr,
						input [15:0] data_in,
						output [15:0] rj_data);

	reg [15:0] rj_mem [0:15];

	always @(negedge Sclk)
	begin
		if(wr_en == 1'b1)
			rj_mem[rj_wr_addr] = data_in;	
	end
   assign rj_data = (rd_en) ? rj_mem[rj_rd_addr] : 16'd0;
endmodule