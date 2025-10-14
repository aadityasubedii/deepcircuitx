always @(posedge clk)
begin
	if (reset == 1'b1)
		right_audio_fifo_read_space			<= 8'h00;
	else
	begin
		right_audio_fifo_read_space[7]		<= right_channel_fifo_is_full;
		right_audio_fifo_read_space[6:0]	<= right_channel_fifo_used;
	end
end