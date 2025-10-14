	alt_vipvfr130_common_stream_output
		#(.DATA_WIDTH (DATA_WIDTH))
		outputter
		(	.clk (clock),
			.rst (reset),
			.dout_ready (dout_ready),
			.dout_valid (dout_valid),
			.dout_data (dout_data),
			.dout_sop (dout_startofpacket),
			.dout_eop (dout_endofpacket),
			.int_ready (ready_FROM_outputter_TO_encoder),
			.int_valid (valid_FROM_encoder_TO_outputter),
			.int_data (data_FROM_encoder_TO_outputter),
			.int_sop (sop_FROM_encoder_TO_outputter),
			.int_eop (eop_FROM_encoder_TO_outputter),
			.enable (1'b1),
			.synced ()
	);