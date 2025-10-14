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
                  assign p3_wr_full      = 'b0;
                  assign p3_wr_empty     = 'b0;
                  assign p3_wr_underrun  = 'b0;
                  assign p3_wr_count     = 'b0;
                  assign p3_wr_error     = 'b0;
                  assign mig_p3_wr_data  = 'b0;
                  assign mig_p3_wr_mask  = 'b0;
         end 
         if(C_PORT_CONFIG[183:160] == "B32" && C_PORT_CONFIG[55:32]  == "W32") begin : u_config1_4W
       

                  if (C_PORT_ENABLE[4] == 1'b1)
                  begin
       
                       assign mig_p4_clk      = p4_wr_clk;
                       assign mig_p4_wr_data  = p4_wr_data[31:0];
                       assign mig_p4_wr_mask  = p4_wr_mask[3:0];
                       assign mig_p4_en       = p4_wr_en; 
                       assign p4_wr_full      = mig_p4_full;
                       assign p4_wr_empty     = mig_p4_empty;