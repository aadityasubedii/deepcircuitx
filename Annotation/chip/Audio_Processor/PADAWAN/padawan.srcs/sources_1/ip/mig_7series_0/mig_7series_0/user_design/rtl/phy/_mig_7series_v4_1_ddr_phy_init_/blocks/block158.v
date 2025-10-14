  always @(posedge clk)
    if (init_state_r == INIT_ZQCL) begin
      cnt_dllk_zqinit_r      <= #TCQ 'b0;
      cnt_dllk_zqinit_done_r <= #TCQ 1'b0;
    end else if (~(phy_ctl_full || phy_cmd_full))  begin
      cnt_dllk_zqinit_r <= #TCQ cnt_dllk_zqinit_r + 1;
      if (!cnt_dllk_zqinit_done_r) 
        cnt_dllk_zqinit_done_r 
          <= #TCQ (cnt_dllk_zqinit_r == TDLLK_TZQINIT_DELAY_CNT);
    end