  always @(posedge i_clk) begin
    if (i_top_valid) begin
      r_latched_top <= i_top;
    end

    if (i_compare_valid) begin
      r_latched_compare <= i_compare;
    end

    if (r_counter == r_top) begin
      r_counter <= 0;
      
      r_top <= r_latched_top;
      r_compare <= r_latched_compare;
      o_cycle_end <= 1;
    end else begin
      r_counter <= r_counter + 1;
      o_cycle_end <= 0;
    end
  end