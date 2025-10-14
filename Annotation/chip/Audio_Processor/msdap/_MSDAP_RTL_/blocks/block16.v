module data_memory (input wr_en, rd_en, Sclk, input_rdy_flag,
					input [7:0] data_wr_addr, data_rd_addr,
					input [15:0] data_in,
					output [15:0] xin_data,
					output reg zero_flag);

	reg [15:0] data_mem [0:255];
	reg [11:0] zero_cnt;
	