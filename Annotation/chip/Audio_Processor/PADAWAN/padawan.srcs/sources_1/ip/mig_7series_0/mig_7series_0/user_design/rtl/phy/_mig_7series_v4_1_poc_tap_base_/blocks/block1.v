  always @(*) begin
    
    if (rst == 1'b1) begin
      
 
      psen_int = 1'b0;
      sm_ns = 2'd0;
      run_polarity_ns = 1'b0;
      run_ns = {TAPCNTRWIDTH{1'b0}};
      run_end_int = 1'b0;
      samp_cntr_ns = {SAMPCNTRWIDTH{1'b0}};
      samps_hi_ns = {SAMPCNTRWIDTH+1{1'b0}};
      tap_ns = {TAPCNTRWIDTH{1'b0}};
      samp_wait_ns = MMCM_SAMP_WAIT[SAMP_WAIT_WIDTH-1:0];
      samps_hi_held_ns = {SAMPCNTRWIDTH+1{1'b0}};
    end else begin

 
      psen_int = 1'b0;
      sm_ns = sm_r;
      run_polarity_ns = run_polarity_r;
      run_ns = run_r;
      run_end_int = 1'b0;
      samp_cntr_ns = samp_cntr_r;
      samps_hi_ns = samps_hi_r;
      tap_ns = tap_r;
      samp_wait_ns = samp_wait_r;
      if (|samp_wait_r) samp_wait_ns = samp_wait_r - ONE[SAMP_WAIT_WIDTH-1:0];
      samps_hi_held_ns = samps_hi_held_r;


      case (sm_r)
        2'd0: begin
	  if (~|samp_wait_r && poc_sample_pd | POC_USE_METASTABLE_SAMP == "TRUE") begin
	    if (POC_USE_METASTABLE_SAMP == "TRUE") samp_wait_ns = ONE[SAMP_WAIT_WIDTH-1:0];
	    if ({1'b0, samp_cntr_r} == samples) sm_ns = 2'd1;
	    samps_hi_ns = samps_hi_r + {{SAMPCNTRWIDTH{1'b0}}, pd_out_sel};
	    samp_cntr_ns = samp_cntr_r + ONE[SAMPCNTRWIDTH-1:0];
	  end
        end
	
	2'd1:begin
	   sm_ns = 2'd2;
        end

        2'd2:begin
	  sm_ns = 2'd3;
	  psen_int = 1'b1;
	  samp_cntr_ns = {SAMPCNTRWIDTH{1'b0}};
	  samps_hi_ns = {SAMPCNTRWIDTH+1{1'b0}};
	  samps_hi_held_ns = samps_hi_r;
	  tap_ns = (tap_r < TAPSPERKCLK[TAPCNTRWIDTH-1:0] - ONE[TAPCNTRWIDTH-1:0])
	             ? tap_r + ONE[TAPCNTRWIDTH-1:0]
		     : {TAPCNTRWIDTH{1'b0}};

	  if (run_polarity_r) begin
	    if (samps_zero_r) run_polarity_ns = 1'b0;
	  end else begin
	    if (samps_one_r) run_polarity_ns = 1'b1;
	  end
	  if (new_polarity) begin
            run_ns ={TAPCNTRWIDTH{1'b0}};
	    run_end_int = 1'b1;
	  end else run_ns = run_r + ONE[TAPCNTRWIDTH-1:0];
        end

        2'd3:begin
	  samp_wait_ns = MMCM_SAMP_WAIT[SAMP_WAIT_WIDTH-1:0] - ONE[SAMP_WAIT_WIDTH-1:0];
	  if (psdone) sm_ns = 2'd0;
        end
	
      endcase 
    end 
  end 