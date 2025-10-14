                            assign mig_p2_en       = p2_rd_en;
                            assign mig_p2_clk      = p2_rd_clk;
                            assign mig_p3_en       = p2_wr_en;
                            assign mig_p3_clk      = p2_wr_clk;
                            assign mig_p3_wr_data  = p2_wr_data[31:0];
                            assign mig_p3_wr_mask  = p2_wr_mask[3:0];
                            assign p2_wr_count     = mig_p3_count;
                            assign p2_rd_count     = mig_p2_count;
                           
                  end else
                  begin

                           assign mig_p2_arb_en      =      'b0;
                           assign mig_p2_cmd_clk     =      'b0;
                           assign mig_p2_cmd_en      =      'b0;
                           assign mig_p2_cmd_ra      =      'b0;
                           assign mig_p2_cmd_ba      =      'b0;
                           assign mig_p2_cmd_ca      =      'b0;
                           assign mig_p2_cmd_instr   =      'b0;
                           assign mig_p2_cmd_bl      =      'b0;

                            assign mig_p2_en       = 'b0; 
                            assign mig_p2_clk      = 'b0;
                            assign mig_p3_en       = 'b0;
                            assign mig_p3_clk      = 'b0;
                            assign mig_p3_wr_data  = 'b0; 
                            assign mig_p3_wr_mask  = 'b0;
                            assign p2_rd_count     = 'b0;
                            assign p2_wr_count     = 'b0;
                           
                 end                           