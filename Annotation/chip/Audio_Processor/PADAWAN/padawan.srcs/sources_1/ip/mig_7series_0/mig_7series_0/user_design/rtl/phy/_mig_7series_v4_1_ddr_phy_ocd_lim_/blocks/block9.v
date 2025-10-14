  always @(posedge clk) begin
    if (rst)
	  stg3_init_val <= #TCQ oclkdelay_init_val;
	else if (oclkdelay_calib_done)
	  stg3_init_val <= #TCQ simp_stg3_final_sel;
	else
	  stg3_init_val <= #TCQ oclkdelay_init_val;
  end