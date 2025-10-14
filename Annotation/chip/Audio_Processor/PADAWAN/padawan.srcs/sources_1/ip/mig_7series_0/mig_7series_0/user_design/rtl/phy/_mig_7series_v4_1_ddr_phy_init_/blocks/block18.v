    always @(posedge clk)
      if (rst) begin
    calib_cke <= #TCQ {nCK_PER_CLK{1'b0}} ;
    calib_odt <= 2'b00 ;
      end else begin
        if (cnt_pwron_cke_done_r )begin
          calib_cke <= #TCQ {nCK_PER_CLK{1'b1}};
        end else begin
          calib_cke <= #TCQ {nCK_PER_CLK{1'b0}};
        end
        if ((((RTT_NOM == "DISABLED") && (RTT_WR == "OFF"))

) && (DRAM_TYPE == "DDR3")) begin
          calib_odt[0] <= #TCQ 1'b0;
          calib_odt[1] <= #TCQ 1'b0;
        end else if (((DRAM_TYPE == "DDR3") 
               ||((RTT_NOM != "DISABLED") && (DRAM_TYPE == "DDR2"))) 
               && (((init_state_r == INIT_WRLVL_WAIT) && wrlvl_odt ) || 
               (init_state_r == INIT_RDLVL_STG1_WRITE) ||
               (init_state_r == INIT_OCAL_COMPLEX_WRITE_WAIT) ||
               (init_state_r == INIT_RDLVL_STG1_WRITE_READ) ||
               complex_odt_ext ||
               (init_state_r == INIT_WRCAL_WRITE) ||
               (init_state_r == INIT_WRCAL_WRITE_READ) ||
               (init_state_r == INIT_OCAL_CENTER_WRITE) || 
               complex_ocal_odt_ext ||
               (init_state_r == INIT_OCLKDELAY_WRITE)||
	       (init_state_r == INIT_OCLKDELAY_WRITE_WAIT))) begin
          
          calib_odt[0] <= #TCQ phy_tmp_odt_r[0];
          calib_odt[1] <= #TCQ phy_tmp_odt_r[1];
        end else begin
          calib_odt[0] <= #TCQ 1'b0;
          calib_odt[1] <= #TCQ 1'b0;
        end
      end