                          
                           
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

                            assign p0_rd_error    = mig_p0_rd_error;
                            assign p1_rd_error    = mig_p1_rd_error;
                            assign p2_rd_error    = mig_p2_error;
                            assign p3_rd_error    = mig_p4_error;
                            
                            assign p0_rd_overflow = mig_p0_rd_overflow;
                            assign p1_rd_overflow = mig_p1_rd_overflow;
                            assign p2_rd_overflow = mig_p2_overflow;
                            assign p3_rd_overflow = mig_p4_overflow;