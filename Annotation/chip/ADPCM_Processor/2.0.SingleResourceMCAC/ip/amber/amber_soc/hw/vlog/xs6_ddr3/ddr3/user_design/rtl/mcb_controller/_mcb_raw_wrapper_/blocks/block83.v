always @ (posedge ui_clk)
begin 
  if (sys_rst)
   soft_cal_selfrefresh_req <= 1'b0;
  else if (selfrefresh_enter_r3)
     soft_cal_selfrefresh_req <= 1'b1;
  else if (~selfrefresh_enter_r3 && pll_lock)
     soft_cal_selfrefresh_req <= 1'b0;
  else
     soft_cal_selfrefresh_req <= soft_cal_selfrefresh_req;
  
end   