    always @(posedge clk)
      if (rst)
        calib_aux_out <= #TCQ 4'b0000;
      else begin
        if (cnt_pwron_cke_done_r && ~cnt_pwron_cke_done_r1)begin
          calib_aux_out[0] <= #TCQ 1'b1;
          calib_aux_out[2] <= #TCQ 1'b1;
        end else begin
          calib_aux_out[0] <= #TCQ 1'b0;
          calib_aux_out[2] <= #TCQ 1'b0;
        end
        if ((((RTT_NOM == "DISABLED") && (RTT_WR == "OFF")) ||
         wrlvl_rank_done_r2 ||
        (wrlvl_done && !wrlvl_done_r)) && (DRAM_TYPE == "DDR3")) begin
          calib_aux_out[1] <= #TCQ 1'b0;
          calib_aux_out[3] <= #TCQ 1'b0;
        end else if (((DRAM_TYPE == "DDR3") 
               ||((RTT_NOM != "DISABLED") && (DRAM_TYPE == "DDR2"))) 
               && (((init_state_r == INIT_WRLVL_WAIT) && wrlvl_odt) || 
               (init_state_r == INIT_RDLVL_STG1_WRITE) ||
               (init_state_r == INIT_OCAL_COMPLEX_WRITE_WAIT) ||
               (init_state_r == INIT_WRCAL_WRITE) ||
               (init_state_r == INIT_OCAL_CENTER_WRITE) || 
               (init_state_r == INIT_OCLKDELAY_WRITE))) begin 
           
            if (nCK_PER_CLK == 2) begin
              calib_aux_out[1] 
                <= #TCQ (!calib_aux_out[1]) ? phy_tmp_odt_r[0] : 1'b0;
              calib_aux_out[3] 
                <= #TCQ (!calib_aux_out[3]) ? phy_tmp_odt_r[1] : 1'b0;
            end else begin 
              calib_aux_out[1] <= #TCQ phy_tmp_odt_r[0];
              calib_aux_out[3] <= #TCQ phy_tmp_odt_r[1];
            end
        end else begin
          calib_aux_out[1] <= #TCQ 1'b0;
          calib_aux_out[3] <= #TCQ 1'b0;
        end
      end
  end
end 