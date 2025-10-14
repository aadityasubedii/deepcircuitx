  always @(posedge clk) begin
    prbs_state_r1      <= #TCQ prbs_state_r;
    prbs_rdlvl_start_r <= #TCQ prbs_rdlvl_start;
  end