  always @(*) begin
    samps_zero_ns = samps_zero_r;
    samps_one_ns = samps_one_r;
    samps_zero_ns = samps_lo >= samps_solid_thresh;
    samps_one_ns = samps_hi_r >= samps_solid_thresh;
  end 