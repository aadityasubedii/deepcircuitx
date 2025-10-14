  always @(posedge clk) begin
    if (rst) begin
	  mmcm_init_trail <= #TCQ 'd0;
	  mmcm_init_lead  <= #TCQ 'd0;
	end else if (poc2lim_detect_done && !detect_done_r) begin
	  if (stg3_tap_cnt == stg3_dec_val)
	    mmcm_init_trail <= #TCQ poc2lim_rise_align_taps_trail;
	  if (stg3_tap_cnt == stg3_inc_val)
	    mmcm_init_lead  <= #TCQ poc2lim_rise_align_taps_lead;
	end  
  end