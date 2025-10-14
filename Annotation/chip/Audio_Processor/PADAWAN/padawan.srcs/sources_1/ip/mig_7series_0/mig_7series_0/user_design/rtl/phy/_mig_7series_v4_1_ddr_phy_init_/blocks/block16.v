    always @(posedge clk)
      if (rst)begin
        calib_cke <= #TCQ {nCK_PER_CLK{1'b0}} ;
        calib_odt <= 2'b00 ;
      end else begin
        if (cnt_pwron_cke_done_r )begin
          calib_cke <= #TCQ {nCK_PER_CLK{1'b1}};
        end else begin
          calib_cke <= #TCQ {nCK_PER_CLK{1'b0}};
        end
        if (((DRAM_TYPE == "DDR2") && (RTT_NOM == "DISABLED")) ||
            ((DRAM_TYPE == "DDR3") &&
             (RTT_NOM == "DISABLED") && (RTT_WR == "OFF"))) begin
          calib_odt[0] <= #TCQ 1'b0;
          calib_odt[1] <= #TCQ 1'b0;
        end else if (((init_state_r == INIT_WRLVL_WAIT) && wrlvl_odt) || 
                      (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                      (init_state_r == INIT_OCAL_COMPLEX_WRITE_WAIT) ||
                      (init_state_r == INIT_WRCAL_WRITE) ||
                      (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                      (init_state_r == INIT_OCLKDELAY_WRITE)) begin
           
            if (nCK_PER_CLK == 2) begin
              calib_odt[0] 
                <= #TCQ (!calib_odt[0]) ? phy_tmp_odt_r[0] : 1'b0;
              calib_odt[1] 
                <= #TCQ (!calib_odt[1]) ? phy_tmp_odt_r[1] : 1'b0;
            end else begin 
              calib_odt[0] <= #TCQ phy_tmp_odt_r[0];
              calib_odt[1] <= #TCQ phy_tmp_odt_r[1];
            end
        
        end else if(((DRAM_TYPE == "DDR3") && (RTT_WR != "OFF")) &&
                    ((init_state_r == INIT_PI_PHASELOCK_READS) ||
                     (init_state_r == INIT_MPR_READ) ||
                     (init_state_r == INIT_RDLVL_STG1_READ) ||
                     (init_state_r == INIT_RDLVL_COMPLEX_READ) ||
                     (init_state_r == INIT_RDLVL_STG2_READ) ||
                     (init_state_r == INIT_OCLKDELAY_READ) ||
                     (init_state_r == INIT_WRCAL_READ) ||
                     (init_state_r == INIT_WRCAL_MULT_READS))) begin
            if (nCK_PER_CLK == 2) begin
              calib_odt[0] 
                <= #TCQ (!calib_odt[0]) ? phy_tmp_odt_r[0] : 1'b0;
              calib_odt[1] 
                <= #TCQ (!calib_odt[1]) ? phy_tmp_odt_r[1] : 1'b0;
            end else begin 
              calib_odt[0] <= #TCQ phy_tmp_odt_r[0];
              calib_odt[1] <= #TCQ phy_tmp_odt_r[1];
            end
        
        end else if(cnt_cmd_done_m7_r ||
                   (init_state_r == INIT_WRLVL_WAIT && ~wrlvl_odt))
          calib_odt <= #TCQ 2'b00;
      end
  end