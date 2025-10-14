      always @(posedge clk) periodic_rd_rank_r_lcl <=
                             #TCQ periodic_rd_rank_ns;




      assign clear_periodic_rd_request =
               periodic_rd_grant_r & {RANKS{periodic_rd_ack_r}};

               
      assign periodic_rd_r = periodic_rd_r_lcl;
      assign periodic_rd_rank_r = periodic_rd_rank_r_lcl;
      
    end else begin
    
      