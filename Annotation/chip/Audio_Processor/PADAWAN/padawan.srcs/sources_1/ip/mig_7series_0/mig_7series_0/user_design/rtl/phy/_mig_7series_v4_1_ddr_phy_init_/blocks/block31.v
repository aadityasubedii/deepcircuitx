        always @(posedge clk) begin
          if ((init_state_r == INIT_LOAD_MR) ||
              (init_state_r == INIT_MPR_RDEN) ||
              (init_state_r == INIT_MPR_DISABLE) ||
              (init_state_r == INIT_REG_WRITE) ||
              (init_state_r == INIT_ZQCL) ||
              (init_state_r == INIT_WRLVL_START) ||
              (init_state_r == INIT_WRLVL_LOAD_MR) ||
              (init_state_r == INIT_WRLVL_LOAD_MR2) ||
              (init_state_r == INIT_PRECHARGE) ||
              (init_state_r == INIT_DDR2_PRECHARGE)||
              (init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE) ||
              (rdlvl_wr && new_burst_r))begin
          phy_we_n[0] <= #TCQ 1'b0;
          phy_we_n[1] <= #TCQ 1'b1;
        end else begin
          phy_we_n[0] <= #TCQ 1'b1;
          phy_we_n[1] <= #TCQ 1'b1;
        end
      end