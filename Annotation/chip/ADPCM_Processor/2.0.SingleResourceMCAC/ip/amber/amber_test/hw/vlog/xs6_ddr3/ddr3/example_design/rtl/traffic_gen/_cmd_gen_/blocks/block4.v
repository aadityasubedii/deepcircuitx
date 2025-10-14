always @ (posedge clk_i) begin
   if (mode_load_pulse)
        bl_out <= #TCQ    fixed_bl_i ;
   else if (cmd_clk_en) begin
     case({bl_mode_reg})
         0: bl_out <= #TCQ    bram_bl_i  ;
         1: bl_out <= #TCQ    fixed_bl_i ;
         2: bl_out <= #TCQ    prbs_brlen;
         default : bl_out <= #TCQ    6'h1;
     endcase
   end
end