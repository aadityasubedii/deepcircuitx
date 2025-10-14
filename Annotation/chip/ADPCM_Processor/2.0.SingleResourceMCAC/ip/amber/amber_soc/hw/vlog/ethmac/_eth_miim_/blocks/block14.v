always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      WCtrlDataStart_q1 <= #Tp 1'b0;
      WCtrlDataStart_q2 <= #Tp 1'b0;

      RStatStart_q1 <= #Tp 1'b0;
      RStatStart_q2 <= #Tp 1'b0;

      InProgress_q1 <= #Tp 1'b0;
      InProgress_q2 <= #Tp 1'b0;
      InProgress_q3 <= #Tp 1'b0;

  	  LatchByte0_d <= #Tp 1'b0;
  	  LatchByte1_d <= #Tp 1'b0;

  	  LatchByte <= #Tp 2'b00;
    end
  else
    begin
      if(MdcEn)
        begin
          WCtrlDataStart_q1 <= #Tp WCtrlDataStart;
          WCtrlDataStart_q2 <= #Tp WCtrlDataStart_q1;

          RStatStart_q1 <= #Tp RStatStart;
          RStatStart_q2 <= #Tp RStatStart_q1;

          LatchByte[0] <= #Tp LatchByte0_d;
          LatchByte[1] <= #Tp LatchByte1_d;

          LatchByte0_d <= #Tp LatchByte0_d2;
          LatchByte1_d <= #Tp LatchByte1_d2;

          InProgress_q1 <= #Tp InProgress;
          InProgress_q2 <= #Tp InProgress_q1;
          InProgress_q3 <= #Tp InProgress_q2;
        end
    end
end 