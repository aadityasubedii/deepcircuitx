    always @(posedge clk)
      chip_cnt_r <= #TCQ 2'b00;
  end else begin: dual_rank  