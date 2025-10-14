module coeff_memory (input wr_en, rd_en, Sclk,
							input [8:0] coeff_wr_addr, coeff_rd_addr,
							input [15:0] data_in,
							output [15:0] coeff_data);

	reg [15:0] coeff_mem [0:511];

	always @(negedge Sclk)
	begin
		if(wr_en == 1'b1)
			coeff_mem[coeff_wr_addr] = data_in;
	end
   assign coeff_data = (rd_en) ? coeff_mem[coeff_rd_addr] : 16'd0;
endmodule