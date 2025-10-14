  always @(posedge i_clk) begin
    if (i_rst) begin
      r_vibrato_adjust_index <= 0;
    end else if (r_new_vibrato) begin
      r_vibrato_adjust_index <= 0;
    end else if (i_tick_stb) begin
      if (r_vibrato_adjust_index == 3'd07) begin
        r_vibrato_adjust_index <= 0;
      end else begin
        r_vibrato_adjust_index <= r_vibrato_adjust_index + 1;
      end
    end
  end