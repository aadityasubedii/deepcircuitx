always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      RxAbort_sync1 <= #Tp 1'b0;
      RxAbort_wb    <= #Tp 1'b0;
      RxAbort_wb    <= #Tp 1'b0;
    end
  else
    begin
      RxAbort_sync1 <= #Tp RxAbort_latch;
      RxAbort_wb    <= #Tp RxAbort_sync1;
    end
end