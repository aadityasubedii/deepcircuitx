  always @ (posedge clk) begin
     if (rst || ~wrlvl_active)
       wr_lvl_start <= #TCQ 1'd0;
     else if (dqs_asrt_cnt == 2'd3)
       wr_lvl_start <= #TCQ 1'd1;
  end