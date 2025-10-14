
end else if(C_PORT_CONFIG == "B64_B64" ) begin : u_config_4

               

                 if (C_PORT_ENABLE[0] == 1'b1)
                  begin
               
                       assign mig_p0_arb_en      =      p0_arb_en ;
                       assign mig_p1_arb_en      =      p0_arb_en ;
                       
                       assign mig_p0_cmd_clk     =      p0_cmd_clk  ;
                       assign mig_p0_cmd_en      =      p0_cmd_en   ;
                       assign mig_p0_cmd_ra      =      p0_cmd_ra  ;
                       assign mig_p0_cmd_ba      =      p0_cmd_ba   ;
                       assign mig_p0_cmd_ca      =      p0_cmd_ca  ;
                       assign mig_p0_cmd_instr   =      p0_cmd_instr;
                       assign mig_p0_cmd_bl      =       {(p0_cmd_instr[2] | p0_cmd_bl[5]),p0_cmd_bl[4:0]}   ;


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


                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p0_rd_en    = p0_rd_en ;
                        else
                           assign mig_p0_rd_en    = p0_rd_en & !p0_rd_empty;

                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p1_rd_en    = p0_rd_en ;
                        else
                           assign mig_p1_rd_en    = p0_rd_en & !p0_rd_empty;
                        
                        assign p0_rd_data     = {mig_p1_rd_data , mig_p0_rd_data};
                        
                        assign p0_cmd_empty   =     mig_p0_cmd_empty ;
                        assign p0_cmd_full    =     mig_p0_cmd_full  ;
                        assign p0_wr_empty    = mig_p1_wr_empty;      
                        assign p0_wr_full    = mig_p1_wr_full;
                        assign p0_wr_error    = mig_p1_wr_error | mig_p0_wr_error; 
                        assign p0_wr_count    = mig_p1_wr_count;
                        assign p0_rd_count    = mig_p1_rd_count;
                        assign p0_wr_underrun = mig_p1_wr_underrun | mig_p0_wr_underrun; 
                        assign p0_rd_overflow = mig_p1_rd_overflow | mig_p0_rd_overflow; 
                        assign p0_rd_error    = mig_p1_rd_error | mig_p0_rd_error; 
                        assign p0_rd_full     = mig_p1_rd_full;
                        assign p0_rd_empty    = mig_p1_rd_empty;
                       
                       
                 end else
                 begin
                       assign mig_p0_arb_en      =      'b0;
                       assign mig_p0_cmd_clk     =      'b0;
                       assign mig_p0_cmd_en      =      'b0;
                       assign mig_p0_cmd_ra      =      'b0;
                       assign mig_p0_cmd_ba      =      'b0;
                       assign mig_p0_cmd_ca      =      'b0;
                       assign mig_p0_cmd_instr   =      'b0;
                       assign mig_p0_cmd_bl      =      'b0;

                        assign mig_p0_wr_clk   = 'b0;
                        assign mig_p0_rd_clk   = 'b0;
                        assign mig_p1_wr_clk   = 'b0;
                        assign mig_p1_rd_clk   = 'b0;
                        assign mig_p0_wr_en    = 'b0;
                        assign mig_p1_wr_en    = 'b0;
                        assign mig_p0_wr_data  = 'b0;
                        assign mig_p0_wr_mask  = 'b0;
                        assign mig_p1_wr_data  = 'b0;
                        assign mig_p1_wr_mask  = 'b0;            
                   
                        assign mig_p0_rd_en    = 'b0;
                        assign mig_p1_rd_en    = 'b0;
                        assign p0_rd_data     = 'b0;


                        assign p0_cmd_empty   = 'b0;
                        assign p0_cmd_full    = 'b0;
                        assign p0_wr_empty    = 'b0;
                        assign p0_wr_full     = 'b0;
                        assign p0_wr_error    = 'b0;
                        assign p0_wr_count    = 'b0;
                        assign p0_rd_count    = 'b0;
                        assign p0_wr_underrun = 'b0;  
                        assign p0_rd_overflow = 'b0;
                        assign p0_rd_error    = 'b0;
                        assign p0_rd_full     = 'b0;
                        assign p0_rd_empty    = 'b0;
                 
                 
                 end

      

                 if (C_PORT_ENABLE[1] == 1'b1)
                 begin

                       assign mig_p2_arb_en      =      p1_arb_en ;
                       
                       assign mig_p2_cmd_clk     =      p1_cmd_clk  ;
                       assign mig_p2_cmd_en      =      p1_cmd_en   ;
                       assign mig_p2_cmd_ra      =      p1_cmd_ra  ;
                       assign mig_p2_cmd_ba      =      p1_cmd_ba   ;
                       assign mig_p2_cmd_ca      =      p1_cmd_ca  ;
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
                        assign mig_p3_wr_mask  = p1_wr_mask[3:0];
                        assign mig_p5_wr_data  = p1_wr_data[63 : 32];
                        assign mig_p5_wr_mask  = p1_wr_mask[7 : 4];                       

                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p2_en    = p1_rd_en ;
                        else
                           assign mig_p2_en    = p1_rd_en & !p1_rd_empty;

                        if (C_USR_INTERFACE_MODE == "AXI")
                           assign mig_p4_en    = p1_rd_en ;
                        else
                           assign mig_p4_en    = p1_rd_en & !p1_rd_empty;


                        assign p1_cmd_empty       =      mig_p2_cmd_empty ;  
                        assign p1_cmd_full        =      mig_p2_cmd_full  ;

                        assign p1_wr_count    = mig_p5_count;
                        assign p1_rd_count    = mig_p4_count;
                        assign p1_wr_full    = mig_p5_full;
                        assign p1_wr_error    = mig_p5_error | mig_p5_error;
                        assign p1_wr_empty    = mig_p5_empty;
                        assign p1_wr_underrun = mig_p3_underrun | mig_p5_underrun;
                        assign p1_rd_overflow = mig_p4_overflow;
                        assign p1_rd_error    = mig_p4_error;
                        assign p1_rd_full     = mig_p4_full;
                        assign p1_rd_empty    = mig_p4_empty;

                        assign p1_rd_data     = {mig_p4_rd_data , mig_p2_rd_data};
                       
                       
                 end else
                 begin
                       assign mig_p2_arb_en      = 'b0;
                   
                  
                  
                       
                       assign mig_p2_cmd_clk     = 'b0;
                       assign mig_p2_cmd_en      = 'b0;
                       assign mig_p2_cmd_ra      = 'b0;
                       assign mig_p2_cmd_ba      = 'b0;
                       assign mig_p2_cmd_ca      = 'b0;
                       assign mig_p2_cmd_instr   = 'b0;
                       assign mig_p2_cmd_bl      = 'b0;
                       assign mig_p2_clk      = 'b0;
                       assign mig_p3_clk      = 'b0;
                       assign mig_p4_clk      = 'b0;
                       assign mig_p5_clk      = 'b0;
                       assign mig_p3_en       = 'b0;
                       assign mig_p5_en       = 'b0;
                       assign mig_p3_wr_data  = 'b0;
                       assign mig_p3_wr_mask  = 'b0;
                       assign mig_p5_wr_data  = 'b0;
                       assign mig_p5_wr_mask  = 'b0; 
                       assign mig_p2_en    = 'b0;
                       assign mig_p4_en    = 'b0;
                       assign p1_cmd_empty    = 'b0;  
                       assign p1_cmd_full     = 'b0;  

                       assign p1_wr_count    = 'b0;
                       assign p1_rd_count    = 'b0;
                       assign p1_wr_full     = 'b0;
                       assign p1_wr_error    = 'b0;
                       assign p1_wr_empty    = 'b0;
                       assign p1_wr_underrun = 'b0;
                       assign p1_rd_overflow = 'b0;
                       assign p1_rd_error    = 'b0; 
                       assign p1_rd_full     = 'b0; 
                       assign p1_rd_empty    = 'b0; 
                       assign p1_rd_data     = 'b0;
                       
                 end               
                
                  
                       assign mig_p3_arb_en      =      1'b0;
                       assign mig_p4_arb_en      =      1'b0;
                       assign mig_p5_arb_en      =      1'b0;
                       
                       assign mig_p3_cmd_clk     =      1'b0;
                       assign mig_p3_cmd_en      =      1'b0;
                       assign mig_p3_cmd_ra      =      15'd0;
                       assign mig_p3_cmd_ba      =      3'd0;
                       assign mig_p3_cmd_ca      =      12'd0;
                       assign mig_p3_cmd_instr   =      3'd0;

                       assign mig_p4_cmd_clk     =      1'b0;
                       assign mig_p4_cmd_en      =      1'b0;
                       assign mig_p4_cmd_ra      =      15'd0;
                       assign mig_p4_cmd_ba      =      3'd0;
                       assign mig_p4_cmd_ca      =      12'd0;
                       assign mig_p4_cmd_instr   =      3'd0;
                       assign mig_p4_cmd_bl      =      6'd0;

                       assign mig_p5_cmd_clk     =      1'b0;
                       assign mig_p5_cmd_en      =      1'b0;
                       assign mig_p5_cmd_ra      =      15'd0;
                       assign mig_p5_cmd_ba      =      3'd0;
                       assign mig_p5_cmd_ca      =      12'd0;                       
                       assign mig_p5_cmd_instr   =      3'd0;
                       assign mig_p5_cmd_bl      =      6'd0;

                
                

  end else if(C_PORT_CONFIG == "B128" ) begin : u_config_5


               
               
               assign mig_p0_arb_en      =  p0_arb_en ;
               assign mig_p0_cmd_clk     =  p0_cmd_clk  ;
               assign mig_p0_cmd_en      =  p0_cmd_en   ;
               assign mig_p0_cmd_ra      =  p0_cmd_ra  ;
               assign mig_p0_cmd_ba      =  p0_cmd_ba   ;
               assign mig_p0_cmd_ca      =  p0_cmd_ca  ;
               assign mig_p0_cmd_instr   =  p0_cmd_instr;
               assign mig_p0_cmd_bl      =   {(p0_cmd_instr[2] | p0_cmd_bl[5]),p0_cmd_bl[4:0]}   ;
               
               assign p0_cmd_empty       =      mig_p0_cmd_empty ;
               assign p0_cmd_full        =      mig_p0_cmd_full  ;
               
 
 
                
                
                assign mig_p0_wr_clk   = p0_wr_clk;
                assign mig_p0_rd_clk   = p0_rd_clk;
                assign mig_p1_wr_clk   = p0_wr_clk;
                assign mig_p1_rd_clk   = p0_rd_clk;
                
                assign mig_p2_clk   = p0_rd_clk;
                assign mig_p3_clk   = p0_wr_clk;
                assign mig_p4_clk   = p0_rd_clk;
                assign mig_p5_clk   = p0_wr_clk;
                
                
                if (C_USR_INTERFACE_MODE == "AXI") begin
                
                   assign mig_p0_wr_en    = p0_wr_en ;
                   assign mig_p1_wr_en    = p0_wr_en ;
                   assign mig_p3_en       = p0_wr_en ;
                   assign mig_p5_en       = p0_wr_en ;
                   end
                else begin
                        
                   assign mig_p0_wr_en    = p0_wr_en & !p0_wr_full;
                   assign mig_p1_wr_en    = p0_wr_en & !p0_wr_full;
                   assign mig_p3_en       = p0_wr_en & !p0_wr_full;
                   assign mig_p5_en       = p0_wr_en & !p0_wr_full;
                end        

                
                
                
                assign mig_p0_wr_data = p0_wr_data[31:0];
                assign mig_p0_wr_mask = p0_wr_mask[3:0];
                assign mig_p1_wr_data = p0_wr_data[63 : 32];
                assign mig_p1_wr_mask = p0_wr_mask[7 : 4];                
                assign mig_p3_wr_data = p0_wr_data[95 : 64];
                assign mig_p3_wr_mask = p0_wr_mask[11 : 8];
                assign mig_p5_wr_data = p0_wr_data[127 : 96];
                assign mig_p5_wr_mask = p0_wr_mask[15 : 12];
                
                if (C_USR_INTERFACE_MODE == "AXI") begin
                    assign mig_p0_rd_en    = p0_rd_en;
                    assign mig_p1_rd_en    = p0_rd_en;
                    assign mig_p2_en       = p0_rd_en;
                    assign mig_p4_en       = p0_rd_en;
                    end
                else begin
                    assign mig_p0_rd_en    = p0_rd_en & !p0_rd_empty;
                    assign mig_p1_rd_en    = p0_rd_en & !p0_rd_empty;
                    assign mig_p2_en       = p0_rd_en & !p0_rd_empty;
                    assign mig_p4_en       = p0_rd_en & !p0_rd_empty;
                end
                
                
                assign p0_rd_data     = {mig_p4_rd_data , mig_p2_rd_data , mig_p1_rd_data , mig_p0_rd_data};
                assign p0_rd_empty    = mig_p4_empty;
                assign p0_rd_full     = mig_p4_full;
                assign p0_rd_error    = mig_p0_rd_error | mig_p1_rd_error | mig_p2_error | mig_p4_error;  
                assign p0_rd_overflow    = mig_p0_rd_overflow | mig_p1_rd_overflow | mig_p2_overflow | mig_p4_overflow; 

                assign p0_wr_underrun    = mig_p0_wr_underrun | mig_p1_wr_underrun | mig_p3_underrun | mig_p5_underrun;      
                assign p0_wr_empty    = mig_p5_empty;
                assign p0_wr_full     = mig_p5_full;
                assign p0_wr_error    = mig_p0_wr_error | mig_p1_wr_error | mig_p3_error | mig_p5_error; 
                
                assign p0_wr_count    = mig_p5_count;
                assign p0_rd_count    = mig_p4_count;


               
               
               assign mig_p1_arb_en      =      1'b0;
               assign mig_p1_cmd_clk     =      1'b0;
               assign mig_p1_cmd_en      =      1'b0;
               assign mig_p1_cmd_ra      =      15'd0;
               assign mig_p1_cmd_ba      =      3'd0;
               assign mig_p1_cmd_ca      =      12'd0;
               
               assign mig_p1_cmd_instr   =      3'd0;
               assign mig_p1_cmd_bl      =      6'd0;
               
               assign mig_p2_arb_en    =      1'b0;
               assign mig_p2_cmd_clk     =      1'b0;
               assign mig_p2_cmd_en      =      1'b0;
               assign mig_p2_cmd_ra      =      15'd0;
               assign mig_p2_cmd_ba      =      3'd0;
               assign mig_p2_cmd_ca      =      12'd0;
               
               assign mig_p2_cmd_instr   =      3'd0;
               assign mig_p2_cmd_bl      =      6'd0;
               
               assign mig_p3_arb_en    =      1'b0;
               assign mig_p3_cmd_clk     =      1'b0;
               assign mig_p3_cmd_en      =      1'b0;
               assign mig_p3_cmd_ra      =      15'd0;
               assign mig_p3_cmd_ba      =      3'd0;
               assign mig_p3_cmd_ca      =      12'd0;
               
               assign mig_p3_cmd_instr   =      3'd0;
               assign mig_p3_cmd_bl      =      6'd0;
               
               assign mig_p4_arb_en    =      1'b0;
               assign mig_p4_cmd_clk     =      1'b0;
               assign mig_p4_cmd_en      =      1'b0;
               assign mig_p4_cmd_ra      =      15'd0;
               assign mig_p4_cmd_ba      =      3'd0;
               assign mig_p4_cmd_ca      =      12'd0;
               
               assign mig_p4_cmd_instr   =      3'd0;
               assign mig_p4_cmd_bl      =      6'd0;
               
               assign mig_p5_arb_en    =      1'b0;
               assign mig_p5_cmd_clk     =      1'b0;
               assign mig_p5_cmd_en      =      1'b0;
               assign mig_p5_cmd_ra      =      15'd0;
               assign mig_p5_cmd_ba      =      3'd0;
               assign mig_p5_cmd_ca      =      12'd0;
               
               assign mig_p5_cmd_instr   =      3'd0;
               assign mig_p5_cmd_bl      =      6'd0;
                             

                                
end
endgenerate