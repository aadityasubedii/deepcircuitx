  always @(posedge clk)
    if (rst || wrlvl_rank_done || done_dqs_tap_inc)
      wrlvl_active <= #TCQ 1'b0;
    else if ((enable_wrlvl_cnt == 5'd1) && wrlvl_odt && !wrlvl_active)
      wrlvl_active <= #TCQ 1'b1;
