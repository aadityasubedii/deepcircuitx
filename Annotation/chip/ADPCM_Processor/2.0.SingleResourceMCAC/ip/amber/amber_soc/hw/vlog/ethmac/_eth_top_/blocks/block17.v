always @ (posedge mtx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      CarrierSense_Tx1 <= #Tp 1'b0;
      CarrierSense_Tx2 <= #Tp 1'b0;
    end
  else
    begin
      CarrierSense_Tx1 <= #Tp mcrs_pad_i;
      CarrierSense_Tx2 <= #Tp CarrierSense_Tx1;
    end
end