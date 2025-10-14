       always @(posedge clk) begin
         if (rst) begin
           
           add_smallest[cnt]         <= #TCQ 'd0;
           add_largest[cnt]          <= #TCQ 'd0;
           final_coarse_tap[cnt]     <= #TCQ 'd0;
         end else if (wr_level_done_r1 & ~wr_level_done_r2) begin
           if (~oclkdelay_calib_done) begin
	    for(y = 0 ; y < DQS_WIDTH; y = y+1) begin
              final_coarse_tap[y] <= #TCQ wl_corse_cnt[0][y]; 
              add_smallest[y]     <= #TCQ 'd0;
              add_largest[y]      <= #TCQ 'd0;
	     end
           end else 
	   if (wl_corse_cnt[0][cnt] == wl_corse_cnt[1][cnt]) begin
           
           
             
             final_coarse_tap[cnt]     <= #TCQ wl_corse_cnt[1][cnt];
             add_smallest[cnt]         <= #TCQ 'd0;
             add_largest[cnt]          <= #TCQ 'd0;
           end else if (wl_corse_cnt[0][cnt] < wl_corse_cnt[1][cnt]) begin
           
           
           
             
             final_coarse_tap[cnt]     <= #TCQ wl_corse_cnt[1][cnt] - 1;
             if (|wl_corse_cnt[0][cnt])
               
               
               
               add_largest[cnt] <= #TCQ 'd38;
             else
               
               
               
               add_largest[cnt] <= #TCQ 'd34;
           end else if (wl_corse_cnt[0][cnt] > wl_corse_cnt[1][cnt]) begin
           
           
           
             
             final_coarse_tap[cnt]   <= #TCQ wl_corse_cnt[1][cnt];
             if (|wl_corse_cnt[1][cnt])
               
               
               
               add_smallest[cnt] <= #TCQ 'd38;
             else
               
               
               
               add_smallest[cnt] <= #TCQ 'd34;
           end
         end
       end