  always @(posedge clk) begin
    pi_dqs_found_err    <= #TCQ |pi_dqs_found_err_r;
  end
  