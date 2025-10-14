   if((nCK_PER_CLK == 4) && (nSLOTS > 1 )) begin:odt_high_time_4_1_dslot
    assign mc_odt[0] = mc_aux_out0[1] | mc_aux_out_r[0] | mc_aux_out_r_1[0];
    assign mc_odt[1] = mc_aux_out0[3] | mc_aux_out_r[1] | mc_aux_out_r_1[1];
   end else if(nCK_PER_CLK == 4) begin:odt_high_time_4_1
    assign mc_odt[0] = mc_aux_out0[1] | mc_aux_out_r[0] ;
    assign mc_odt[1] = mc_aux_out0[3] | mc_aux_out_r[1] ;
   end else if(nCK_PER_CLK == 2) begin:odt_high_time_2_1
    assign mc_odt[0] = mc_aux_out0[1] | mc_aux_out_r[0] | mc_aux_out_r_1[0] | mc_aux_out_r_2[0] ;
    assign mc_odt[1] = mc_aux_out0[3] | mc_aux_out_r[1] | mc_aux_out_r_1[1] | mc_aux_out_r_2[1] ;
   end 
 end