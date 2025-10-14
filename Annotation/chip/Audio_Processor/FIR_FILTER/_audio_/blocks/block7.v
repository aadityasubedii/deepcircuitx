always @(posedge AUD_BCLK)
	if(reset) sr_in <= 0;
	else if(cnt_in < 16) sr_in <= {sr_in[14:0], AUD_ADCDAT};
