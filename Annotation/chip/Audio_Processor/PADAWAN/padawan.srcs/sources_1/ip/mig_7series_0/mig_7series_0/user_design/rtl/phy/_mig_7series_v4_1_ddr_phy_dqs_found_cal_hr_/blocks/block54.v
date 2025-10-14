  always @(posedge clk) begin
    pi_dqs_found_all_bank_r <= #TCQ pi_dqs_found_all_bank;
    pi_dqs_found_any_bank_r <= #TCQ pi_dqs_found_any_bank;
  end