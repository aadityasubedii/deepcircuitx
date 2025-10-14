always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    BitCounter[6:0] <= #Tp 7'h0;
  else
    begin
      if(MdcEn)
        begin
          if(InProgress)
            begin
              if(NoPre & ( BitCounter == 7'h0 ))
                BitCounter[6:0] <= #Tp 7'h21;
              else
                BitCounter[6:0] <= #Tp BitCounter[6:0] + 1'b1;
            end
          else
            BitCounter[6:0] <= #Tp 7'h0;
        end
    end
end