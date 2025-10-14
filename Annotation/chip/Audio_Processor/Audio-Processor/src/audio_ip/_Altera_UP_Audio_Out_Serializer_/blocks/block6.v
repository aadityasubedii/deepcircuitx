assign read_left_channel	= left_right_clk_rising_edge &
								 ~left_channel_fifo_is_empty & 
								 ~right_channel_fifo_is_empty;