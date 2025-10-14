                       
         end else if(C_PORT_CONFIG[183:160] == "B32" && C_PORT_CONFIG[87:64]  == "R32") begin : u_config1_3R
       
                  if (C_PORT_ENABLE[3] == 1'b1)
                  begin

                       assign mig_p3_clk     = p3_rd_clk;
                       assign p3_rd_data     = mig_p3_rd_data;                
                       assign mig_p3_en      = p3_rd_en;  
                       assign p3_rd_overflow = mig_p3_overflow;
                       assign p3_rd_error    = mig_p3_error;
                       assign p3_rd_full     = mig_p3_full;
                       assign p3_rd_empty    = mig_p3_empty;
                       assign p3_rd_count    = mig_p3_count  ; 
                  end else
                  begin 
                       assign mig_p3_clk     = 'b0;
                       assign mig_p3_en      = 'b0;
                       assign p3_rd_overflow = 'b0;
                       assign p3_rd_full     = 'b0;
                       assign p3_rd_empty    = 'b0;
                       assign p3_rd_count    = 'b0;
                       assign p3_rd_error    = 'b0;
                       assign p3_rd_data     = 'b0;
                  end                  