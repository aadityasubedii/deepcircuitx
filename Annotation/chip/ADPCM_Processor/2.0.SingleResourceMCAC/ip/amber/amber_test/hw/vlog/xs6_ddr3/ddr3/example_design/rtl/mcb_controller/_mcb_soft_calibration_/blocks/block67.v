always @ (posedge UI_CLK) begin
  if (RST)
    SELFREFRESH_MODE <= 1'b0;
  else if (SELFREFRESH_MCB_MODE_R2)  
    SELFREFRESH_MODE <= 1'b1;
    else if (WarmEnough)
     SELFREFRESH_MODE <= 1'b0;
end