  always @(posedge clk)
    if (rst || ~phy_ctl_ready) begin
      cnt_pwron_reset_done_r <= #TCQ 1'b0;
      cnt_pwron_cke_done_r   <= #TCQ 1'b0;
    end else begin
      
      if ((SIM_INIT_OPTION == "SKIP_PU_DLY") || 
          (SIM_INIT_OPTION == "SKIP_INIT")) begin
        cnt_pwron_reset_done_r <= #TCQ 1'b1;
        cnt_pwron_cke_done_r   <= #TCQ 1'b1;
      end else begin
        
        if (DRAM_TYPE == "DDR3") begin
           if (!cnt_pwron_reset_done_r)
             cnt_pwron_reset_done_r 
               <= #TCQ (cnt_pwron_r == PWRON_RESET_DELAY_CNT);
           if (!cnt_pwron_cke_done_r)
             cnt_pwron_cke_done_r   
               <= #TCQ (cnt_pwron_r == PWRON_CKE_DELAY_CNT);
           end else begin 
              cnt_pwron_reset_done_r <= #TCQ 1'b1; 
              if (!cnt_pwron_cke_done_r)
                 cnt_pwron_cke_done_r   
                   <= #TCQ (cnt_pwron_r == PWRON_CKE_DELAY_CNT);
           end        
      end
    end 