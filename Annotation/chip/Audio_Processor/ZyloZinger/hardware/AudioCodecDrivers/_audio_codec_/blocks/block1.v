Altera_UP_Audio_Out_Serializer Audio_Out_Serializer (
	
	.clk						(clk),
	.reset						(reset),
	
	.bit_clk_rising_edge			(bclk_rising_edge),
	.bit_clk_falling_edge			(bclk_falling_edge),
	.left_right_clk_rising_edge		(done_dac_channel_sync & dac_lrclk_rising_edge),
	.left_right_clk_falling_edge		(done_dac_channel_sync & dac_lrclk_falling_edge),
	
	.left_channel_data			(writedata_left),
	.left_channel_data_en			(write & (left_channel_write_space != 8'd0)),

	.right_channel_data			(writedata_right),
	.right_channel_data_en			(write & (right_channel_write_space != 8'd0)),
	
	

	
	.left_channel_fifo_write_space	(left_channel_write_space),
	.right_channel_fifo_write_space	(right_channel_write_space),

	.serial_audio_out_data			(AUD_DACDAT)
);