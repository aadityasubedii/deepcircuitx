   always@(posedge clk) begin
     wr_level_start_r <= #TCQ wr_level_start;
   end