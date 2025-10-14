  always @(posedge clk) begin
     if (hi_priority)
        was_priority <= #TCQ 1'b1;
     else
        was_priority <= #TCQ 1'b0;
  end