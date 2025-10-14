                           assign mig_p0_cmd_ba      =      p0_cmd_ba   ;
                           assign mig_p0_cmd_ca      =      p0_cmd_ca  ;
                           assign mig_p0_cmd_instr   =      p0_cmd_instr;
                           assign mig_p0_cmd_bl      =       {(p0_cmd_instr[2] | p0_cmd_bl[5]),p0_cmd_bl[4:0]}   ;
                           
                           
                           assign mig_p0_rd_en    = p0_rd_en;                            
                           assign mig_p0_wr_clk   = p0_wr_clk;
                           assign mig_p0_rd_clk   = p0_rd_clk;
                           assign mig_p0_wr_en    = p0_wr_en;
                           assign mig_p0_wr_data  = p0_wr_data[31:0]; 
                           assign mig_p0_wr_mask  = p0_wr_mask[3:0];
                           assign p0_wr_count     = mig_p0_wr_count;
                           assign p0_rd_count  = mig_p0_rd_count  ; 

                           
                           
                 end else
                 begin
                           assign mig_p0_arb_en      =       'b0;
                           assign mig_p0_cmd_clk     =       'b0;
                           assign mig_p0_cmd_en      =       'b0;
                           assign mig_p0_cmd_ra      =       'b0;
                           assign mig_p0_cmd_ba      =       'b0;
                           assign mig_p0_cmd_ca      =       'b0;
                           assign mig_p0_cmd_instr   =       'b0;
                           assign mig_p0_cmd_bl      =       'b0;
                           
                           assign mig_p0_rd_en    = 'b0;                    
                           assign mig_p0_wr_clk   = 'b0;
                           assign mig_p0_rd_clk   = 'b0;
                           assign mig_p0_wr_en    = 'b0;
                           assign mig_p0_wr_data  = 'b0; 
                           assign mig_p0_wr_mask  = 'b0;
                           assign p0_wr_count     = 'b0;
                           assign p0_rd_count     = 'b0;