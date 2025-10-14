  always @(*) begin

  

    cmplx_samples_done_ns = cmplx_samples_done_r;
    cmplx_stg3_final_ns = cmplx_stg3_final_r;
    scanning_right_ns = scanning_right_r;
    ninety_offsets_ns = ninety_offsets_r;
    ocal_scan_win_not_found_ns = ocal_scan_win_not_found_r;
    ocd_edge_detect_rdy_ns = ocd_edge_detect_rdy_r;
    ocd_ktap_left_ns = ocd_ktap_left_r;
    ocd_ktap_right_ns = ocd_ktap_right_r;
    ocd2stg2_inc_r = 1'b0;
    ocd2stg2_dec_r = 1'b0;
    ocd2stg3_inc_r = 1'b0;
    ocd2stg3_dec_r = 1'b0;
    oclkdelay_center_calib_start_ns = oclkdelay_center_calib_start_r;
    oclkdelay_center_calib_done_ns = 1'b0;
    oclk_center_write_resume_ns = oclk_center_write_resume_r;
    po_center_wait = 1'b0;
    po_done_ns = po_done_r;
    po_finish_scan = 1'b0;
    po_slew = 1'b0;
    poc_backup_ns = poc_backup_r;
    scan_done_r = 1'b0;
    simp_stg3_final_ns = simp_stg3_final_r;
    sm_ns = sm_r;
    taps_set_r = 1'b0;
    up_ns = up_r;
    stg2_ns = stg2_r;
    stg3_ns = stg3_r;
    two_ns = two_r;
    resume_wait_ns = resume_wait_r;
    
    if (rst == 1'b1) begin
      
  
      cmplx_samples_done_ns = 1'b0;
      ocal_scan_win_not_found_ns = 1'b0;
      ocd_ktap_left_ns = 1'b0;
      ocd_ktap_right_ns = 1'b0;
      ocd_edge_detect_rdy_ns = 1'b0;
      oclk_center_write_resume_ns = 1'b0;
      oclkdelay_center_calib_start_ns = 1'b0;
      po_done_ns = 1'b1;
      resume_wait_ns = 5'd0;
      sm_ns = 4'd0;
      
    end else
      
  
      case (sm_r)

        4'd0:begin
	  poc_backup_ns = 1'b0;
	  stg2_ns = {3'b0, wl_po_fine_cnt_sel};
          stg3_ns = stg3_init;
	  scanning_right_ns = 1'b0;
	  if (complex_oclkdelay_calib_start) cmplx_samples_done_ns = 1'b1;
	  if (!reset_scan && ~resume_wait) begin
	    cmplx_samples_done_ns = 1'b0;
	    ocal_scan_win_not_found_ns = 1'b0;
	    taps_set_r = 1'b1;
	    sm_ns = 4'd1;
	  end
        end

        4'd1:begin
	    if (samp_done && use_samp_done) begin
	      if (complex_oclkdelay_calib_start) cmplx_samples_done_ns = 1'b1;
	      scanning_right_ns = scanning_right_r || left_stop;
	      if (right_stop && scanning_right_r) begin
		oclkdelay_center_calib_start_ns = 1'b1;
		ocd_ktap_left_ns = 1'b1;
		ocal_scan_win_not_found_ns = win_not_found;
		sm_ns = 4'd3;
	      end else begin
		if (scanning_right_ns) ocd2stg3_inc_r = 1'b1;
		else ocd2stg3_dec_r = 1'b1;
	        sm_ns = 4'd2;
	      end
	    end
	end

	4'd2:begin
	    if (po_done_r && ~resume_wait) begin
	      taps_set_r = 1'b1;
	      sm_ns = 4'd1;
	      cmplx_samples_done_ns = 1'b0;
	    end
	end

	4'd3:begin
	    po_slew = 1'b1;
	    ninety_offsets_ns = |ninety_offsets_final_r ? 2'b01 : 2'b00;
	    if (~resume_wait) begin
	      if (po_done_r) begin
                if (inc_po_r) ocd2stg3_inc_r = 1'b1;
                else if (dec_po_r) ocd2stg3_dec_r = 1'b1;
	        else if (~resume_wait) begin
		  cmplx_samples_done_ns = 1'b0;
                  sm_ns = 4'd4;
		  oclk_center_write_resume_ns = 1'b1;
	        end
	      end 
	    end
	end 

	4'd4:
	    if (~resume_wait) begin 
	      if (mmcm_edge_detect_done) begin
	        ocd_edge_detect_rdy_ns = 1'b0;
      	        if (ocd_ktap_left_r) begin
		  ocd_ktap_left_ns = 1'b0;
		  ocd_ktap_right_ns = 1'b1;
		  oclk_center_write_resume_ns = 1'b0;
	          sm_ns = 4'd3;
	         end else if (ocd_ktap_right_r) begin
		   ocd_ktap_right_ns = 1'b0;
		   sm_ns =  4'd5;
		 end else if (~mmcm_lbclk_edge_aligned) begin
		    sm_ns = 4'd6;
		    oclk_center_write_resume_ns = 1'b0;  
	         end else begin
                     if (ninety_offsets_r != ninety_offsets_final_r && ocd_edge_detect_rdy_r) begin
                       ninety_offsets_ns = ninety_offsets_r + 2'b01;
		       sm_ns = 4'd5;
		     end else begin
		       oclk_center_write_resume_ns = 1'b0;
		       poc_backup_ns = poc_backup;

                       sm_ns = 4'd8;
	             end
		  end 
	      end else ocd_edge_detect_rdy_ns = 1'b1;
	    end 


       4'd5:
	 sm_ns = 4'd4;
	
       4'd6:
	 if (~resume_wait) begin
	   ocd2stg3_dec_r = 1'b1;
	   sm_ns = 4'd7;
	 end

       4'd7: begin
	   po_center_wait = 1'b1;    
           if (po_done_r) begin
             sm_ns = 4'd4;	  
             oclk_center_write_resume_ns = 1'b1;
	   end
       end
	   
       4'd8: begin
	 po_finish_scan = 1'b1;
	 if (resume_wait_r == 5'd1) begin
           if (~poc_backup_r) begin
             oclkdelay_center_calib_done_ns = 1'b1;
	     oclkdelay_center_calib_start_ns = 1'b0;
	   end
	 end
	 if (~resume_wait) begin
	   if (po_rdy)
	     if (poc_backup_r) begin
               ocd2stg3_inc_r = 1'b1;
	       poc_backup_ns = 1'b0;
	     end 
             else if (~final_stg2_inc && ~final_stg2_dec) begin
	       if (complex_oclkdelay_calib_start) cmplx_stg3_final_ns[oclkdelay_calib_cnt*6+:6] = stg3_r;
	       else simp_stg3_final_ns[oclkdelay_calib_cnt*6+:6] = stg3_r;
	       sm_ns = 4'd0;
	       scan_done_r = 1'b1;
	     end else begin
	       ocd2stg2_inc_r = final_stg2_inc;
	       ocd2stg2_dec_r = final_stg2_dec;
	     end
	 end 
      end 
	
      endcase 

    if (ocd2stg3_inc_r) begin
      stg3_ns = stg3_r + 6'h1;
      up_ns = 1'b0;
    end
    if (ocd2stg3_dec_r) begin
      stg3_ns = stg3_r - 6'h1;
      up_ns = 1'b1;
    end
    if (ocd2stg3_inc_r || ocd2stg3_dec_r) begin
      po_done_ns = 1'b0;
      two_ns = 2'b00;
    end

    if (~po_done_r)
      if (po_rdy)
         if (two_r == 2'b10 || po_center_wait || po_slew || po_finish_scan) po_done_ns = 1'b1;
         else begin
	   two_ns = two_r + 2'b1;
           if (up_r) begin
             stg2_ns = stg2_r + 9'b1;
	     if (stg2_r >= 9'd0 && stg2_r < 9'd63) ocd2stg2_inc_r = 1'b1;
	   end else begin
             stg2_ns = stg2_r - 9'b1;
	     if (stg2_r > 9'd0 && stg2_r <= 9'd63) ocd2stg2_dec_r = 1'b1;
	   end
	 end 

    if (ocd_ktap_left_ns && ~ocd_ktap_left_r) resume_wait_ns = 'b1;
    else if (oclk_center_write_resume_ns && ~oclk_center_write_resume_r) 
      resume_wait_ns = POC_SAMPLE_CLEAR_WAIT[RESUME_WAIT_WIDTH-1:0];
    else if (~oclk_center_write_resume_ns && oclk_center_write_resume_r) resume_wait_ns = 'd15;
    else if (cmplx_samples_done_ns & ~cmplx_samples_done_r || 
             complex_oclkdelay_calib_start & reset_scan ||
             poc_backup_r & ocd2stg3_inc_r) resume_wait_ns = 'd31;
    else if (|resume_wait_r) resume_wait_ns = resume_wait_r - 'd1;
    
  end 