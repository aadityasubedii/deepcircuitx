always @ (posedge mrx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      RxAbortRst_sync1 <= #Tp 1'b0;
      RxAbortRst       <= #Tp 1'b0;
    end
  else
    begin
      RxAbortRst_sync1 <= #Tp RxAbort_wb;
      RxAbortRst       <= #Tp RxAbortRst_sync1;
    end
end