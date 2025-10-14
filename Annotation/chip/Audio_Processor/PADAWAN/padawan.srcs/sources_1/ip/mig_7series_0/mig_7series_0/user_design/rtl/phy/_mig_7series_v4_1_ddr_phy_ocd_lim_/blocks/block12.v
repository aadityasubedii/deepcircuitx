  always @(posedge clk) begin
    if ((lim_state == WAIT_WR_REQ) ||
        (lim_state == WAIT_STG3) ||
		(lim_state == INIT))
      wait_cnt_en_r <= #TCQ 1'b1;
    else
      wait_cnt_en_r <= #TCQ 1'b0;
  end