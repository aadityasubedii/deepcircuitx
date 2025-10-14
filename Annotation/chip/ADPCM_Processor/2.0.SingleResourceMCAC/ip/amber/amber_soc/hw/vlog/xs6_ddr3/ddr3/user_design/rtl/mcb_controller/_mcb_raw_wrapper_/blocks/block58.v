         if(C_PORT_CONFIG[183:160] == "B32" && C_PORT_CONFIG[23:0] == "W32") begin : u_config1_5W
       

                       
                  if (C_PORT_ENABLE[5] == 1'b1)
                  begin
                       assign mig_p5_clk   = p5_wr_clk;
                       assign mig_p5_wr_data  = p5_wr_data[31:0];
                       assign mig_p5_wr_mask  = p5_wr_mask[3:0];
                       assign mig_p5_en       = p5_wr_en; 
                       assign p5_wr_full      = mig_p5_full;
                       assign p5_wr_empty     = mig_p5_empty;
                       assign p5_wr_underrun  = mig_p5_underrun;
                       assign p5_wr_count     = mig_p5_count  ; 
                       assign p5_wr_error     = mig_p5_error;
                       
                  end else
                  begin
                       assign mig_p5_clk      = 'b0;
                       assign mig_p5_wr_data  = 'b0;
                       assign mig_p5_wr_mask  = 'b0;
                       assign mig_p5_en       = 'b0;
                       assign p5_wr_full      = 'b0;
                       assign p5_wr_empty     = 'b0;
                       assign p5_wr_underrun  = 'b0;
                       assign p5_wr_count     = 'b0;
                       assign p5_wr_error     = 'b0;
                  end                           
                   assign p5_rd_data        = 'b0;
                   assign p5_rd_overflow    = 'b0;
                   assign p5_rd_error       = 'b0;
                   assign p5_rd_full        = 'b0;
                   assign p5_rd_empty       = 'b0;
                   assign p5_rd_count       = 'b0;
                  
       
                       
                         
         end else if(C_PORT_CONFIG[183:160] == "B32" && C_PORT_CONFIG[23:0] == "R32") begin : u_config1_5R

                  if (C_PORT_ENABLE[5] == 1'b1)
                  begin

                       assign mig_p5_clk        = p5_rd_clk;
                       assign p5_rd_data        = mig_p5_rd_data;                
                       assign mig_p5_en         = p5_rd_en;  
                       assign p5_rd_overflow    = mig_p5_overflow;
                       assign p5_rd_error       = mig_p5_error;