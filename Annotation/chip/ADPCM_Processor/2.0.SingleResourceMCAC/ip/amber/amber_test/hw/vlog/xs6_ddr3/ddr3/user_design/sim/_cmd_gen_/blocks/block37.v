always @ (posedge clk_i) begin
   if (mode_load_pulse) begin
        bl_mode_reg    <= #TCQ    bl_mode_i ;
   end
   mode_load_d1         <= #TCQ    mode_load_i;
   mode_load_d2         <= #TCQ    mode_load_d1;
end