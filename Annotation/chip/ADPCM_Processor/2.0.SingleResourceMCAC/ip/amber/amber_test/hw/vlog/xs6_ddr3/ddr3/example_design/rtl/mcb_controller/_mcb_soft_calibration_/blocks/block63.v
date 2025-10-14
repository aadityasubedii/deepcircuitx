always @ (posedge UI_CLK) begin
   if (RST) 
    begin
       WaitTimer <= 'b0;
       WarmEnough <= 1'b1;
    end       
  else if (~SELFREFRESH_REQ_R2 && SELFREFRESH_REQ_R1)  
    begin
       WaitTimer <= 'b0;
       WarmEnough <= 1'b0;
    end       
  else if (WaitTimer == 8'h4)
    begin
       WaitTimer <= WaitTimer ;
       WarmEnough <= 1'b1;
    end       
  else if (WaitCountEnable)
       WaitTimer <= WaitTimer + 1;
  else
       WaitTimer <= WaitTimer ;
  
end  