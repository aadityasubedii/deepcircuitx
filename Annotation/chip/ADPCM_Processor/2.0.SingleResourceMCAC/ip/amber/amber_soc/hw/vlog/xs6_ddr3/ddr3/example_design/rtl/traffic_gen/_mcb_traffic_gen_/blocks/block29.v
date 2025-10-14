   always @(posedge clk_i)
   begin
         rst_ra <= #TCQ {rst_i,rst_i,rst_i,rst_i,rst_i,rst_i,rst_i,rst_i,rst_i,rst_i};
         rst_rb <= #TCQ {rst_i,rst_i,rst_i,rst_i,rst_i,rst_i,rst_i,rst_i,rst_i,rst_i};

   end