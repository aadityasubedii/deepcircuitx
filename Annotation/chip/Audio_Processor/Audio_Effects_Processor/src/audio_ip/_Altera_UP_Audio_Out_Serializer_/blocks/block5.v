Altera_UP_SYNC_FIFO Audio_Out_Left_Channel_FIFO(
	
	.clk			(clk),
	.reset			(reset),

	.write_en		(left_channel_data_en & ~left_channel_fifo_is_full),
	.write_data		(left_channel_data),

	.read_en		(read_left_channel),
	
	

	
	.fifo_is_empty	(left_channel_fifo_is_empty),
	.fifo_is_full	(left_channel_fifo_is_full),
	.words_used		(left_channel_fifo_used),

	.read_data		(left_channel_from_fifo)
);