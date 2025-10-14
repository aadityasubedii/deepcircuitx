                        assign mig_p0_rd_clk   = p0_rd_clk;
                        assign mig_p1_wr_clk   = p0_wr_clk;
                        assign mig_p1_rd_clk   = p0_rd_clk;
                        
                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p0_wr_en    = p0_wr_en ;
                        else
                           assign mig_p0_wr_en    = p0_wr_en & !p0_wr_full;

                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p1_wr_en    = p0_wr_en ;
                        else
                           assign mig_p1_wr_en    = p0_wr_en & !p0_wr_full;
                        
                        
                        assign mig_p0_wr_data  = p0_wr_data[31:0];
                        assign mig_p0_wr_mask  = p0_wr_mask[3:0];
                        assign mig_p1_wr_data  = p0_wr_data[63 : 32];
                        assign mig_p1_wr_mask  = p0_wr_mask[7 : 4];    


                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p0_rd_en    = p0_rd_en ;
                        else
                           assign mig_p0_rd_en    = p0_rd_en & !p0_rd_empty;

                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p1_rd_en    = p0_rd_en ;
                        else
                           assign mig_p1_rd_en    = p0_rd_en & !p0_rd_empty;
                        
                        assign p0_rd_data     = {mig_p1_rd_data , mig_p0_rd_data};
                        