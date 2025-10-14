module data_memory (input wr_en, rd_en, Sclk, input_rdy_flag,
					input [7:0] data_wr_addr, data_rd_addr,
					input [15:0] data_in,
					output [15:0] xin_data,
					output reg zero_flag);

	reg [15:0] data_mem [0:255];
	reg [11:0] zero_cnt;
	
	always @(negedge Sclk)
	begin
		if(wr_en == 1'b1)
			data_mem[data_wr_addr] = data_in;
		else
			data_mem[data_wr_addr] = data_mem[data_wr_addr];
	end

	always @(posedge input_rdy_flag)
	begin
		if (data_in == 16'd0)
		begin
			zero_cnt = zero_cnt + 1'b1;
			if (zero_cnt == 12'd800)
				zero_flag = 1'b1;
			else if (zero_cnt > 12'd800)
			begin
				zero_cnt = 12'd800;
				zero_flag = 1'b1;
			end
		end		
		else if (data_in != 16'd0)
		begin
			zero_cnt = 12'd0;
			zero_flag = 1'b0;
		end
	end

	assign xin_data = (rd_en) ? data_mem[data_rd_addr] : 16'd0;
endmodule
