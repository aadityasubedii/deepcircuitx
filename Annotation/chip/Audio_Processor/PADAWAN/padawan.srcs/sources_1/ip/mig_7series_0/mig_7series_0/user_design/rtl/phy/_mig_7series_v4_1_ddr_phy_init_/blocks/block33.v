        always @(posedge clk) begin
          if ((init_state_r == INIT_LOAD_MR) ||
              (init_state_r == INIT_MPR_RDEN) ||
              (init_state_r == INIT_MPR_DISABLE) ||
              (init_state_r == INIT_REG_WRITE) ||
              (init_state_r == INIT_WRLVL_START) ||
              (init_state_r == INIT_WRLVL_LOAD_MR) ||
              (init_state_r == INIT_WRLVL_LOAD_MR2) ||
              (init_state_r == INIT_RDLVL_ACT) ||
              (init_state_r == INIT_WRCAL_ACT) ||
              (init_state_r == INIT_OCLKDELAY_ACT) ||
              (init_state_r == INIT_OCAL_COMPLEX_ACT) ||    
              (init_state_r == INIT_OCAL_CENTER_ACT) ||              
              (init_state_r == INIT_PRECHARGE) ||
              (init_state_r == INIT_DDR2_PRECHARGE) ||
              (init_state_r == INIT_REFRESH) ||
              (init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE) ||
              (init_state_r == INIT_RDLVL_COMPLEX_ACT))begin
          phy_ras_n[0] <= #TCQ 1'b0;
          phy_ras_n[1] <= #TCQ 1'b1;
        end else begin
          phy_ras_n[0] <= #TCQ 1'b1;
          phy_ras_n[1] <= #TCQ 1'b1;
          end
        end