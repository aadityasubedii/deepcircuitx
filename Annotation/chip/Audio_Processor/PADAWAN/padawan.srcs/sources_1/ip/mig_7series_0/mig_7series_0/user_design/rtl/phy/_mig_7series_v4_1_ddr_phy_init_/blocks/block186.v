  always @ (posedge clk) begin
     if (rst || (wrlvl_done_r && ~wrlvl_done_r1))
       dqs_asrt_cnt <= #TCQ 2'd0;
     else if (wr_level_dqs_asrt && dqs_asrt_cnt != 2'd3)
       dqs_asrt_cnt <= #TCQ (dqs_asrt_cnt + 1);
  end