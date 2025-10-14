    always @(posedge clk_i)
      sel   <= #TCQ {DQ_WIDTH/8{8'h08}};
  end else begin: victim_sel_rotate