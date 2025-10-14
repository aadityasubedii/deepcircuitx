audio_fifo adc_fifo(
	
	.wrclk(bclk),
	.wrreq(adcfifo_write),
	.data(adcfifo_writedata),
	.wrfull(adcfifo_full),
	.aclr(clear),  
	
	.rdclk(clk),
	.rdreq(read),
	.q(readdata),
	.rdempty(empty)
);	