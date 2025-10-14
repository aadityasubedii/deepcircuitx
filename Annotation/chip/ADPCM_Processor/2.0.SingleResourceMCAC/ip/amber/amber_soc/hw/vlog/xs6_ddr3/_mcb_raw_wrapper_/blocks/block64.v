               if (C_PORT_ENABLE[3] == 1'b1)
               begin

                   assign mig_p3_arb_en    =        p3_arb_en ;
                   assign mig_p3_cmd_clk     =      p3_cmd_clk  ;
                   assign mig_p3_cmd_en      =      p3_cmd_en   ;
                   assign mig_p3_cmd_ra      =      p3_cmd_ra  ;
                   assign mig_p3_cmd_ba      =      p3_cmd_ba   ;
                   assign mig_p3_cmd_ca      =      p3_cmd_ca  ;
                   assign mig_p3_cmd_instr   =      p3_cmd_instr;
                   assign mig_p3_cmd_bl      =      {(p3_cmd_instr[2] | p3_cmd_bl[5]),p3_cmd_bl[4:0]}  ;
                   assign p3_cmd_empty   =      mig_p3_cmd_empty;
                   assign p3_cmd_full    =      mig_p3_cmd_full ;
                   
               end else
               begin
                   assign mig_p3_arb_en    =       'b0;
                   assign mig_p3_cmd_clk     =     'b0;
                   assign mig_p3_cmd_en      =     'b0;
                   assign mig_p3_cmd_ra      =     'b0;
                   assign mig_p3_cmd_ba      =     'b0;
                   assign mig_p3_cmd_ca      =     'b0;
                   assign mig_p3_cmd_instr   =     'b0;
                   assign mig_p3_cmd_bl      =     'b0;
                   assign p3_cmd_empty   =     'b0;
                   assign p3_cmd_full    =     'b0;