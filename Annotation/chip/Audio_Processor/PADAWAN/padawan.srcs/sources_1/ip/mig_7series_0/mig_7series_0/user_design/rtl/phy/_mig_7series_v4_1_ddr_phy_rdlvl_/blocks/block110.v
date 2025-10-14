  always @(posedge clk) begin
    rd_mux_sel_r <= #TCQ cal1_cnt_cpt_r;
  end