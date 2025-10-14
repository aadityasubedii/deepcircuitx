      always @ (posedge clk)
        if (rst)
          enable_wrlvl_cnt <= #TCQ 5'd0;
        else if ((init_state_r == INIT_WRLVL_START) ||
                 (wrlvl_odt && (enable_wrlvl_cnt == 5'd0)))
          enable_wrlvl_cnt <= #TCQ 5'd12;
        else if ((enable_wrlvl_cnt > 5'd0) && ~(phy_ctl_full || phy_cmd_full))
          enable_wrlvl_cnt <= #TCQ enable_wrlvl_cnt - 1;
          