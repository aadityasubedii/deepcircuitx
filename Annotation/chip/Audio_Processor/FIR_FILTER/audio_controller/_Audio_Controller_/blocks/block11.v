always @ (posedge clk)
begin
	if (reset == 1'b1)
		audio_in_available <= 1'b0;
	else if ((left_channel_read_available[7] | left_channel_read_available[6])
			& (right_channel_read_available[7] | right_channel_read_available[6]))
		audio_in_available <= 1'b1;
	else
		audio_in_available <= 1'b0;
end