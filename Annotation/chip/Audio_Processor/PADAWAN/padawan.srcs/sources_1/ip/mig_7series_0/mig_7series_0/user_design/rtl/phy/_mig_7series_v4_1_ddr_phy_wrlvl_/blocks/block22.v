     always @(posedge clk) begin
       
       for(w = 0; w < DQS_WIDTH; w = w + 1) begin
         final_coarse_tap[w] <= #TCQ wl_corse_cnt[0][w];
         add_smallest[w]     <= #TCQ 'd0;
         add_largest[w]      <= #TCQ 'd0;
       end
     end