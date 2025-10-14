always @(posedge clk_i) begin
   if (rst_i[6])
       bl_out_reg <= #TCQ    fixed_bl_i;
   else if (bl_out_vld)
       bl_out_reg <= #TCQ    bl_out;
end