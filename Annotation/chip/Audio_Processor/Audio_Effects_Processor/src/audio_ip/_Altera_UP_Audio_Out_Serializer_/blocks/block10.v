always @(posedge clk)
begin
	if (reset == 1'b1)
		serial_audio_out_data <= 1'b0;
	else
		serial_audio_out_data <= data_out_shift_reg[AUDIO_DATA_WIDTH];
end