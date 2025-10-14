  always @(posedge clk) begin
    rd_mux_sel_r <= #TCQ wrcal_dqs_cnt_r;
  end