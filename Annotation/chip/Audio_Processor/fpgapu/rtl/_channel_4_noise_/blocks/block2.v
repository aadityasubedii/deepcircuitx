  always @(posedge i_clk) begin
    if (i_rst) begin
      r_shift_register <= 14'b1;
    end else if (w_phase_strobe) begin
      r_shift_register <= {r_shift_register[0] ^ r_shift_register[1], r_shift_register[13:1]};
    end
  end