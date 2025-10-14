  always @(posedge clk) begin
    if (rst)
      wl_sm_start        <= #TCQ 1'b0;
    else
      wl_sm_start        <= #TCQ wr_level_dqs_asrt_r1;
  end