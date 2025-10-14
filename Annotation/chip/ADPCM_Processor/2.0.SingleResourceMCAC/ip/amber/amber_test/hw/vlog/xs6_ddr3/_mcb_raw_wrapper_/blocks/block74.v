         if(C_PORT_CONFIG[183:160] == "B32" && C_PORT_CONFIG[55:32]  == "W32") begin : u_config1_4W
       

                  if (C_PORT_ENABLE[4] == 1'b1)
                  begin
       
                       assign mig_p4_clk      = p4_wr_clk;
                       assign mig_p4_wr_data  = p4_wr_data[31:0];
                       assign mig_p4_wr_mask  = p4_wr_mask[3:0];
                       assign mig_p4_en       = p4_wr_en; 
                       assign p4_wr_full      = mig_p4_full;
                       assign p4_wr_empty     = mig_p4_empty;
                       assign p4_wr_underrun  = mig_p4_underrun;
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