               if (C_PORT_ENABLE[4] == 1'b1)
               begin

                   assign mig_p4_arb_en    =        p4_arb_en ;
                   assign mig_p4_cmd_clk     =      p4_cmd_clk  ;
                   assign mig_p4_cmd_en      =      p4_cmd_en   ;
                   assign mig_p4_cmd_ra      =      p4_cmd_ra  ;
                   assign mig_p4_cmd_ba      =      p4_cmd_ba   ;
                   assign mig_p4_cmd_ca      =      p4_cmd_ca  ;
                   assign mig_p4_cmd_instr   =      p4_cmd_instr;
                   assign mig_p4_cmd_bl      =      {(p4_cmd_instr[2] | p4_cmd_bl[5]),p4_cmd_bl[4:0]}  ;
                   assign p4_cmd_empty   =      mig_p4_cmd_empty;
                   assign p4_cmd_full    =      mig_p4_cmd_full ;
                   
               end else
               begin
                   assign mig_p4_arb_en      =      'b0;
                   assign mig_p4_cmd_clk     =      'b0;
                   assign mig_p4_cmd_en      =      'b0;
                   assign mig_p4_cmd_ra      =      'b0;
                   assign mig_p4_cmd_ba      =      'b0;
                   assign mig_p4_cmd_ca      =      'b0;
                   assign mig_p4_cmd_instr   =      'b0;
                   assign mig_p4_cmd_bl      =      'b0;
                   assign p4_cmd_empty   =      'b0;
                   assign p4_cmd_full    =      'b0;
                   

