  always @(posedge clk) begin
    sr_valid_r1  <= #TCQ sr_valid_r;
    sr_valid_r2  <= #TCQ sr_valid_r1;
    mpr_valid_r1 <= #TCQ mpr_valid_r;
    mpr_valid_r2 <= #TCQ mpr_valid_r1;
  end