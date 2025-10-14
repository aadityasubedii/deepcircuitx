  always @(posedge clk)
    if (rst) begin
      tg_timer_go     <= #TCQ 1'b0;
    end else if ((PRE_REV3ES == "ON") && temp_wrcal_done && temp_lmr_done &&
              (init_state_r == INIT_WRCAL_READ_WAIT)) begin
      tg_timer_go     <= #TCQ 1'b1;
    end else begin
      tg_timer_go     <= #TCQ 1'b0;
    end