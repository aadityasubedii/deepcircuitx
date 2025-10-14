  always @(posedge clk) begin
    if (rst || (init_state_r == INIT_OCAL_CENTER_ACT) || oclkdelay_calib_done || ocal_last_byte_done || oclkdelay_center_calib_done)
	  oclkdelay_int_ref_req <= #TCQ 1'b0;
	else if (oclkdelay_ref_cnt == 'd1)
	  oclkdelay_int_ref_req <= #TCQ 1'b1;
  end