Altera_UP_Audio_Out_Serializer Audio_Out_Serializer (
	
	.clk							(clk),
	.reset							(reset | clear_audio_out_memory),
	
	.bit_clk_rising_edge			(bclk_rising_edge),
	.bit_clk_falling_edge			(bclk_falling_edge),
	.left_right_clk_rising_edge		(done_dac_channel_sync & dac_lrclk_rising_edge),
	.left_right_clk_falling_edge	(done_dac_channel_sync & dac_lrclk_falling_edge),
	
	.left_channel_data				(left_channel_audio_out),
	.left_channel_data_en			(write_audio_out & audio_out_allowed),

	.right_channel_data				(right_channel_audio_out),
	.right_channel_data_en			(write_audio_out & audio_out_allowed),
	
	

	
	.left_channel_fifo_write_space	(left_channel_write_space),
	.right_channel_fifo_write_space	(right_channel_write_space),

	.serial_audio_out_data			(AUD_DACDAT)
);