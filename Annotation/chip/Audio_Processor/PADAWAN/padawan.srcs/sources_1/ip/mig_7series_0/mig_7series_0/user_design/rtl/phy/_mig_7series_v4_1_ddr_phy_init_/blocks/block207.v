  always @(posedge clk) begin
    if (rst || (init_state_r == INIT_RDLVL_COMPLEX_READ))
	  ext_int_ref_req <= #TCQ 1'b0;
	else if ((init_state_r == INIT_RDLVL_ACT_WAIT) && complex_rdlvl_int_ref_req)
	  ext_int_ref_req <= #TCQ 1'b1;
  end