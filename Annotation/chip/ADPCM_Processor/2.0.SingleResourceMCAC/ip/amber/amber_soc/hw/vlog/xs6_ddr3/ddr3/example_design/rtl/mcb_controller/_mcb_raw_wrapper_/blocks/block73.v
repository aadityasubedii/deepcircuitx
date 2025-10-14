               if (C_PORT_ENABLE[0] == 1'b1)
               begin

                   assign mig_p0_arb_en      =      p0_arb_en ;
                   assign mig_p0_cmd_clk     =      p0_cmd_clk  ;
                   assign mig_p0_cmd_en      =      p0_cmd_en   ;
                   assign mig_p0_cmd_ra      =      p0_cmd_ra  ;
                   assign mig_p0_cmd_ba      =      p0_cmd_ba   ;
                   assign mig_p0_cmd_ca      =      p0_cmd_ca  ;
                   assign mig_p0_cmd_instr   =      p0_cmd_instr;
                   assign mig_p0_cmd_bl      =      {(p0_cmd_instr[2] | p0_cmd_bl[5]),p0_cmd_bl[4:0]}  ;
                   assign p0_cmd_empty       =      mig_p0_cmd_empty;
                   assign p0_cmd_full        =      mig_p0_cmd_full ;
                   
               end else
               begin
               
                   assign mig_p0_arb_en      =     'b0;
                   assign mig_p0_cmd_clk     =     'b0;
                   assign mig_p0_cmd_en      =     'b0;
                   assign mig_p0_cmd_ra      =     'b0;
                   assign mig_p0_cmd_ba      =     'b0;
                   assign mig_p0_cmd_ca      =     'b0;
                   assign mig_p0_cmd_instr   =     'b0;
                   assign mig_p0_cmd_bl      =     'b0;
                   assign p0_cmd_empty       =     'b0;
                   assign p0_cmd_full        =     'b0;
                   
               end