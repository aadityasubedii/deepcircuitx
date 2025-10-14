                            assign mig_p3_cmd_clk     =      1'b0;
                            assign mig_p3_cmd_en      =      1'b0;
                            assign mig_p3_cmd_ra      =      15'd0;
                            assign mig_p3_cmd_ba      =      3'd0;
                            assign mig_p3_cmd_ca      =      12'd0;
                            assign mig_p3_cmd_instr   =      3'd0;
                            assign mig_p3_cmd_bl      =      6'd0;
                            assign mig_p3_arb_en      =      1'b0;  
                            
                            
                            
                            
                            assign mig_p5_arb_en      =      1'b0;  
                            assign mig_p5_cmd_clk     =      1'b0;
                            assign mig_p5_cmd_en      =      1'b0;
                            assign mig_p5_cmd_ra      =      15'd0;
                            assign mig_p5_cmd_ba      =      3'd0;
                            assign mig_p5_cmd_ca      =      12'd0;
                            assign mig_p5_cmd_instr   =      3'd0;
                            assign mig_p5_cmd_bl      =      6'd0;



      
      
      
      
      
      
      

     
     
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