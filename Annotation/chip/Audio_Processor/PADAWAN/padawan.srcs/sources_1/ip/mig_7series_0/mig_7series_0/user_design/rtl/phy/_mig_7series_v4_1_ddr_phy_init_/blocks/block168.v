  always @(posedge clk) begin
    if (rst)
      tg_timer_done <= #TCQ 1'b0;
    else if (tg_timer == TG_TIMER_TIMEOUT)
      tg_timer_done <= #TCQ 1'b1;
    else
      tg_timer_done <= #TCQ 1'b0;
  end