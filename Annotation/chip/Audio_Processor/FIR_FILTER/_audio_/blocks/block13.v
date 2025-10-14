always @(negedge AUD_BCLK)
	if(reset) sr_out <= 0;
	else sr_out <= sync ? aout : {sr_out[14:0], sr_out[15]};
