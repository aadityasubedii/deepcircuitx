always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    begin
      StateIPG        <= #Tp 1'b0;
      StateIdle       <= #Tp 1'b0;
      StatePreamble   <= #Tp 1'b0;
      StateData[1:0]  <= #Tp 2'b0;
      StatePAD        <= #Tp 1'b0;
      StateFCS        <= #Tp 1'b0;
      StateJam        <= #Tp 1'b0;
      StateJam_q      <= #Tp 1'b0;
      StateBackOff    <= #Tp 1'b0;
      StateDefer      <= #Tp 1'b1;
    end
  else
    begin
      StateData[1:0] <= #Tp StartData[1:0];
      StateJam_q <= #Tp StateJam;

      if(StartDefer | StartIdle)
        StateIPG <= #Tp 1'b0;
      else
      if(StartIPG)
        StateIPG <= #Tp 1'b1;

      if(StartDefer | StartPreamble)
        StateIdle <= #Tp 1'b0;
      else
      if(StartIdle)
        StateIdle <= #Tp 1'b1;

      if(StartData[0] | StartJam)
        StatePreamble <= #Tp 1'b0;
      else
      if(StartPreamble)
        StatePreamble <= #Tp 1'b1;

      if(StartFCS | StartJam)
        StatePAD <= #Tp 1'b0;
      else
      if(StartPAD)
        StatePAD <= #Tp 1'b1;

      if(StartJam | StartDefer)
        StateFCS <= #Tp 1'b0;
      else
      if(StartFCS)
        StateFCS <= #Tp 1'b1;

      if(StartBackoff | StartDefer)
        StateJam <= #Tp 1'b0;
      else
      if(StartJam)
        StateJam <= #Tp 1'b1;

      if(StartDefer)
        StateBackOff <= #Tp 1'b0;
      else
      if(StartBackoff)
        StateBackOff <= #Tp 1'b1;

      if(StartIPG)
        StateDefer <= #Tp 1'b0;
      else
      if(StartDefer)
        StateDefer <= #Tp 1'b1;
    end
end