  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          init_done <= 0;
      else if (1)
          init_done <= init_done | (i_state == 3'b101);
    end