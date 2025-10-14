  always @(posedge clock) begin
    if (reset) begin 
      currentState <= 2'h0; 
    end else if (2'h0 == currentState) begin 
      currentState <= 2'h2; 
    end else if (2'h1 == currentState) begin 
      currentState <= 2'h2; 
    end
    if (reset) begin 
      syncing <= 1'h0; 
    end else if (~synced) begin 
      syncing <= _GEN_0;
    end
    if (reset) begin 
      synced <= 1'h0; 
    end else if (~synced) begin 
      if (syncing) begin 
        synced <= _GEN_1;
      end
    end
    if (reset) begin 
      biPhaseEna <= 1'h0; 
    end else if (!(2'h0 == currentState)) begin 
      if (!(2'h1 == currentState)) begin 
        if (2'h2 == currentState) begin 
          biPhaseEna <= _GEN_44;
        end
      end
    end
    leds <= _GEN_97[15:0]; 
    if (reset) begin 
      left <= 16'h0; 
    end else if (!(2'h0 == currentState)) begin 
      if (!(2'h1 == currentState)) begin 
        if (2'h2 == currentState) begin 
          left <= _GEN_48;
        end
      end
    end
    if (reset) begin 
      right <= 16'h0; 
    end else if (!(2'h0 == currentState)) begin 
      if (!(2'h1 == currentState)) begin 
        if (2'h2 == currentState) begin 
          right <= _GEN_50;
        end
      end
    end
    if (reset) begin 
      dspData <= 16'h0; 
    end else if (!(2'h0 == currentState)) begin 
      if (!(2'h1 == currentState)) begin 
        if (2'h2 == currentState) begin 
          dspData <= _GEN_51;
        end
      end
    end
    if (reset) begin 
      bitCntr <= 8'h0; 
    end else if (2'h0 == currentState) begin 
      bitCntr <= _GEN_6;
    end else if (2'h1 == currentState) begin 
      bitCntr <= _GEN_6;
    end else if (2'h2 == currentState) begin 
      bitCntr <= _GEN_45;
    end else begin
      bitCntr <= _GEN_6;
    end
  end