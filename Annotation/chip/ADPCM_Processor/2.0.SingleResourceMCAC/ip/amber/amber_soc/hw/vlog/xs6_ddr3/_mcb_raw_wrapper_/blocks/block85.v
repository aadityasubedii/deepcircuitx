always @ (posedge ui_clk)
begin 
  if (~selfrefresh_enter && ~selfrefresh_mode)
   syn_uiclk_pll_lock <= pll_lock;
   
end   