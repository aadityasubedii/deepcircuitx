  always @(posedge i_clk) begin
    if (i_rst) begin
      r_tick_counter <= 0;
    end else if (r_tick_counter == CLOCKS_PER_TICK-1) begin
      r_tick_counter <= 0;
    end else begin
      r_tick_counter <= r_tick_counter + 1;
    end
  end