  always @(posedge clk)
    if (rst)begin
      init_state_r  <= #TCQ INIT_IDLE;
      init_state_r1 <= #TCQ INIT_IDLE;
    end else begin
      init_state_r  <= #TCQ init_next_state;
      init_state_r1 <= #TCQ init_state_r;
    end 