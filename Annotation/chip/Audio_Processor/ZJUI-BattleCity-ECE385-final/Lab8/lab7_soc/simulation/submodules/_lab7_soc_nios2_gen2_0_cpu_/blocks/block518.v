  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          trigger_state <= 0;
      else if (trigger_state_1 & (xbrk_goto0 | dbrk_goto0))
          trigger_state <= 0;
      else if (trigger_state_0 & (xbrk_goto1 | dbrk_goto1))
          trigger_state <= -1;
    end