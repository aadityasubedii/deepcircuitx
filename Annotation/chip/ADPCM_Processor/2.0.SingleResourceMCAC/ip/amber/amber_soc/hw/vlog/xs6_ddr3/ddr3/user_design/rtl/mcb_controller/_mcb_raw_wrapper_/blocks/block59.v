                       assign mig_p4_clk        = p4_rd_clk;
                       assign p4_rd_data        = mig_p4_rd_data;                
                       assign mig_p4_en         = p4_rd_en;  
                       assign p4_rd_overflow    = mig_p4_overflow;
                       assign p4_rd_error       = mig_p4_error;
                       assign p4_rd_full        = mig_p4_full;
                       assign p4_rd_empty       = mig_p4_empty;
                       assign p4_rd_count       = mig_p4_count  ; 
                       
                  end else
                  begin
                       assign mig_p4_clk        = 'b0;
                       assign p4_rd_data        = 'b0;
                       assign mig_p4_en         = 'b0;
                       assign p4_rd_overflow    = 'b0;
                       assign p4_rd_error       = 'b0;
                       assign p4_rd_full        = 'b0;
                       assign p4_rd_empty       = 'b0;
                       assign p4_rd_count       = 'b0;
                  end                  
                  assign p4_wr_full      = 'b0;
                  assign p4_wr_empty     = 'b0;
                  assign p4_wr_underrun  = 'b0;
                  assign p4_wr_count     = 'b0;
                  assign p4_wr_error     = 'b0;
                  assign mig_p4_wr_data  = 'b0;
                  assign mig_p4_wr_mask  = 'b0;


                       
                       
         end 