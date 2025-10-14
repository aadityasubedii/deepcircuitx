         end else if(C_PORT_CONFIG[183:160] == "B32" && C_PORT_CONFIG[119:96] == "R32") begin : u_config1_2R

                  if (C_PORT_ENABLE[2] == 1'b1)
                  begin
                       assign mig_p2_clk        = p2_rd_clk;
                       assign p2_rd_data        = mig_p2_rd_data;
                       assign mig_p2_en         = p2_rd_en;  
                       assign p2_rd_overflow    = mig_p2_overflow;
                       assign p2_rd_error       = mig_p2_error;
                       assign p2_rd_full        = mig_p2_full;
                       assign p2_rd_empty       = mig_p2_empty;
                       assign p2_rd_count       = mig_p2_count  ; 
                       
                  end else       
                  begin
                       assign mig_p2_clk        = 'b0;
                       assign p2_rd_data        = 'b0;
                       assign mig_p2_en         = 'b0;
                       
                       assign p2_rd_overflow    = 'b0;
                       assign p2_rd_error       = 'b0;
                       assign p2_rd_full        = 'b0;
                       assign p2_rd_empty       = 'b0;
                       assign p2_rd_count       = 'b0;
                       