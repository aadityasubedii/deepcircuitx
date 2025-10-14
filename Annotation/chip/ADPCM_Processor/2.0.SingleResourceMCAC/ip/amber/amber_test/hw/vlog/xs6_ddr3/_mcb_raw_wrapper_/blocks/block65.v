                            assign mig_p4_clk      = 'b0; 
                            assign mig_p4_en       = 'b0;                   
                            assign mig_p5_clk      = 'b0;
                            assign mig_p5_en       = 'b0;
                            assign mig_p5_wr_data  = 'b0; 
                            assign mig_p5_wr_mask  = 'b0;
                            assign p3_rd_count     = 'b0;
                            assign p3_wr_count     = 'b0;
                           
                          
                           
                  end         
                           
                           assign p3_cmd_empty       =      mig_p4_cmd_empty ;
                           assign p3_cmd_full        =      mig_p4_cmd_full  ;
                           
                           
                            
                            assign p0_rd_data     = mig_p0_rd_data;
                            assign p1_rd_data     = mig_p1_rd_data;
                            assign p2_rd_data     = mig_p2_rd_data;
                            assign p3_rd_data     = mig_p4_rd_data;

                            assign p0_rd_empty    = mig_p0_rd_empty;
                            assign p1_rd_empty    = mig_p1_rd_empty;
                            assign p2_rd_empty    = mig_p2_empty;
                            assign p3_rd_empty    = mig_p4_empty;

                            assign p0_rd_full     = mig_p0_rd_full;
                            assign p1_rd_full     = mig_p1_rd_full;
                            assign p2_rd_full     = mig_p2_full;
                            assign p3_rd_full     = mig_p4_full;
