  always @(posedge clk) begin
    if (rst) begin
	  lim_state           <= #TCQ IDLE;
	  lim_start_r         <= #TCQ 1'b0;
	  ktap_right_r        <= #TCQ 1'b0;
	  write_request_r     <= #TCQ 1'b0;
	  prech_req_r         <= #TCQ 1'b0;
	  poc_ready_r         <= #TCQ 1'b0;
	  detect_done_r       <= #TCQ 1'b0;
	  stg3_dec_r          <= #TCQ 1'b0;
	  stg2_inc_r          <= #TCQ 1'b0;
	  stg3_inc2init_val_r <= #TCQ 1'b0;
	  stg3_inc2init_val_r1<= #TCQ 1'b0;
	  stg3_dec2init_val_r <= #TCQ 1'b0;
	  stg3_dec2init_val_r1<= #TCQ 1'b0;
	  stg3_dec_req_r      <= #TCQ 1'b0;
	  stg3_inc_req_r      <= #TCQ 1'b0;
	  stg2_dec_req_r      <= #TCQ 1'b0;
	  stg2_inc_req_r      <= #TCQ 1'b0;
	  done_r              <= #TCQ 1'b0;
	  stg3_dec_val        <= #TCQ 'd0;
	  stg3_inc_val        <= #TCQ 'd0;
	  stg3_init_dec_r     <= #TCQ 1'b0;
	end else begin
	  lim_state           <= #TCQ lim_nxt_state;
	  lim_start_r         <= #TCQ lim_start;
	  ktap_right_r        <= #TCQ ktap_right;
	  write_request_r     <= #TCQ write_request;
	  prech_req_r         <= #TCQ prech_req;
	  poc_ready_r         <= #TCQ poc_ready;
	  detect_done_r       <= #TCQ poc2lim_detect_done;
	  stg3_dec_r          <= #TCQ stg3_dec;
	  stg2_inc_r          <= #TCQ stg2_inc;
	  stg3_inc2init_val_r <= #TCQ stg3_inc2init_val;
	  stg3_inc2init_val_r1<= #TCQ stg3_inc2init_val_r;
	  stg3_dec2init_val_r <= #TCQ stg3_dec2init_val;
	  stg3_dec2init_val_r1<= #TCQ stg3_dec2init_val_r;
	  stg3_dec_req_r      <= #TCQ stg3_dec_req;
	  stg3_inc_req_r      <= #TCQ stg3_inc_req;
	  stg2_dec_req_r      <= #TCQ stg2_dec_req;
	  stg2_inc_req_r      <= #TCQ stg2_inc_req;
	  stg3_init_dec_r     <= #TCQ stg3_init_dec;
	  done_r              <= #TCQ done;
	  if (stg3_init_val > (('d63 - wl_po_fine_cnt)/2))
	    stg3_dec_val      <= #TCQ (stg3_init_val - ('d63 - wl_po_fine_cnt)/2);
	  else
	    stg3_dec_val      <= #TCQ 'd0;
	  if (stg3_init_val < 'd63 - ((wl_po_fine_cnt)/2))
	    stg3_inc_val      <= #TCQ (stg3_init_val + (wl_po_fine_cnt)/2);
	  else
	    stg3_inc_val      <= #TCQ 'd63;
	end
  end