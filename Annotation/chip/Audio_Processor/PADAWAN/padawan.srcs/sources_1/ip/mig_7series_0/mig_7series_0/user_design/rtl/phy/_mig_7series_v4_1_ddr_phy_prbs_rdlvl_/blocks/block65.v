  always @(posedge clk) begin
    rd_mux_sel_r <= #TCQ prbs_dqs_cnt_r;
  end