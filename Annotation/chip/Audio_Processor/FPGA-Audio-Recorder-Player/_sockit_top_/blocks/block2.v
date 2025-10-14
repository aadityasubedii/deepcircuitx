always @(posedge audio_clk) begin
	if(playback) begin
		audio_selection <= audio_in * volume_control;
	end
	else begin
		audio_selection <= audio_output * volume_control;
	end
end