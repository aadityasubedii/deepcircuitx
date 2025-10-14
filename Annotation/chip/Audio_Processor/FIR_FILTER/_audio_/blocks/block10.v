always @(posedge AUD_BCLK)
	if(reset || AUD_DACLRCK) cnt_out <= 0;
	else if(cnt_out < 32) cnt_out <= cnt_out + 1;
