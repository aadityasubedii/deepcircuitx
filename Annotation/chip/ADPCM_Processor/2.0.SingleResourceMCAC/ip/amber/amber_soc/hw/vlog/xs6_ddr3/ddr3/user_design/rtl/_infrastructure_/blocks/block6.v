  always @(posedge mcb_drp_clk , posedge sys_rst)
      if(sys_rst)
         powerup_pll_locked <= 1'b0;
       
      else if (bufpll_mcb_locked)
         powerup_pll_locked <= 1'b1;
         
