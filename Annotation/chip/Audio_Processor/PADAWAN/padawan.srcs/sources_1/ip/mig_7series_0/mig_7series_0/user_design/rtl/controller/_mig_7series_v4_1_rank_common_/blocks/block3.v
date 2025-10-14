               
      assign periodic_rd_r = periodic_rd_r_lcl;
      assign periodic_rd_rank_r = periodic_rd_rank_r_lcl;
      
    end else begin
    
      
      assign clear_periodic_rd_request = {RANKS{1'b0}};
      assign periodic_rd_r = 1'b0;
      assign periodic_rd_rank_r = {RANK_WIDTH{1'b0}};
    