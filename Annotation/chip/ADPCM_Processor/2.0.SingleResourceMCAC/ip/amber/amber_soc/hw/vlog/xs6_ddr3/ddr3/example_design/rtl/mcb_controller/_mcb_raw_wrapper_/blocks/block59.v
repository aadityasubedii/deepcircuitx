                       assign p4_rd_empty       = 'b0;
                       assign p4_rd_count       = 'b0;
                  end                  
                  assign p4_wr_full      = 'b0;
                  assign p4_wr_empty     = 'b0;
                  assign p4_wr_underrun  = 'b0;
                  assign p4_wr_count     = 'b0;
                  assign p4_wr_error     = 'b0;
                  assign mig_p4_wr_data  = 'b0;
                  assign mig_p4_wr_mask  = 'b0;


                       
                       
         end 
         
         if(C_PORT_CONFIG[183:160] == "B32" && C_PORT_CONFIG[23:0] == "W32") begin : u_config1_5W
       

                       
                  if (C_PORT_ENABLE[5] == 1'b1)
                  begin
                       assign mig_p5_clk   = p5_wr_clk;
                       assign mig_p5_wr_data  = p5_wr_data[31:0];
                       assign mig_p5_wr_mask  = p5_wr_mask[3:0];
                       assign mig_p5_en       = p5_wr_en; 