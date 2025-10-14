alt_vipvfr130_vfr_control_packet_encoder
	#(
		.BITS_PER_SYMBOL(BITS_PER_PIXEL_PER_COLOR_PLANE),
		.SYMBOLS_PER_BEAT(NUMBER_OF_CHANNELS_IN_PARALLEL))
encoder
	(		
		.clk(clock),
		.rst(reset),
	
		
		.din_ready(ready_FROM_encoder_TO_prc),
		.din_valid(valid_FROM_prc_TO_encoder),
		.din_data(data_FROM_prc_TO_encoder),
		.din_sop(sop_FROM_prc_TO_encoder),
		.din_eop(eop_FROM_prc_TO_encoder),
		
		
		.dout_ready(ready_FROM_outputter_TO_encoder),
		.dout_valid(valid_FROM_encoder_TO_outputter),
		.dout_sop(sop_FROM_encoder_TO_outputter),
		.dout_eop(eop_FROM_encoder_TO_outputter),
		.dout_data(data_FROM_encoder_TO_outputter),
		
		
		.do_control_packet(do_control_packet_FROM_controller_TO_encoder),		
		.width(width_FROM_controller_TO_encoder),
		.height(height_FROM_controller_TO_encoder),
		.interlaced(interlaced_FROM_controller_TO_encoder)	
	);