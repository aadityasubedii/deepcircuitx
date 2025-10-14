      always @(posedge clk) begin
        if ((init_state_r == INIT_LOAD_MR) ||
            (init_state_r == INIT_MPR_RDEN) ||
            (init_state_r == INIT_MPR_DISABLE) ||
            (init_state_r == INIT_REG_WRITE) ||
            (init_state_r == INIT_WRLVL_START) ||
            (init_state_r == INIT_WRLVL_LOAD_MR) ||
            (init_state_r == INIT_WRLVL_LOAD_MR2) ||
            (init_state_r == INIT_REFRESH) ||
            (rdlvl_wr_rd && new_burst_r))begin
          phy_cas_n[0] <= #TCQ 1'b1;
          phy_cas_n[1] <= #TCQ 1'b0;
        end else begin
          phy_cas_n[0] <= #TCQ 1'b1;
          phy_cas_n[1] <= #TCQ 1'b1;
        end
      end