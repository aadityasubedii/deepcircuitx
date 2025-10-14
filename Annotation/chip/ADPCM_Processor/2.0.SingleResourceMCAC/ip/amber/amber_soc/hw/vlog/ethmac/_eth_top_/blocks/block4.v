always @ (posedge mrx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    RxAbort_latch <= #Tp 1'b0;
  else if(RxAbort | (ShortFrame & ~r_RecSmall) | LatchedMRxErr & ~InvalidSymbol | (ReceivedPauseFrm & (~r_PassAll)))
    RxAbort_latch <= #Tp 1'b1;
  else if(RxAbortRst)
    RxAbort_latch <= #Tp 1'b0;
end