generate begin : clocks_are_same_generate
     if(CLOCKS_ARE_SAME) begin
         assign rst_vid_clk = rst;
         assign vid_clk_int = is_clk;
     end else begin
         reg rst_vid_clk_reg;
         reg rst_vid_clk_reg2;
         