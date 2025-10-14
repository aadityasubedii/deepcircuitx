module coeff_memory (input wr_en, rd_en, Sclk,
							input [8:0] coeff_wr_addr, coeff_rd_addr,
							input [15:0] data_in,
							output [15:0] coeff_data);

	reg [15:0] coeff_mem [0:511];
