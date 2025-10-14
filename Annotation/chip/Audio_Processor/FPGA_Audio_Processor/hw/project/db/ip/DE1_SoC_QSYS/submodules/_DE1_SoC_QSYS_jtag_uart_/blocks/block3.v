  always @(posedge clk)
    begin
      sim_t_pause <= 1'b0;
      sim_t_ena <= 1'b0;
      sim_t_dat <= t_dav ? r_dat : {8{r_val}};
      sim_r_ena <= 1'b0;
    end