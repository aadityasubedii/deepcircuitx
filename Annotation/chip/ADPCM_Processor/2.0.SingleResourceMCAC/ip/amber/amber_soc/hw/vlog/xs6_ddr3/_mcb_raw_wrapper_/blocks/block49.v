  end else if(C_PORT_CONFIG == "B64_B32_B32" ) begin : u_config_3

               
 
 
       if (C_PORT_ENABLE[0] == 1'b1)
       begin
               assign mig_p0_arb_en      =  p0_arb_en ;
               assign mig_p0_cmd_clk     =  p0_cmd_clk  ;
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
               assign mig_p0_wr_mask  = p0_wr_mask[3:0];
               assign mig_p1_wr_data  = p0_wr_data[63 : 32];
               assign mig_p1_wr_mask  = p0_wr_mask[7 : 4];     

               assign p0_rd_empty       = mig_p1_rd_empty;
               assign p0_rd_data        = {mig_p1_rd_data , mig_p0_rd_data}; 
               if (C_USR_INTERFACE_MODE == "AXI")
                   assign mig_p0_rd_en    = p0_rd_en ;
               else
                   assign mig_p0_rd_en    = p0_rd_en & !p0_rd_empty;

               if (C_USR_INTERFACE_MODE == "AXI")               
                   assign mig_p1_rd_en    = p0_rd_en ;
                else
                   assign mig_p1_rd_en    = p0_rd_en & !p0_rd_empty;

                assign p0_wr_count       = mig_p1_wr_count;  
                assign p0_rd_count       = mig_p1_rd_count;
                assign p0_wr_empty       = mig_p1_wr_empty;
                assign p0_wr_error       = mig_p1_wr_error | mig_p0_wr_error;  
                assign p0_wr_full        = mig_p1_wr_full;
                assign p0_wr_underrun    = mig_p1_wr_underrun | mig_p0_wr_underrun; 