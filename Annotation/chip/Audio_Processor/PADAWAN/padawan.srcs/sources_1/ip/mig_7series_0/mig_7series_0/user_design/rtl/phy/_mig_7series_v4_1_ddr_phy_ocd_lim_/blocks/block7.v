  always @(posedge clk) begin
    if (rst)
	  stg3_tap_cnt <= #TCQ stg3_init_val;
	else if ((lim_state == IDLE) || (lim_state == INIT))
	  stg3_tap_cnt <= #TCQ stg3_init_val;
	else if (lim_state == STAGE3_INC)
	  stg3_tap_cnt <= #TCQ stg3_tap_cnt + 1;
	else if (lim_state == STAGE3_DEC)
	  stg3_tap_cnt <= #TCQ stg3_tap_cnt - 1;
  end