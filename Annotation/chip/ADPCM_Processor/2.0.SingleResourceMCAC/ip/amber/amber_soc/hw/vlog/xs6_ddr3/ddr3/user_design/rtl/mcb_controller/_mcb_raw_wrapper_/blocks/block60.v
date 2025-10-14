                       assign p4_wr_count     = mig_p4_count  ; 
                       assign p4_wr_error     = mig_p4_error;

                  end else
                  begin
                       assign mig_p4_clk      = 'b0;
                       assign mig_p4_wr_data  = 'b0;
                       assign mig_p4_wr_mask  = 'b0;
                       assign mig_p4_en       = 'b0;
                       assign p4_wr_full      = 'b0;
                       assign p4_wr_empty     = 'b0;
                       assign p4_wr_underrun  = 'b0;
                       assign p4_wr_count     = 'b0;
                       assign p4_wr_error     = 'b0;
                  end                           
                   assign p4_rd_overflow    = 'b0;
                   assign p4_rd_error       = 'b0;
                   assign p4_rd_full        = 'b0;
                   assign p4_rd_empty       = 'b0;
                   assign p4_rd_count       = 'b0;
                   assign p4_rd_data        = 'b0;
       
         end else if(C_PORT_CONFIG[183:160] == "B32" && C_PORT_CONFIG[55:32]  == "R32") begin : u_config1_4R
                       
                  if (C_PORT_ENABLE[4] == 1'b1)
                  begin