always @ (posedge UI_CLK or posedge non_violating_rst ) begin  
  if (non_violating_rst)          
    RST_reg <= 1'b1;                                       
  else if (~WAIT_200us_COUNTER[15])
    RST_reg <= 1'b1;         
  else 
    RST_reg     <= rst_tmp; 
    
end