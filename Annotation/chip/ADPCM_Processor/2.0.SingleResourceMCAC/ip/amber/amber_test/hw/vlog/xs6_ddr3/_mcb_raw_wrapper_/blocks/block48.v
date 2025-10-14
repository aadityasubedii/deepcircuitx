                        assign mig_p5_wr_data  = p1_wr_data[63 : 32];
                        assign mig_p5_wr_mask  = p1_wr_mask[7 : 4];                       

                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p2_en    = p1_rd_en ;
                        else
                           assign mig_p2_en    = p1_rd_en & !p1_rd_empty;

                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p4_en    = p1_rd_en ;
                        else
                           assign mig_p4_en    = p1_rd_en & !p1_rd_empty;


                        assign p1_cmd_empty       =      mig_p2_cmd_empty ;  
                        assign p1_cmd_full        =      mig_p2_cmd_full  ;

                        assign p1_wr_count    = mig_p5_count;
                        assign p1_rd_count    = mig_p4_count;
                        assign p1_wr_full    = mig_p5_full;
                        assign p1_wr_error    = mig_p5_error | mig_p5_error;
                        assign p1_wr_empty    = mig_p5_empty;
                        assign p1_wr_underrun = mig_p3_underrun | mig_p5_underrun;
                        assign p1_rd_overflow = mig_p4_overflow;
                        assign p1_rd_error    = mig_p4_error;
                        assign p1_rd_full     = mig_p4_full;