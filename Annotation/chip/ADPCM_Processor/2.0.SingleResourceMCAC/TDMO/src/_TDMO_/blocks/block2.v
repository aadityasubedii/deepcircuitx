always@ (posedge serial_clk, posedge reset) begin
	if (reset) begin					
		ch_count <= 5'b00000;
		bit_count <= 3'b000;
		ch0_bit_count <= 3'b000;
		data_out_reg <= 8'h00;
		frame_reg <= 8'h00;
	end else begin
		ch0_bit_count <= next_ch0_bit;	
		bit_count <= next_bit;
		ch_count <= next_ch;
		frame_reg <= ch0_reg_2;
		data_out_reg <= data_out_buf;
	end
end