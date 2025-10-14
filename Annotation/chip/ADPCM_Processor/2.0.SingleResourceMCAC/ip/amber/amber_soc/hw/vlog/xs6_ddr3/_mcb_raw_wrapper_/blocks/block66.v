               if (C_PORT_ENABLE[1] == 1'b1)
               begin


                   assign mig_p1_arb_en      =      p1_arb_en ;
                   assign mig_p1_cmd_clk     =      p1_cmd_clk  ;
                   assign mig_p1_cmd_en      =      p1_cmd_en   ;
                   assign mig_p1_cmd_ra      =      p1_cmd_ra  ;
                   assign mig_p1_cmd_ba      =      p1_cmd_ba   ;
                   assign mig_p1_cmd_ca      =      p1_cmd_ca  ;
                   assign mig_p1_cmd_instr   =      p1_cmd_instr;
                   assign mig_p1_cmd_bl      =      {(p1_cmd_instr[2] | p1_cmd_bl[5]),p1_cmd_bl[4:0]}  ;
                   assign p1_cmd_empty       =      mig_p1_cmd_empty;
                   assign p1_cmd_full        =      mig_p1_cmd_full ;
                   
               end else
               begin
                   assign mig_p1_arb_en      =     'b0;