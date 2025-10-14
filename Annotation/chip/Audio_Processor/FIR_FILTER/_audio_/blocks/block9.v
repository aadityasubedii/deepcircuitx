always @(posedge CLOCK_50)
	if(reset) ao <= 0;
	else ao <= {ao[0], (cnt_out == 32)};
