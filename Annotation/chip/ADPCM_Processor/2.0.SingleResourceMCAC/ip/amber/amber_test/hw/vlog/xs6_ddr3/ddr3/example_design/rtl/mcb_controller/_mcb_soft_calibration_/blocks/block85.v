 always @ (posedge UI_CLK, posedge RST)
  begin
   if (RST)
     WAIT_200us_COUNTER <= (C_SIMULATION == "TRUE") ? 16'h7FF0 : 16'h0;
   else 
      if (WAIT_200us_COUNTER[15])  
        WAIT_200us_COUNTER <= WAIT_200us_COUNTER                        ;
      else
        WAIT_200us_COUNTER <= WAIT_200us_COUNTER + 1'b1;
  end 