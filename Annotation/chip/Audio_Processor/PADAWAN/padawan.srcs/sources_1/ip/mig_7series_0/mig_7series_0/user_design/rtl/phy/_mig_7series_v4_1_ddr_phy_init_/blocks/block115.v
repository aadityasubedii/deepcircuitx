     always @(posedge clk) begin
       if (rst)
         phy_int_cs_n <= #TCQ {CS_WIDTH*nCS_PER_RANK*nCK_PER_CLK{1'b1}};
       else if (init_state_r == INIT_REG_WRITE) begin
         phy_int_cs_n <= #TCQ {CS_WIDTH*nCS_PER_RANK*nCK_PER_CLK{1'b1}};
         if(!(CWL_M%2)) begin
           phy_int_cs_n[0%nCK_PER_CLK] <= #TCQ 1'b0;
           phy_int_cs_n[1%nCK_PER_CLK] <= #TCQ 1'b0;
         end else begin
           phy_int_cs_n[2%nCK_PER_CLK] <= #TCQ 1'b0;
           phy_int_cs_n[3%nCK_PER_CLK] <= #TCQ 1'b0;
     end
       end else begin
         phy_int_cs_n <= #TCQ {CS_WIDTH*nCS_PER_RANK*nCK_PER_CLK{1'b1}};
         case (chip_cnt_r)
           2'b00:begin
             if ((init_state_r == INIT_LOAD_MR) ||
                    (init_state_r == INIT_MPR_RDEN) ||
                    (init_state_r == INIT_MPR_DISABLE) ||
                    (init_state_r == INIT_WRLVL_START) ||
                    (init_state_r == INIT_WRLVL_LOAD_MR) ||
                    (init_state_r == INIT_WRLVL_LOAD_MR2) ||
                    (init_state_r == INIT_ZQCL) ||
                    (init_state_r == INIT_RDLVL_ACT) ||
                    (init_state_r == INIT_WRCAL_ACT) ||
                    (init_state_r == INIT_OCLKDELAY_ACT) ||
                    (init_state_r == INIT_OCAL_COMPLEX_ACT) ||
                    (init_state_r == INIT_OCAL_CENTER_ACT) ||
                    (init_state_r == INIT_PRECHARGE) ||
                    (init_state_r == INIT_DDR2_PRECHARGE) ||
                    (init_state_r == INIT_REFRESH) ||
                    (init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE) ||
                    (init_state_r == INIT_RDLVL_COMPLEX_ACT) ||
                    (rdlvl_wr_rd && new_burst_r && ~mmcm_wr)) begin
               phy_int_cs_n    <= #TCQ {CS_WIDTH*nCS_PER_RANK*nCK_PER_CLK{1'b1}};
               if (!(CWL_M % 2)) begin 
                 for (n = 0; n < nCS_PER_RANK; n = n + 1) begin 
                   phy_int_cs_n[n] <= #TCQ 1'b0;
                 end
               end else begin 
                 for (p = CS_WIDTH*nCS_PER_RANK; p < (CS_WIDTH*nCS_PER_RANK + nCS_PER_RANK); p = p + 1) begin
                   phy_int_cs_n[p] <= #TCQ 1'b0;
                 end
               end
             end else
               phy_int_cs_n <= #TCQ {CS_WIDTH*nCS_PER_RANK*nCK_PER_CLK{1'b1}};
             
             
             
             
           end
           2'b01:begin
             if ((init_state_r == INIT_LOAD_MR) ||
                    (init_state_r == INIT_MPR_RDEN) ||
                    (init_state_r == INIT_MPR_DISABLE) ||
                    (init_state_r == INIT_WRLVL_START) ||
                    (init_state_r == INIT_WRLVL_LOAD_MR) ||
                    (init_state_r == INIT_WRLVL_LOAD_MR2) ||
                    (init_state_r == INIT_ZQCL) ||
                    (init_state_r == INIT_RDLVL_ACT) ||
                    (init_state_r == INIT_WRCAL_ACT) ||
                    (init_state_r == INIT_OCLKDELAY_ACT) ||
                    (init_state_r == INIT_OCAL_COMPLEX_ACT) ||
                    (init_state_r == INIT_OCAL_CENTER_ACT) ||
                    (init_state_r == INIT_PRECHARGE) ||
                    (init_state_r == INIT_DDR2_PRECHARGE) ||
                    (init_state_r == INIT_REFRESH) ||
                    (init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE) ||
                    (init_state_r == INIT_RDLVL_COMPLEX_ACT) ||
                    (rdlvl_wr_rd && new_burst_r && ~mmcm_wr)) begin
               phy_int_cs_n    <= #TCQ {CS_WIDTH*nCS_PER_RANK*nCK_PER_CLK{1'b1}};
               if (!(CWL_M % 2)) begin 
                 for (q = nCS_PER_RANK; q < (2 * nCS_PER_RANK); q = q + 1) begin 
                   phy_int_cs_n[q] <= #TCQ 1'b0;
                 end
               end else begin 
                 for (m = (nCS_PER_RANK*CS_WIDTH + nCS_PER_RANK); m < (nCS_PER_RANK*CS_WIDTH + 2*nCS_PER_RANK); m = m + 1) begin
                   phy_int_cs_n[m] <= #TCQ 1'b0;
                 end
               end
             end else
               phy_int_cs_n <= #TCQ {CS_WIDTH*nCS_PER_RANK*nCK_PER_CLK{1'b1}};
             
             
             
             
           end
         endcase
       end
     end 