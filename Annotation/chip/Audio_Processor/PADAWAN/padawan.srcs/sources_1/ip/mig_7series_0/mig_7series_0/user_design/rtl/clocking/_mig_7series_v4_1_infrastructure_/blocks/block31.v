  assign sys_rst_act_hi = RST_ACT_LOW ? ~sys_rst: sys_rst;

  
  
  
  

  assign clk        = clk_bufg;
  assign pll_locked = pll_locked_i & MMCM_Locked_i;
  assign mmcm_locked = MMCM_Locked_i;
