  always @(posedge clk) begin
    cal1_state_r1 <= #TCQ cal1_state_r;
    cal1_state_r2 <= #TCQ cal1_state_r1;
    cal1_state_r3 <= #TCQ cal1_state_r2;
  end