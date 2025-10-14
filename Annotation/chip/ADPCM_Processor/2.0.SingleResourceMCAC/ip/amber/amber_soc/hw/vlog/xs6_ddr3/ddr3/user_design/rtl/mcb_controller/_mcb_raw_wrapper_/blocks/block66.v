               if (C_PORT_ENABLE[0] == 1'b1)
               begin
                assign mig_p0_wr_clk   = p0_wr_clk;
                assign mig_p0_rd_clk   = p0_rd_clk;
                assign mig_p0_wr_en    = p0_wr_en;
                assign mig_p0_rd_en    = p0_rd_en;
                assign mig_p0_wr_mask  = p0_wr_mask[3:0];
                assign mig_p0_wr_data  = p0_wr_data[31:0];
                assign p0_rd_data        = mig_p0_rd_data;
                assign p0_rd_full        = mig_p0_rd_full;
                assign p0_rd_empty       = mig_p0_rd_empty;
                assign p0_rd_error       = mig_p0_rd_error;
                assign p0_wr_error       = mig_p0_wr_error;
                assign p0_rd_overflow    = mig_p0_rd_overflow;
                assign p0_wr_underrun    = mig_p0_wr_underrun;
                assign p0_wr_empty       = mig_p0_wr_empty;
                assign p0_wr_full        = mig_p0_wr_full;
                assign p0_wr_count       = mig_p0_wr_count;
                assign p0_rd_count       = mig_p0_rd_count  ; 
                
                
               end
               else
               begin
                assign mig_p0_wr_clk     = 'b0;
                assign mig_p0_rd_clk     = 'b0;
                assign mig_p0_wr_en      = 'b0;
                assign mig_p0_rd_en      = 'b0;
                assign mig_p0_wr_mask    = 'b0;
                assign mig_p0_wr_data    = 'b0;
                assign p0_rd_data        = 'b0;
                assign p0_rd_full        = 'b0;
                assign p0_rd_empty       = 'b0;
                assign p0_rd_error       = 'b0;
                assign p0_wr_error       = 'b0;
                assign p0_rd_overflow    = 'b0;
                assign p0_wr_underrun    = 'b0;
                assign p0_wr_empty       = 'b0;
                assign p0_wr_full        = 'b0;
                assign p0_wr_count       = 'b0;
                assign p0_rd_count       = 'b0;
                
                
               end