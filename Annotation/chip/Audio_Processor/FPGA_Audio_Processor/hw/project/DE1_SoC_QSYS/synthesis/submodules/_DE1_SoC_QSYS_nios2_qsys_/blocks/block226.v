  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          hbreak_pending <= 1'b0;
      else 
        hbreak_pending <= hbreak_pending_nxt;
    end