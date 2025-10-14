   always @(posedge clk_i)
   begin
       run_traffic_reg <= #TCQ run_traffic_i;
   end