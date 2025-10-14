                       assign p5_rd_full        = mig_p5_full;
                       assign p5_rd_empty       = mig_p5_empty;
                       assign p5_rd_count       = mig_p5_count  ; 
                       
                 end else
                 begin
                       assign mig_p5_clk        = 'b0;
                       assign p5_rd_data        = 'b0;           
                       assign mig_p5_en         = 'b0;
                       assign p5_rd_overflow    = 'b0;
                       assign p5_rd_error       = 'b0;
                       assign p5_rd_full        = 'b0;
                       assign p5_rd_empty       = 'b0;
                       assign p5_rd_count       = 'b0;
                 
                 end
                 assign p5_wr_full      = 'b0;
                 assign p5_wr_empty     = 'b0;
                 assign p5_wr_underrun  = 'b0;
                 assign p5_wr_count     = 'b0;
                 assign p5_wr_error     = 'b0;
                 assign mig_p5_wr_data  = 'b0;
                 assign mig_p5_wr_mask  = 'b0;
                       