                            assign p1_rd_error    = mig_p1_rd_error;
                            assign p2_rd_error    = mig_p2_error;
                            assign p3_rd_error    = mig_p4_error;
                            
                            assign p0_rd_overflow = mig_p0_rd_overflow;
                            assign p1_rd_overflow = mig_p1_rd_overflow;
                            assign p2_rd_overflow = mig_p2_overflow;
                            assign p3_rd_overflow = mig_p4_overflow;

                            assign p0_wr_underrun = mig_p0_wr_underrun;
                            assign p1_wr_underrun = mig_p1_wr_underrun;
                            assign p2_wr_underrun = mig_p3_underrun;
                            assign p3_wr_underrun = mig_p5_underrun;
                            
                            assign p0_wr_empty    = mig_p0_wr_empty;
                            assign p1_wr_empty    = mig_p1_wr_empty;
                            assign p2_wr_empty    = mig_p3_empty; 
                            assign p3_wr_empty    = mig_p5_empty; 
 
                            assign p0_wr_full    = mig_p0_wr_full;
                            assign p1_wr_full    = mig_p1_wr_full;
                            assign p2_wr_full    = mig_p3_full;
                            assign p3_wr_full    = mig_p5_full;

                            assign p0_wr_error    = mig_p0_wr_error;
                            assign p1_wr_error    = mig_p1_wr_error;
                            assign p2_wr_error    = mig_p3_error;
                            assign p3_wr_error    = mig_p5_error;

     
                           assign p4_cmd_empty        =     1'b0;
                           assign p4_cmd_full         =     1'b0;
                           assign mig_p2_wr_mask  = 'b0;
                           assign mig_p4_wr_mask  = 'b0;
