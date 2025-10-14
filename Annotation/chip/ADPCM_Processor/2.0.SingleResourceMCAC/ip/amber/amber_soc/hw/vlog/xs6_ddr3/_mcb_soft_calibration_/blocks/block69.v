always @ (posedge UI_CLK or posedge RST ) begin  
  if (RST) begin         
    Block_Reset <= 1'b0;
    RstCounter  <= 10'b0;
end
  else begin
    Block_Reset <= 1'b0;                   
    if (Pre_SYSRST)
      RstCounter  <= RST_CNT;              
    else begin
      if (RstCounter < TZQINIT_MAXCNT) begin 
        Block_Reset <= 1'b1;               
        RstCounter  <= RstCounter + 1'b1;  
      end
    end
  end
end