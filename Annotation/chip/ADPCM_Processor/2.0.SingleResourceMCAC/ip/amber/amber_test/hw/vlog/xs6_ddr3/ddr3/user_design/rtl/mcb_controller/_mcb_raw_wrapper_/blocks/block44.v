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