   always @(posedge clk) begin
     dqs_po_dec_done  <= #TCQ po_dec_done;
     wr_level_done_r1 <= #TCQ wr_level_done_r;
     wr_level_done_r2 <= #TCQ wr_level_done_r1;
     wr_level_done_r3 <= #TCQ wr_level_done_r2;
     wr_level_done_r4 <= #TCQ wr_level_done_r3;
     wr_level_done_r5 <= #TCQ wr_level_done_r4;
     for (l = 0; l < DQS_WIDTH; l = l + 1) begin 
       wl_po_coarse_cnt[3*l+:3] <= #TCQ final_coarse_tap[l];
       if ((RANKS == 1) || ~oclkdelay_calib_done)
         wl_po_fine_cnt[6*l+:6] <= #TCQ smallest[l];
       else 
         wl_po_fine_cnt[6*l+:6] <= #TCQ final_val[l];
     end
   end