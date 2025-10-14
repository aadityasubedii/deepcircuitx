  always @(posedge i_clk) begin
    if (i_rst) begin
      r_beat_counter <= 0;
    end else if (o_tick_stb) begin
      if (r_beat_counter == TICKS_PER_BEAT-1) begin
        r_beat_counter <= 0;
      end else begin
        r_beat_counter <= r_beat_counter + 1;
      end
    end
  end