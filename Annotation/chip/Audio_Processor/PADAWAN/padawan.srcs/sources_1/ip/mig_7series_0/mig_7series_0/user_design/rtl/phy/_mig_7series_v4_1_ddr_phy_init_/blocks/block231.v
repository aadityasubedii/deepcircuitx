  always @(posedge clk)
    if (rst) begin
      init_complete_r     <= #TCQ 1'b0;
      init_complete_r_timing <= #TCQ 1'b0;
      init_complete_r1    <= #TCQ 1'b0;
      init_complete_r1_timing <= #TCQ 1'b0; 
      init_complete_r2    <= #TCQ 1'b0;
      init_calib_complete <= #TCQ 1'b0;
    end else begin
      if (init_state_r == INIT_DONE) begin
        init_complete_r   <= #TCQ 1'b1;
        init_complete_r_timing <= #TCQ 1'b1;
      end
      init_complete_r1    <= #TCQ init_complete_r;
      init_complete_r1_timing <= #TCQ init_complete_r_timing; 
      init_complete_r2    <= #TCQ init_complete_r1; 
      init_calib_complete <= #TCQ init_complete_r2;
    end 