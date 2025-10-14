Altera_UP_Audio_In_Deserializer Audio_In_Deserializer (
	
	.clk						(CLOCK_50),
	.reset					(reset),
	
	.bit_clk_rising_edge			(bclk_rising_edge),
	.bit_clk_falling_edge			(bclk_falling_edge),
	.left_right_clk_rising_edge		(adc_lrclk_rising_edge),
	.left_right_clk_falling_edge		(adc_lrclk_falling_edge),

	.done_channel_sync			(done_adc_channel_sync),

	.serial_audio_in_data			(AUD_ADCDAT),

	.read_left_audio_data_en		(read_s & (left_channel_read_available != 8'd0)),
	.read_right_audio_data_en		(read_s & (right_channel_read_available != 8'd0)),

	

	
	.left_audio_fifo_read_space		(left_channel_read_available),
	.right_audio_fifo_read_space		(right_channel_read_available),

	.left_channel_data			(new_left_channel_audio),
	.right_channel_data			(new_right_channel_audio)
);