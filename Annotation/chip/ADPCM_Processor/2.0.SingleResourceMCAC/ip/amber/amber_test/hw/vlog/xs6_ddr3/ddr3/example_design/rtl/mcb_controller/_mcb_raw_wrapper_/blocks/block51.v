                           
                           assign p1_cmd_empty       =      mig_p1_cmd_empty ;
                           assign p1_cmd_full        =      mig_p1_cmd_full  ;
 
                  if (C_PORT_ENABLE[2] == 1'b1)
                  begin   
                           assign mig_p2_arb_en      =      p2_arb_en ;
                           assign mig_p2_cmd_clk     =      p2_cmd_clk  ;
                           assign mig_p2_cmd_en      =      p2_cmd_en   ;
                           assign mig_p2_cmd_ra      =      p2_cmd_ra  ;
                           assign mig_p2_cmd_ba      =      p2_cmd_ba   ;
                           assign mig_p2_cmd_ca      =      p2_cmd_ca  ;
                           assign mig_p2_cmd_instr   =      p2_cmd_instr;
                           assign mig_p2_cmd_bl      =      {(p2_cmd_instr[2] | p2_cmd_bl[5]),p2_cmd_bl[4:0]}   ;
                           
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
                           