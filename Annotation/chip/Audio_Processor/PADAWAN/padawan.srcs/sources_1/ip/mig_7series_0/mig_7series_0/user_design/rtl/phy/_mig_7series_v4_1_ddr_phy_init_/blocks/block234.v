  always @(posedge clk) begin
    if (rst)
      mpr_end_if_reset <= #TCQ 1'b0;
    else if (mpr_last_byte_done && (num_refresh != 'd0))
      mpr_end_if_reset <= #TCQ 1'b1;
    else
      mpr_end_if_reset <= #TCQ 1'b0;
  end