  always @(*) begin
	  lim_nxt_state     = lim_state;
	  ktap_right        = ktap_right_r;
	  write_request     = write_request_r;
	  prech_req         = prech_req_r;
	  poc_ready         = poc_ready_r;
	  stg3_dec          = stg3_dec_r;
	  stg2_inc          = stg2_inc_r;
	  stg3_inc2init_val = stg3_inc2init_val_r;
	  stg3_dec2init_val = stg3_dec2init_val_r;
	  stg3_dec_req      = stg3_dec_req_r;
	  stg3_inc_req      = stg3_inc_req_r;
	  stg2_inc_req      = stg2_inc_req_r;
	  stg2_dec_req      = stg2_dec_req_r;
	  stg3_init_dec     = stg3_init_dec_r;
	  done              = done_r;

	
	  case(lim_state)
	    IDLE: begin
	      if (lim_start && !lim_start_r) begin
                lim_nxt_state = INIT;
                stg3_dec      = 1'b1;
                stg2_inc      = 1'b1;
                stg3_init_dec = 1'b1;
                done          = 1'b0;
	      end
	      
              else if (oclkdelay_calib_done && !oclkdelay_calib_done_r && (BYPASS_COMPLEX_OCAL == "FALSE")) begin
                done          = 1'b0;
              end
	    end
	    INIT: begin
	      ktap_right     = 1'b1;
		  
		  if (wait_cnt_done)
  	        lim_nxt_state  = STAGE2_TAP_CHK;
	    end
	    
	    WAIT_WR_REQ: begin
	      write_request  = 1'b1;
	      if (wait_cnt_done) begin
	  	    poc_ready      = 1'b1;
	  	    lim_nxt_state  = WAIT_POC_DONE;
	  	  end
	    end
	    
	    WAIT_POC_DONE: begin
	  	  if (poc2lim_detect_done) begin
	  	    write_request  = 1'b0;
			poc_ready      = 1'b0;
	  	    lim_nxt_state  = WAIT_STG3;
	  	  end
	    end
	    
	    WAIT_STG3: begin
	      if (wait_cnt_done) begin
	  	    if (stg3_dec_r) begin
	  	    
	  	      if ((stg3_tap_cnt > 'd0) && (mmcm_sub_dec < TDQSS_LIM_MMCM_TAPS))
	  	        lim_nxt_state  = STAGE3_DEC;
	  		  else begin
	  		    stg3_dec          = 1'b0;
	  		    stg3_inc2init_val = 1'b1;
	  		    lim_nxt_state     = STAGE3_INC;
	  		  end
	  	    end else begin 
	  	    
	  	      if ((stg3_tap_cnt < 'd63) && (mmcm_sub_inc < TDQSS_LIM_MMCM_TAPS))
	  	        lim_nxt_state  = STAGE3_INC;
	  		  else begin
	  		    stg3_dec2init_val = 1'b1;
                lim_nxt_state  = STAGE3_DEC;
              end
            end			
	  	  end
	    end
	    STAGE3_INC: begin
	      stg3_inc_req   = 1'b1;
	  	  lim_nxt_state  = STG3_INCDEC_WAIT;
	    end
	    STAGE3_DEC: begin
	      stg3_dec_req   = 1'b1;   
	  	  lim_nxt_state  = STG3_INCDEC_WAIT;
	    end
	    
	    STG3_INCDEC_WAIT: begin
	      stg3_dec_req   = 1'b0;
	  	  stg3_inc_req   = 1'b0;
	      if (!stg3_dec_req_r && !stg3_inc_req_r && po_rdy) begin
		    if (stg3_init_dec_r) begin
			  
			  if (stg3_tap_cnt > stg3_dec_val)
			    lim_nxt_state  = STAGE3_DEC;
			  else begin
			    lim_nxt_state  = WAIT_WR_REQ;
				stg3_init_dec  = 1'b0;
			  end
	        end else if (stg3_dec2init_val_r) begin 
			  if (stg3_tap_cnt > stg3_init_val)
	  	        lim_nxt_state  = STAGE3_DEC;
			  else
			    lim_nxt_state  = STAGE2_TAP_CHK;
	  	    end else if (stg3_inc2init_val_r) begin
			  if (stg3_tap_cnt < stg3_inc_val)
	  	        lim_nxt_state  = STAGE3_INC;
			  else
			    lim_nxt_state  = STAGE2_TAP_CHK;
	  	    end else begin
	  	      lim_nxt_state  = WAIT_WR_REQ;
			end
	  	  end
	    end
	    
	    STAGE2_TAP_CHK: begin
	      if (stg3_dec2init_val_r) begin
		    
	  	    if (stg2_tap_cnt < wl_po_fine_cnt)
	  	      lim_nxt_state  = STAGE2_INC;
	        else begin
	          lim_nxt_state     = PRECH_REQUEST;	  		  
	  	    end
	  	  end else if (stg3_inc2init_val_r) begin
		    
	  	    if (stg2_tap_cnt > 'd0)
	  	      lim_nxt_state  = STAGE2_DEC;
	  	    else begin
	  	      lim_nxt_state     = PRECH_REQUEST;
	  		  stg3_inc2init_val = 1'b0;
	  	    end
		  end else if (stg2_inc_r && (stg2_tap_cnt < 'd63)) begin
		    
	  	    lim_nxt_state  = STAGE2_INC;
          end else begin
            lim_nxt_state  = STG3_INCDEC_WAIT;
			stg2_inc       = 1'b0;
		  end
	    end
	    STAGE2_INC: begin
	      stg2_inc_req = 1'b1;
	  	  lim_nxt_state  = STG2_INCDEC_WAIT;
	    end
	    STAGE2_DEC: begin
	      stg2_dec_req = 1'b1;
	  	  lim_nxt_state  = STG2_INCDEC_WAIT;
	    end
	    
	    STG2_INCDEC_WAIT: begin
	      stg2_inc_req = 1'b0;
	  	  stg2_dec_req = 1'b0;
	  	  if (!stg2_inc_req_r && !stg2_dec_req_r && po_rdy)
	  	    lim_nxt_state  = STAGE2_TAP_CHK;
	    end
		PRECH_REQUEST: begin
		  prech_req = 1'b1;
		  if (prech_done) begin
		    prech_req       = 1'b0;
		    if (stg3_dec2init_val_r)
			  lim_nxt_state = LIMIT_DONE;
			else
		      lim_nxt_state = WAIT_WR_REQ;
		  end
		end
	    LIMIT_DONE: begin
	      done              = 1'b1;
	  	  ktap_right        = 1'b0;
		  stg3_dec2init_val = 1'b0;
		  lim_nxt_state     = IDLE;
	    end
	    default: begin
	      lim_nxt_state = IDLE;
	    end
	  endcase
  end