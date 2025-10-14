  always @(posedge clk) begin
    if (rst) begin
	  mmcm_current    <= #TCQ 'd0;
	end else if (stg3_dec_r) begin
	  if (stg3_tap_cnt == stg3_dec_val)
	    mmcm_current <= #TCQ mmcm_init_trail;
	  else
	    mmcm_current <= #TCQ poc2lim_rise_align_taps_lead;
	end else begin
	  if (stg3_tap_cnt == stg3_inc_val)
	    mmcm_current <= #TCQ mmcm_init_lead;
	  else
	    mmcm_current <= #TCQ poc2lim_rise_align_taps_trail;
	end 
  end