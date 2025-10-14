  always @(posedge i_clk) begin
    if (i_rst) begin
      r_phase_delta <= 0;
    end else if (i_phase_delta_valid) begin
      r_phase_delta <= i_phase_delta;
    end

    {r_phase_strobe, r_phase} <= r_phase + r_phase_delta;
  end