  always @(posedge clk) begin
    if (rst || (init_state_r == INIT_RDLVL_ACT_WAIT) || prbs_rdlvl_done)
	  complex_rdlvl_int_ref_req <= #TCQ 1'b0;
	else if (oclkdelay_ref_cnt == 'd1)

	  complex_rdlvl_int_ref_req <= #TCQ 1'b0;   
  end