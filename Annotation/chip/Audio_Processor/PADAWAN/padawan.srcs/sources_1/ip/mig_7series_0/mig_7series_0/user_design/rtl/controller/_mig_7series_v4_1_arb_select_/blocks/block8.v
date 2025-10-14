   always@(posedge clk) begin
      mc_aux_out_r[0] <= #TCQ mc_aux_out0[1] ;
      mc_aux_out_r[1] <= #TCQ mc_aux_out0[3] ;
      mc_aux_out_r_1 <= #TCQ mc_aux_out_r ;
      mc_aux_out_r_2 <= #TCQ mc_aux_out_r_1 ;
   end 