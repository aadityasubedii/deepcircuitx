always @ (posedge mrx_clk_pad_i)
begin
  WillTransmit_q <= #Tp WillTransmit;
  WillTransmit_q2 <= #Tp WillTransmit_q;
end 