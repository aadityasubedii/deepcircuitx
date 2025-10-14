always @(posedge clk)
begin
	if (reset == 1'b1)
		left_channel_was_read <= 1'b0;
	else if (read_left_channel)
		left_channel_was_read <=1'b1;
	else if (read_right_channel)
		left_channel_was_read <=1'b0;
end