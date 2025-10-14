  always @(posedge clk) begin
    mux_rd_valid_r <= #TCQ ~phy_if_empty && prbs_rdlvl_start;
    rd_valid_r1    <= #TCQ mux_rd_valid_r;
    rd_valid_r2    <= #TCQ rd_valid_r1;
    rd_valid_r3    <= #TCQ rd_valid_r2;
  end