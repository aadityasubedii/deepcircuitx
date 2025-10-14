         if(C_PORT_CONFIG[183:160] == "B32" && C_PORT_CONFIG[119:96] == "W32") begin : u_config1_2W
                  if (C_PORT_ENABLE[2] == 1'b1)
                  begin
                       assign mig_p2_clk      = p2_wr_clk;
                       assign mig_p2_wr_data  = p2_wr_data[31:0];
                       assign mig_p2_wr_mask  = p2_wr_mask[3:0];
                       assign mig_p2_en       = p2_wr_en; 
                       assign p2_wr_error     = mig_p2_error;                       
                       assign p2_wr_full      = mig_p2_full;
                       assign p2_wr_empty     = mig_p2_empty;
                       assign p2_wr_underrun  = mig_p2_underrun;
                       assign p2_wr_count     = mig_p2_count  ; 
                       
                       
                  end else
                  begin
                       assign mig_p2_clk      = 'b0;
                       assign mig_p2_wr_data  = 'b0;
                       assign mig_p2_wr_mask  = 'b0;
                       assign mig_p2_en       = 'b0;
                       assign p2_wr_error     = 'b0;
                       assign p2_wr_full      = 'b0;
                       assign p2_wr_empty     = 'b0;
                       assign p2_wr_underrun  = 'b0;
                       assign p2_wr_count     = 'b0;
                                                
                  end                           