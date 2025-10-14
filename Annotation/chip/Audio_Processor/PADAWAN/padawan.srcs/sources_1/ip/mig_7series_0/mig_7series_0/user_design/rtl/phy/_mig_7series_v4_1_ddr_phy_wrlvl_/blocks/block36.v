   always @(posedge clk) begin
     phy_ctl_ready_r1  <= #TCQ phy_ctl_ready;
     phy_ctl_ready_r2  <= #TCQ phy_ctl_ready_r1;
     phy_ctl_ready_r3  <= #TCQ phy_ctl_ready_r2;
     phy_ctl_ready_r4  <= #TCQ phy_ctl_ready_r3;
     phy_ctl_ready_r5  <= #TCQ phy_ctl_ready_r4;
     phy_ctl_ready_r6  <= #TCQ phy_ctl_ready_r5;
     wrlvl_byte_redo_r <= #TCQ wrlvl_byte_redo;
     wrlvl_final_r     <= #TCQ wrlvl_final;
     if ((wrlvl_byte_redo && ~wrlvl_byte_redo_r) ||
         (wrlvl_final && ~wrlvl_final_r))
       wr_level_done  <= #TCQ 1'b0;
     else
       wr_level_done  <= #TCQ done_dqs_dec;
   end