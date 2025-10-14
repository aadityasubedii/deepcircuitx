                            assign p0_wr_full    = mig_p0_wr_full;
                            assign p1_wr_full    = mig_p1_wr_full;
                            assign p2_wr_full    = mig_p3_full;
                            assign p3_wr_full    = mig_p5_full;

                            assign p0_wr_error    = mig_p0_wr_error;
                            assign p1_wr_error    = mig_p1_wr_error;
                            assign p2_wr_error    = mig_p3_error;
                            assign p3_wr_error    = mig_p5_error;

     
                           assign p4_cmd_empty        =     1'b0;
                           assign p4_cmd_full         =     1'b0;
                           assign mig_p2_wr_mask  = 'b0;
                           assign mig_p4_wr_mask  = 'b0;

                           assign mig_p2_wr_data     = 'b0;
                           assign mig_p4_wr_data     = 'b0;

                           assign p5_cmd_empty        =     1'b0;
                           assign p5_cmd_full         =     1'b0;
     
 
                            assign mig_p3_cmd_clk     =      1'b0;
                            assign mig_p3_cmd_en      =      1'b0;
                            assign mig_p3_cmd_ra      =      15'd0;
                            assign mig_p3_cmd_ba      =      3'd0;
                            assign mig_p3_cmd_ca      =      12'd0;
                            assign mig_p3_cmd_instr   =      3'd0;
                            assign mig_p3_cmd_bl      =      6'd0;
                            assign mig_p3_arb_en      =      1'b0;  