  always @(*) begin
    prev_samp_valid_ns = prev_samp_valid_r;
    if (reset_scan) prev_samp_valid_ns = 1'b0;
    else if (samp_valid) prev_samp_valid_ns = 1'b1;
  end