               begin
              
                assign mig_p1_wr_clk   = p1_wr_clk;
                assign mig_p1_rd_clk   = p1_rd_clk;                
                assign mig_p1_wr_en    = p1_wr_en;
                assign mig_p1_wr_mask  = p1_wr_mask[3:0];                
                assign mig_p1_wr_data  = p1_wr_data[31:0];
                assign mig_p1_rd_en    = p1_rd_en;
                assign p1_rd_data     = mig_p1_rd_data;
                assign p1_rd_empty    = mig_p1_rd_empty;
                assign p1_rd_full     = mig_p1_rd_full;
                assign p1_rd_error    = mig_p1_rd_error;
                assign p1_wr_error    = mig_p1_wr_error;
                assign p1_rd_overflow = mig_p1_rd_overflow;
                assign p1_wr_underrun    = mig_p1_wr_underrun;
                assign p1_wr_empty    = mig_p1_wr_empty;
                assign p1_wr_full    = mig_p1_wr_full;
                assign p1_wr_count  = mig_p1_wr_count;
                assign p1_rd_count  = mig_p1_rd_count  ; 
                
               end else
               begin
              