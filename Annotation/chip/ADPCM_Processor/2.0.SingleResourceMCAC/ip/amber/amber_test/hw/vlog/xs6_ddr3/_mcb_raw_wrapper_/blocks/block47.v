                        assign p1_rd_data     = {mig_p4_rd_data , mig_p2_rd_data};
                       
                       
                 end else
                 begin
                       assign mig_p2_arb_en      = 'b0;
                   
                  
                  
                       
                       assign mig_p2_cmd_clk     = 'b0;
                       assign mig_p2_cmd_en      = 'b0;
                       assign mig_p2_cmd_ra      = 'b0;