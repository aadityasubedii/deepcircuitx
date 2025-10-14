  always @ (posedge clk) begin
    prbs_rdlvl_done_pulse <= #TCQ prbs_rdlvl_done & ~prbs_rdlvl_done_r1;
  end