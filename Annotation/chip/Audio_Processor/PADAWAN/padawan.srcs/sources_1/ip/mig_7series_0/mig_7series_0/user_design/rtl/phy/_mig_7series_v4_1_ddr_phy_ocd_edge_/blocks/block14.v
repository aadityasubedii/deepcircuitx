  always @(*)
    if (samp_valid) prev_samp_ns = samp_result;
    else prev_samp_ns = prev_samp_r;