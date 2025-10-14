               assign mig_p0_wr_mask  = p0_wr_mask[3:0];
               assign mig_p1_wr_data  = p0_wr_data[63 : 32];
               assign mig_p1_wr_mask  = p0_wr_mask[7 : 4];     

               assign p0_rd_empty       = mig_p1_rd_empty;
               assign p0_rd_data        = {mig_p1_rd_data , mig_p0_rd_data}; 
               if (C_USR_INTERFACE_MODE == "AXI")
                   assign mig_p0_rd_en    = p0_rd_en ;
               else
                   assign mig_p0_rd_en    = p0_rd_en & !p0_rd_empty;

               if (C_USR_INTERFACE_MODE == "AXI")               
                   assign mig_p1_rd_en    = p0_rd_en ;
                else
                   assign mig_p1_rd_en    = p0_rd_en & !p0_rd_empty;

                assign p0_wr_count       = mig_p1_wr_count;  
                assign p0_rd_count       = mig_p1_rd_count;
                assign p0_wr_empty       = mig_p1_wr_empty;
                assign p0_wr_error       = mig_p1_wr_error | mig_p0_wr_error;  