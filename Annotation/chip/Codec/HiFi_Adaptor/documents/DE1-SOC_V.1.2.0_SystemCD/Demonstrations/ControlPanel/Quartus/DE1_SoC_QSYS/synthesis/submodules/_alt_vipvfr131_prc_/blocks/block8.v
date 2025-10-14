alt_vipvfr131_prc_core
	#(.BITS_PER_SYMBOL (BPS),
		.SYMBOLS_PER_BEAT (CHANNELS_IN_PAR),
		.BURST_LENGTH_REQUIREDWIDTH (MAX_BURST_LENGTH_REQUIREDWIDTH),
		.PACKET_SAMPLES_REQUIREDWIDTH (PACKET_SAMPLES_REQUIREDWIDTH))

prc_core		
	(	.clock (clock),
		.reset (reset),
		
		.stall(stall_FROM_prc_core_TO_WIRE_global_ena),
		.ena(global_ena),
			
		.read (read_FROM_prc_core_TO_read_master),		
		.data (pixel_data_FROM_read_master_TO_prc_core),
		.discard_remaining_data_of_read_word (discard_remaining_data_of_read_word_FROM_prc_core_TO_read_master),
		
		
		.cmd_length_of_burst (cmd_length_of_burst_FROM_prc_core_TO_read_master),
		.cmd (cmd_FROM_prc_core_TO_read_master),
		.cmd_addr (cmd_addr_FROM_prc_core_TO_read_master),		
				
		
		.enable (enable),
		.clear_enable (clear_enable),
		.stopped (stopped),
		.complete (complete),
		.packet_addr (packet_addr),
		.packet_type (packet_type),
		.packet_words (packet_words),
		.packet_samples (packet_samples),
		
		
		.ready_out (ready_out),		
		.valid_out (valid_out),
		.data_out (data_out),
		.sop_out (sop_out),
		.eop_out (eop_out));