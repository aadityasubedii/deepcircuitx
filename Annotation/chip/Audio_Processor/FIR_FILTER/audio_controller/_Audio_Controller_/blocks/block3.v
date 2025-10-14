Altera_UP_Audio_In_Deserializer Audio_In_Deserializer (
	
	.clk							(clk),
	.reset							(reset | clear_audio_in_memory),
	
	.bit_clk_rising_edge			(bclk_rising_edge),
	.bit_clk_falling_edge			(bclk_falling_edge),
	.left_right_clk_rising_edge		(adc_lrclk_rising_edge),
	.left_right_clk_falling_edge	(adc_lrclk_falling_edge),

	.done_channel_sync				(done_adc_channel_sync),

	.serial_audio_in_data			(AUD_ADCDAT),

	.read_left_audio_data_en		(read_audio_in & audio_in_available),
	.read_right_audio_data_en		(read_audio_in & audio_in_available),

	

	
	.left_audio_fifo_read_space		(left_channel_read_available),
	.right_audio_fifo_read_space	(right_channel_read_available),

	.left_channel_data				(left_channel_audio_in),
	.right_channel_data				(right_channel_audio_in)
);