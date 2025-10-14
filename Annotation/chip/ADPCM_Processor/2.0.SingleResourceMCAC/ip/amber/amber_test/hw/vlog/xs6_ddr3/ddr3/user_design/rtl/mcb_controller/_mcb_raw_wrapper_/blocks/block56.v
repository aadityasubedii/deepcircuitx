                           assign p2_cmd_empty       =      mig_p2_cmd_empty ;
                           assign p2_cmd_full        =      mig_p2_cmd_full  ;
  
                 if (C_PORT_ENABLE[3] == 1'b1)
                  begin   
                           assign mig_p4_arb_en      =      p3_arb_en ;
                           assign mig_p4_cmd_clk     =      p3_cmd_clk  ;
                           assign mig_p4_cmd_en      =      p3_cmd_en   ;
                           assign mig_p4_cmd_ra      =      p3_cmd_ra  ;
                           assign mig_p4_cmd_ba      =      p3_cmd_ba   ;
                           assign mig_p4_cmd_ca      =      p3_cmd_ca  ;
                           assign mig_p4_cmd_instr   =      p3_cmd_instr;
                           assign mig_p4_cmd_bl      =      {(p3_cmd_instr[2] | p3_cmd_bl[5]),p3_cmd_bl[4:0]}  ;

                           assign mig_p4_clk      = p3_rd_clk;
                           assign mig_p4_en       = p3_rd_en;                            
                           assign mig_p5_clk      = p3_wr_clk;
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