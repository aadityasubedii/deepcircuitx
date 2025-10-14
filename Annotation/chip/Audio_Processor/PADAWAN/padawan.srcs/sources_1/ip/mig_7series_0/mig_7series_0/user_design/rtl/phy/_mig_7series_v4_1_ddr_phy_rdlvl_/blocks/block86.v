   always @(posedge clk) begin
     pi_stg2_load  <= #TCQ pi_stg2_load_timing;
     pi_stg2_reg_l <= #TCQ pi_stg2_reg_l_timing;
   end