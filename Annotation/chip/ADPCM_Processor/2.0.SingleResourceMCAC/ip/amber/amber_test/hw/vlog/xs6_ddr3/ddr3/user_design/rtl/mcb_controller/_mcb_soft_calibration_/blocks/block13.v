always @ ( posedge UI_CLK) begin
  if (RST)
    SELFREFRESH_MCB_REQ <= 1'b0;
  else if (PLL_LOCK_R2 && ~SELFREFRESH_REQ_R3 )

    SELFREFRESH_MCB_REQ <=  1'b0;
  else if (STATE == START_DYN_CAL && SELFREFRESH_REQ_R3)  
    SELFREFRESH_MCB_REQ <= 1'b1;
end