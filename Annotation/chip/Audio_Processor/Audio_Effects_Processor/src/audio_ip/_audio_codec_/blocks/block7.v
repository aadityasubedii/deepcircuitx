assign read_ready = (left_channel_read_available != 8'd0) & (right_channel_read_available != 8'd0);
assign write_ready = (left_channel_write_space != 8'd0) & (right_channel_write_space != 8'd0);
assign readdata_left = new_left_channel_audio;
assign readdata_right = new_right_channel_audio;
