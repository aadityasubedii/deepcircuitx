                       assign mig_p2_cmd_instr   =      p1_cmd_instr;
                       assign mig_p2_cmd_bl      =      {(p1_cmd_instr[2] | p1_cmd_bl[5]),p1_cmd_bl[4:0]}  ;


                        assign mig_p2_clk     = p1_rd_clk;
                        assign mig_p3_clk     = p1_wr_clk;
                        assign mig_p4_clk     = p1_rd_clk;
                        assign mig_p5_clk     = p1_wr_clk;
                         
                        
                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p3_en    = p1_wr_en ;
                        else
                           assign mig_p3_en    = p1_wr_en & !p1_wr_full;

                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p5_en    = p1_wr_en ;
                        else
                           assign mig_p5_en    = p1_wr_en & !p1_wr_full;
                        


                        
                        
                        assign mig_p3_wr_data  = p1_wr_data[31:0];