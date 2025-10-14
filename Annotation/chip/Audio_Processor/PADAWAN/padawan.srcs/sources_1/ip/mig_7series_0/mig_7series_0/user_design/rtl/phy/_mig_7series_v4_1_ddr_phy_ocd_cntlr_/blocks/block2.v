  always @(*) begin

  

    byte_ns = byte_r;
    complex_wrlvl_final_ns = complex_wrlvl_final_r;
    lim_start_ns = lim_start_r;
    oclkdelay_calib_done_ns = oclkdelay_calib_done_r;
    complex_oclkdelay_calib_done_ns = complex_oclkdelay_calib_done_r;
    ocd_cntlr2stg2_dec_r = 1'b0;
    po_rd_wait_ns = po_rd_wait_r;
    if (|po_rd_wait_r) po_rd_wait_ns = po_rd_wait_r - 4'b1;
    reset_scan_ns = reset_scan_r;
    wrlvl_final_ns = wrlvl_final_r;
    sm_ns = sm_r;
    ocd_prech_req_ns= 1'b0;
    
    if (rst == 1'b1) begin
      
  
      complex_oclkdelay_calib_done_ns = 1'b0;
      complex_wrlvl_final_ns = 1'b0;
      sm_ns = 3'd0;
      lim_start_ns = 1'b0;
      oclkdelay_calib_done_ns = 1'b0;
      reset_scan_ns = 1'b1;
      wrlvl_final_ns = 1'b0;
    end else
      
  
      case (sm_r)
        3'd0: begin
	  byte_ns = {DQS_CNT_WIDTH{1'b0}};
	  if (oclkdelay_calib_start && ~oclkdelay_calib_done_r ||
	      complex_oclkdelay_calib_start && ~complex_oclkdelay_calib_done_r)
          begin
            sm_ns = 3'd1;
	    lim_start_ns = 1'b1;
	  end
        end	

        3'd1:
	    sm_ns = 3'd2;

       3'd2:begin
	  if (lim_done) begin
	    lim_start_ns = 1'b0;
	    sm_ns = 3'd3;
	    reset_scan_ns = 1'b0;
	  end
        end

	3'd3:begin
	  if (scan_done) begin
	    reset_scan_ns = 1'b1;
	    sm_ns = 3'd4;
	  end
        end

       3'd4:begin
	  sm_ns = 3'd5;
	  ocd_prech_req_ns = 1'b1;
       end
	
       3'd5:begin
	 if (prech_done) sm_ns = 3'd6;
       end
	
	3'd6:begin
	  byte_ns = byte_r + ONE[DQS_CNT_WIDTH-1:0];
	  if ({1'b0, byte_r} == DQS_WIDTH[DQS_CNT_WIDTH:0] - ONE[DQS_WIDTH:0]) begin
	    byte_ns = {DQS_CNT_WIDTH{1'b0}};
	    po_rd_wait_ns = 4'd8;
	    sm_ns = 3'd7;
	  end else begin
	    sm_ns = 3'd1;
	    lim_start_ns = 1'b1;
	  end
        end

	3'd7:
	  if (~|po_rd_wait_r && po_rdy)
	    if (|po_counter_read_val[5:0]) ocd_cntlr2stg2_dec_r = 1'b1;
	    else begin
	      if ({1'b0, byte_r} == DQS_WIDTH[DQS_CNT_WIDTH:0] - ONE[DQS_WIDTH:0]) begin
	        sm_ns = 3'd0;
	        oclkdelay_calib_done_ns= 1'b1;
	        wrlvl_final_ns = 1'b1;
	        if (complex_oclkdelay_calib_start) begin
                  complex_oclkdelay_calib_done_ns = 1'b1;
	          complex_wrlvl_final_ns = 1'b1;
	        end
	      end else begin
		byte_ns = byte_r + ONE[DQS_CNT_WIDTH-1:0];
		po_rd_wait_ns = 4'd8;
	      end
	    end 
    
      endcase 
  end 