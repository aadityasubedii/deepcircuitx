                           assign mig_p5_en       = p3_wr_en; 
                           assign mig_p5_wr_data  = p3_wr_data[31:0];
                           assign mig_p5_wr_mask  = p3_wr_mask[3:0];
                           assign p3_rd_count     = mig_p4_count;
                           assign p3_wr_count     = mig_p5_count;
                           
                           
                  end else
                  begin
                           assign mig_p4_arb_en      =     'b0;
                           assign mig_p4_cmd_clk     =     'b0;
                           assign mig_p4_cmd_en      =     'b0;
                           assign mig_p4_cmd_ra      =     'b0;
                           assign mig_p4_cmd_ba      =     'b0;
                           assign mig_p4_cmd_ca      =     'b0;
                           assign mig_p4_cmd_instr   =     'b0;
                           assign mig_p4_cmd_bl      =     'b0;
                           
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