                       assign p5_rd_overflow    = mig_p5_overflow;
                       assign p5_rd_error       = mig_p5_error;
                       assign p5_rd_full        = mig_p5_full;
                       assign p5_rd_empty       = mig_p5_empty;
                       assign p5_rd_count       = mig_p5_count  ; 
                       
                 end else
                 begin
                       assign mig_p5_clk        = 'b0;
                       assign p5_rd_data        = 'b0;           
                       assign mig_p5_en         = 'b0;
                       assign p5_rd_overflow    = 'b0;
                       assign p5_rd_error       = 'b0;
                       assign p5_rd_full        = 'b0;
                       assign p5_rd_empty       = 'b0;
                       assign p5_rd_count       = 'b0;
                 
                 end
                 assign p5_wr_full      = 'b0;
                 assign p5_wr_empty     = 'b0;
                 assign p5_wr_underrun  = 'b0;
                 assign p5_wr_count     = 'b0;
                 assign p5_wr_error     = 'b0;
                 assign mig_p5_wr_data  = 'b0;
                 assign mig_p5_wr_mask  = 'b0;
                       
         end
                
  end else if(C_PORT_CONFIG == "B32_B32_B32_B32" ) begin : u_config_2

           
               
               
               
                  if (C_PORT_ENABLE[0] == 1'b1)
                  begin
                           
                           assign mig_p0_arb_en      =      p0_arb_en ;
                           assign mig_p0_cmd_clk     =      p0_cmd_clk  ;
                           assign mig_p0_cmd_en      =      p0_cmd_en   ;
                           assign mig_p0_cmd_ra      =      p0_cmd_ra  ;
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