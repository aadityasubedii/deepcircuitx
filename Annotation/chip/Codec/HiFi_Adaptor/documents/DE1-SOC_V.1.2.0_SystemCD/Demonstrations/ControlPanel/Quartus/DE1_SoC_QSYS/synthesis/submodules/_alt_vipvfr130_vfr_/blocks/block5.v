  alt_vipvfr130_prc #(
    .BPS(BITS_PER_PIXEL_PER_COLOR_PLANE),
    .CHANNELS_IN_PAR(NUMBER_OF_CHANNELS_IN_PARALLEL),
    .CHANNELS_IN_SEQ(NUMBER_OF_CHANNELS_IN_SEQUENCE),
    .MAX_WIDTH(MAX_IMAGE_WIDTH),
    .MAX_HEIGHT(MAX_IMAGE_HEIGHT),
    .MEM_PORT_WIDTH(MEM_PORT_WIDTH),
    .RMASTER_FIFO_DEPTH(RMASTER_FIFO_DEPTH),
    .RMASTER_BURST_TARGET(RMASTER_BURST_TARGET),
    .CLOCKS_ARE_SEPARATE(CLOCKS_ARE_SEPARATE),
    .READY_LATENCY(0))
	prc(
		.clock(clock),
		.reset(reset),
		
		
		.master_av_clock(master_clock),
		.master_av_reset(master_reset),
		.master_av_address(master_address),
		.master_av_burstcount(master_burstcount),
		.master_av_readdata(master_readdata),
		.master_av_read(master_read),
		.master_av_readdatavalid(master_readdatavalid),
		.master_av_waitrequest(master_waitrequest),
		
		
		.dout_valid(valid_FROM_prc_TO_encoder),
		.dout_ready(ready_FROM_encoder_TO_prc),
		.dout_data(data_FROM_prc_TO_encoder),
		.dout_startofpacket(sop_FROM_prc_TO_encoder),
		.dout_endofpacket(eop_FROM_prc_TO_encoder),
		
		.control_av_address(master_address_FROM_controller_TO_prc),
		.control_av_write(master_write_FROM_controller_TO_prc),
		.control_av_writedata(master_writedata_FROM_controller_TO_prc),
		.control_av_read(),
		.control_av_readdata(),
		.control_av_irq(slave_irq_FROM_prc_TO_controller)
	);