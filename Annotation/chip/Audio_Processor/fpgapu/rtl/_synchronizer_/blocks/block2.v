  always @(posedge i_clk) begin
    {r_input_sync_2, r_input_sync_1} <= {r_input_sync_1, i_input};
  end