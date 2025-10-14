 always @ (posedge clk_i)
    instr_vld_dly1  <=  #TCQ instr_vld;
