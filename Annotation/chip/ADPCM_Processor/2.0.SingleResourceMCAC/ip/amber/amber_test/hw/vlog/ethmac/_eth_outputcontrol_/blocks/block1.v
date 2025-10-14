always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      Mdo_2d <= #Tp 1'b0;
      Mdo_d <= #Tp 1'b0;
      Mdo <= #Tp 1'b0;
    end
  else
    begin
      if(MdcEn_n)
        begin
          Mdo_2d <= #Tp ~SerialEn & BitCounter<32;
          Mdo_d <= #Tp ShiftedBit | Mdo_2d;
          Mdo <= #Tp Mdo_d;
        end
    end
end