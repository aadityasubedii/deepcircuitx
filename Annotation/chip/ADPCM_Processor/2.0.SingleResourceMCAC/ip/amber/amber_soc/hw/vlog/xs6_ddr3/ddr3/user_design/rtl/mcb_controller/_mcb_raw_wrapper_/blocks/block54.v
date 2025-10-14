                           
                 end                           
                           
                           assign p0_cmd_empty       =      mig_p0_cmd_empty ;
                           assign p0_cmd_full        =      mig_p0_cmd_full  ;
                           
                           
                  if (C_PORT_ENABLE[1] == 1'b1)
                  begin
                           

                           assign mig_p1_arb_en      =      p1_arb_en ;
                           assign mig_p1_cmd_clk     =      p1_cmd_clk  ;
                           assign mig_p1_cmd_en      =      p1_cmd_en   ;
                           assign mig_p1_cmd_ra      =      p1_cmd_ra  ;
                           assign mig_p1_cmd_ba      =      p1_cmd_ba   ;