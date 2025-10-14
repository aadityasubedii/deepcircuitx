  end else if(C_PORT_CONFIG == "B32_B32_B32_B32" ) begin : u_config_2

           
               
               
               
                  if (C_PORT_ENABLE[0] == 1'b1)
                  begin
                           
                           assign mig_p0_arb_en      =      p0_arb_en ;
                           assign mig_p0_cmd_clk     =      p0_cmd_clk  ;