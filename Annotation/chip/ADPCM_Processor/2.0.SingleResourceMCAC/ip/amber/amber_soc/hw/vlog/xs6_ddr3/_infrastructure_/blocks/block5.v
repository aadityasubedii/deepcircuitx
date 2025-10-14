  always @(posedge clk0_bufg , posedge sys_rst)
      if(sys_rst)
         syn_clk0_powerup_pll_locked <= 1'b0;
       
      else if (bufpll_mcb_locked)
         syn_clk0_powerup_pll_locked <= 1'b1;
         