  always @(*) 
    if (rst) samp_result_ns = 'b0;
    else begin
      samp_result_ns = samp_result_r;
      if (samp_valid) begin
	if (~samp_result_r[0] && zero_ge_thresh) samp_result_ns[0] = 'b1;
        if (samp_result_r[0] && zero_le_half_thresh) samp_result_ns[0] = 'b0;
	if (~samp_result_r[1] && oneeighty_ge_thresh) samp_result_ns[1] = 'b1;
        if (samp_result_r[1] && oneeighty_le_half_thresh) samp_result_ns[1] = 'b0;
      end
    end