               if (C_PORT_ENABLE[5] == 1'b1)
               begin

                   assign  mig_p5_arb_en    =     p5_arb_en ;
                   assign  mig_p5_cmd_clk   =     p5_cmd_clk  ;
                   assign  mig_p5_cmd_en    =     p5_cmd_en   ;
                   assign  mig_p5_cmd_ra    =     p5_cmd_ra  ;
                   assign  mig_p5_cmd_ba    =     p5_cmd_ba   ;
                   assign  mig_p5_cmd_ca    =     p5_cmd_ca  ;
                   assign mig_p5_cmd_instr  =     p5_cmd_instr;
                   assign mig_p5_cmd_bl     =     {(p5_cmd_instr[2] | p5_cmd_bl[5]),p5_cmd_bl[4:0]}  ;
                   assign p5_cmd_empty   =     mig_p5_cmd_empty;
                   assign p5_cmd_full    =     mig_p5_cmd_full ;
                   
               end else
               begin
                   assign  mig_p5_arb_en     =   'b0;
                   assign  mig_p5_cmd_clk    =   'b0;
                   assign  mig_p5_cmd_en     =   'b0;
                   assign  mig_p5_cmd_ra     =   'b0;
                   assign  mig_p5_cmd_ba     =   'b0;
                   assign  mig_p5_cmd_ca     =   'b0;
                   assign mig_p5_cmd_instr   =   'b0;
                   assign mig_p5_cmd_bl      =   'b0;
                   assign p5_cmd_empty   =     'b0;
                   assign p5_cmd_full    =     'b0;
                   
               
               end
