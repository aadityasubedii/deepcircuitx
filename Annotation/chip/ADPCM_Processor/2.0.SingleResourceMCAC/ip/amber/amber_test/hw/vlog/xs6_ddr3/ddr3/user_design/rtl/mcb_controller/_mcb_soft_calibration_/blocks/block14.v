always @ ( posedge UI_CLK, posedge RST) begin
  
  if (RST)
    begin
      SELFREFRESH_MCB_MODE_R1 <= 1'b0;
      SELFREFRESH_MCB_MODE_R2 <= 1'b0;
      SELFREFRESH_MCB_MODE_R3 <= 1'b0;
      SELFREFRESH_REQ_R1      <= 1'b0;
      SELFREFRESH_REQ_R2      <= 1'b0;
      SELFREFRESH_REQ_R3      <= 1'b0;
      PLL_LOCK_R1             <= 1'b0;
      PLL_LOCK_R2             <= 1'b0;
    end
  else 
    begin
      SELFREFRESH_MCB_MODE_R1 <= SELFREFRESH_MCB_MODE;
      SELFREFRESH_MCB_MODE_R2 <= SELFREFRESH_MCB_MODE_R1;
      SELFREFRESH_MCB_MODE_R3 <= SELFREFRESH_MCB_MODE_R2;
      SELFREFRESH_REQ_R1      <= SELFREFRESH_REQ;
      SELFREFRESH_REQ_R2      <= SELFREFRESH_REQ_R1;
      SELFREFRESH_REQ_R3      <= SELFREFRESH_REQ_R2;
      PLL_LOCK_R1             <= PLL_LOCK;
      PLL_LOCK_R2             <= PLL_LOCK_R1;
    end
 end 