    always @(posedge clk) begin
      if (rst || (done_dqs_tap_inc &&
         (init_state_r == INIT_WRLVL_LOAD_MR2)))
        write_calib <= #TCQ 1'b0;
      else if (wrlvl_active_r1)
        write_calib <= #TCQ 1'b1;
    end