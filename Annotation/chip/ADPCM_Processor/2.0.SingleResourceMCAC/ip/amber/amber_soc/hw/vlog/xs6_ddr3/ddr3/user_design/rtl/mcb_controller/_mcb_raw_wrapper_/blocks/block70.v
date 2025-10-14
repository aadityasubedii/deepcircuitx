               if (C_PORT_ENABLE[2] == 1'b1)
               begin

                   assign mig_p2_arb_en      =      p2_arb_en ;
                   assign mig_p2_cmd_clk     =      p2_cmd_clk  ;
                   assign mig_p2_cmd_en      =      p2_cmd_en   ;
                   assign mig_p2_cmd_ra      =      p2_cmd_ra  ;
                   assign mig_p2_cmd_ba      =      p2_cmd_ba   ;
                   assign mig_p2_cmd_ca      =      p2_cmd_ca  ;
                   assign mig_p2_cmd_instr   =      p2_cmd_instr;
                   assign mig_p2_cmd_bl      =      {(p2_cmd_instr[2] | p2_cmd_bl[5]),p2_cmd_bl[4:0]}  ;
                   assign p2_cmd_empty   =      mig_p2_cmd_empty;
                   assign p2_cmd_full    =      mig_p2_cmd_full ;
                   
               end else
               begin

                   assign mig_p2_arb_en      =      'b0;
                   assign mig_p2_cmd_clk     =      'b0;
                   assign mig_p2_cmd_en      =      'b0;
                   assign mig_p2_cmd_ra      =      'b0;
                   assign mig_p2_cmd_ba      =      'b0;
                   assign mig_p2_cmd_ca      =      'b0;
                   assign mig_p2_cmd_instr   =      'b0;
                   assign mig_p2_cmd_bl      =      'b0;
                   assign p2_cmd_empty   =       'b0;
                   assign p2_cmd_full    =       'b0;
                   
               end
               