always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      StateIdle     <= #Tp 1'b0;
      StateDrop     <= #Tp 1'b1;
      StatePreamble <= #Tp 1'b0;
      StateSFD      <= #Tp 1'b0;
      StateData0    <= #Tp 1'b0;
      StateData1    <= #Tp 1'b0;
    end
  else
    begin
      if(StartPreamble | StartSFD | StartDrop)
        StateIdle <= #Tp 1'b0;
      else
      if(StartIdle)
        StateIdle <= #Tp 1'b1;

      if(StartIdle)
        StateDrop <= #Tp 1'b0;
      else
      if(StartDrop)
        StateDrop <= #Tp 1'b1;

      if(StartSFD | StartIdle | StartDrop)
        StatePreamble <= #Tp 1'b0;
      else
      if(StartPreamble)
        StatePreamble <= #Tp 1'b1;

      if(StartPreamble | StartIdle | StartData0 | StartDrop)
        StateSFD <= #Tp 1'b0;
      else
      if(StartSFD)
        StateSFD <= #Tp 1'b1;

      if(StartIdle | StartData1 | StartDrop)
        StateData0 <= #Tp 1'b0;
      else
      if(StartData0)
        StateData0 <= #Tp 1'b1;

      if(StartIdle | StartData0 | StartDrop)
        StateData1 <= #Tp 1'b0;
      else
      if(StartData1)
        StateData1 <= #Tp 1'b1;
    end
end