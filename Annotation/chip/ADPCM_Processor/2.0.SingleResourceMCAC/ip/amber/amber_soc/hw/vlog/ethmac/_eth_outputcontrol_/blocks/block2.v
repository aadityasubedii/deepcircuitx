always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      MdoEn_2d <= #Tp 1'b0;
      MdoEn_d <= #Tp 1'b0;
      MdoEn <= #Tp 1'b0;
    end
  else
    begin
      if(MdcEn_n)
        begin
          MdoEn_2d <= #Tp SerialEn | InProgress & BitCounter<32;
          MdoEn_d <= #Tp MdoEn_2d;
          MdoEn <= #Tp MdoEn_d;
        end
    end
end