always @(posedge AUD_BCLK)
	if(reset || AUD_ADCLRCK) cnt_in <= 0;
	else if(cnt_in < 16) cnt_in <= cnt_in + 1;
