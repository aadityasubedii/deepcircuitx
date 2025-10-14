  always @(posedge i_clk) begin
    if (i_rst) begin
      r_envelope_index <= 0;
    end else if (r_new_note) begin
      r_envelope_index <= 0;
    end else if (i_tick_stb) begin
      if (r_envelope_index == 4'd15) begin
        r_envelope_index <= 4'd15;
      end else begin
        r_envelope_index <= r_envelope_index + 1;
      end
    end
  end