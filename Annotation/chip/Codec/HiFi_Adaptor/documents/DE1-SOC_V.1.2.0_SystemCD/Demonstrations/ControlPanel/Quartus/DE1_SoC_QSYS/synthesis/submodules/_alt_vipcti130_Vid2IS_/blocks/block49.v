         always @ (posedge rst or posedge vid_clk_int) begin
             if(rst) begin
                rst_vid_clk_reg <= 1'b1;
                rst_vid_clk_reg2 <= 1'b1;
             end else begin
                rst_vid_clk_reg <= 1'b0;
                rst_vid_clk_reg2 <= rst_vid_clk_reg;
             end
         end