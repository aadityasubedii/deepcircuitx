always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ReceivedPacketTooBig <=#Tp 1'b0;
  else
  if(LoadRxStatus)
    ReceivedPacketTooBig <=#Tp 1'b0;
  else
  if(TakeSample)
    ReceivedPacketTooBig <=#Tp ~r_HugEn & RxByteCnt[15:0] > r_MaxFL[15:0];
end