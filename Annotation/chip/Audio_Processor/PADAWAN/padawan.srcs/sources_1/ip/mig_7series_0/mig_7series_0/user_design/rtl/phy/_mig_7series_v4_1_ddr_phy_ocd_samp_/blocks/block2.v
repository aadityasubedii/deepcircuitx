  always @(*) begin

  

    agg_samp_ns = agg_samp_r;
    data_cnt_ns = data_cnt_r;
    oclk_calib_resume_ns = 1'b0;
    oneeighty_ns = oneeighty_r;
    rd_victim_sel_ns = rd_victim_sel_r;
    samp_done_ns = samp_done_r;
    samps_ns = samps_r;
    sm_ns = sm_r;
    zero_ns = zero_r;
    
    if (rst == 1'b1) begin
  
      sm_ns = 1'd0;
      
    end else
      
  
      case (sm_r)

        1'd0:begin
	  agg_samp_ns = NULL;
	  data_cnt_ns = data_cnt;
	  oneeighty_ns = 'b0;
	  zero_ns = 'b0;
	  rd_victim_sel_ns = 3'b0;
	  samps_ns = complex_oclkdelay_calib_start ? CMPLX_SAMPS[SAMP_CNT_WIDTH-1:0]
                                                   : OCAL_SIMPLE_SCAN_SAMPS[SAMP_CNT_WIDTH-1:0];
	 
	  
	  if (taps_set) begin
	    samp_done_ns = 1'b0;
	    sm_ns = 1'd1;
	    oclk_calib_resume_ns = 1'b1;
	  end
        end

        1'd1:begin
	  if (phy_rddata_en_1) begin

	    case (agg_samp_r)
	      NULL : if (~&match) agg_samp_ns = match;
	      ZERO, ONEEIGHTY : if (~(agg_samp_r == match || &match)) agg_samp_ns = FUZZ;
	      FUZZ : ;
	    endcase 

	    if (~data_end) data_cnt_ns = data_cnt_r - ONE[DATA_CNT_WIDTH-1:0];
	    else begin
	      data_cnt_ns = data_cnt;
	      if (rd_victim_end != rd_victim_sel_r) rd_victim_sel_ns = rd_victim_sel_r + 3'h1;
	      else begin
		rd_victim_sel_ns = 3'h0;
		if (agg_samp_ns == ZERO) zero_ns = zero_r + ONE[SAMP_CNT_WIDTH-1:0];
	        if (agg_samp_ns == ONEEIGHTY) oneeighty_ns = oneeighty_r + ONE[SAMP_CNT_WIDTH-1:0];
		agg_samp_ns = NULL;
		if (~samp_end) samps_ns = samps_r - ONE[SAMP_CNT_WIDTH-1:0];
		else samp_done_ns = 1'b1;
	      end
	    end
    
      	    if (samp_done_ns) sm_ns = 1'd0;
	    else oclk_calib_resume_ns = ~complex_oclkdelay_calib_start && data_end;
	  end
	end
	
      endcase 
  end 