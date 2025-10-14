always @ (posedge clk_i)
     mode_load_pulse <= #TCQ  mode_load_d1 & ~mode_load_d2;
