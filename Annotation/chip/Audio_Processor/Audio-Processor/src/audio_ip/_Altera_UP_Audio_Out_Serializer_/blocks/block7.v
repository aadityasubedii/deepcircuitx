always @(posedge clk)
begin
	if (reset == 1'b1)
		data_out_shift_reg	<= {AUDIO_DATA_WIDTH{1'b0}};
	else if (read_left_channel)
		data_out_shift_reg	<= left_channel_from_fifo;
	else if (read_right_channel)
		data_out_shift_reg	<= right_channel_from_fifo;
	else if (left_right_clk_rising_edge | left_right_clk_falling_edge)
		data_out_shift_reg	<= {AUDIO_DATA_WIDTH{1'b0}};
	else if (bit_clk_falling_edge)
		data_out_shift_reg	<= 
			{data_out_shift_reg[(AUDIO_DATA_WIDTH - 1):1], 1'b0};
end