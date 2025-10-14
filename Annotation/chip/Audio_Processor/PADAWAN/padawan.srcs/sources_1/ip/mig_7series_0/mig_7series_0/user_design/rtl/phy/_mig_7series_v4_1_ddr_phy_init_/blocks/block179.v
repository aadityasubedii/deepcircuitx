  always @(posedge clk) begin
    if (rst || prech_done_r3)
      mask_lim_done <= #TCQ 1'b0;
    else if (prech_pending_r)
      mask_lim_done <= #TCQ 1'b1;
  end