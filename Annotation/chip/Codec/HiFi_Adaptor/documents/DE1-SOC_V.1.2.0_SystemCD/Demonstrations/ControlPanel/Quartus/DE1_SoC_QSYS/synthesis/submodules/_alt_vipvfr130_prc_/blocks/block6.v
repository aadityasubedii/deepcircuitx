generate
	if (READY_LATENCY == 1) begin

		
		alt_vipvfr130_common_stream_output
			#(.DATA_WIDTH (BPS * CHANNELS_IN_PAR))
			avalon_st_output
			(	.clk (clock),
				.rst (reset),
				.dout_ready (dout_ready),
				.dout_valid (dout_valid),
				.dout_data (dout_data),
				.dout_sop (dout_startofpacket),
				.dout_eop (dout_endofpacket),
				.int_ready (ready_out),
				.int_valid (valid_out),
				.int_data (data_out),
				.int_sop (sop_out),
				.int_eop (eop_out),
				.enable (1'b1),
				.synced ());											
	
	end else begin 
		
		assign ready_out = dout_ready;
		assign dout_valid = valid_out;
		assign dout_data = data_out;
		assign dout_startofpacket = sop_out;
		assign dout_endofpacket = eop_out;
		
	end
endgenerate