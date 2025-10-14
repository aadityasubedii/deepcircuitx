               assign mig_p0_cmd_en      =  p0_cmd_en   ;
               assign mig_p0_cmd_ra      =  p0_cmd_ra  ;
               assign mig_p0_cmd_ba      =  p0_cmd_ba   ;
               assign mig_p0_cmd_ca      =  p0_cmd_ca  ;
               assign mig_p0_cmd_instr   =  p0_cmd_instr;
               assign mig_p0_cmd_bl      =   {(p0_cmd_instr[2] | p0_cmd_bl[5]),p0_cmd_bl[4:0]}   ;
               assign p0_cmd_empty       =  mig_p0_cmd_empty ;
               assign p0_cmd_full        =  mig_p0_cmd_full  ;

               assign mig_p0_wr_clk   = p0_wr_clk;
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