  always @(posedge clk) begin
    if (rst)
	  stg2_tap_cnt <= #TCQ 'd0;
	else if ((lim_state == IDLE) || (lim_state == INIT))
	  stg2_tap_cnt <= #TCQ wl_po_fine_cnt;
	else if (lim_state == STAGE2_INC)
	  stg2_tap_cnt <= #TCQ stg2_tap_cnt + 1;
	else if (lim_state == STAGE2_DEC)
	  stg2_tap_cnt <= #TCQ stg2_tap_cnt - 1;
  end