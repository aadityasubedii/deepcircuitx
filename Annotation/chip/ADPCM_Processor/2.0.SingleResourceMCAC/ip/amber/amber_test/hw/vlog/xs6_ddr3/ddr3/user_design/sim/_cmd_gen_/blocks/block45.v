 always @ (posedge clk_i)
 begin
      instr_mode_reg <= #TCQ  instr_mode_i;
 end 