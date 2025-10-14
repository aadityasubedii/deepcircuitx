  always @(posedge clk) begin
    if (rst)
      no_rst_tg_mc <= #TCQ 1'b0;
    else if ((init_state_r == INIT_WRCAL_ACT) && wrcal_read_req)
      no_rst_tg_mc <= #TCQ 1'b1;
    else
      no_rst_tg_mc <= #TCQ 1'b0;
  end