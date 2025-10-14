  always @(posedge clock) begin
    lastOne <= _GEN_53[7:0]; 
    leds <= _GEN_54[15:0]; 
    if (reset) begin 
      inBufr <= 2'h0; 
    end else if (io_DATA_IN) begin 
      if (inBufr < 2'h3) begin 
        inBufr <= _inBufr_T_1; 
      end
    end else if (~io_DATA_IN) begin 
      if (inBufr > 2'h0) begin 
        inBufr <= _inBufr_T_3; 
      end
    end
    if (reset) begin 
      deltaCntr <= 8'h0; 
    end else if (change) begin 
      deltaCntr <= 8'h0; 
    end else begin
      deltaCntr <= _deltaCntr_T_1; 
    end
    if (reset) begin 
      bitCntr <= 7'h0; 
    end else if (_GEN_49 >= _T_21) begin 
      if (~syncFlipped1) begin 
        bitCntr <= 7'h0; 
      end else begin
        bitCntr <= _GEN_16;
      end
    end else begin
      bitCntr <= _GEN_16;
    end
    if (reset) begin 
      clkRec <= 1'h0; 
    end else if (_GEN_49 >= _T_21) begin 
      if (~syncFlipped1) begin 
        clkRec <= _clkRec_T; 
      end else begin
        clkRec <= _GEN_28;
      end
    end else begin
      clkRec <= _GEN_28;
    end
    if (reset) begin 
      change <= 1'h0; 
    end else if (change) begin 
      change <= 1'h0; 
    end else begin
      change <= _GEN_4;
    end
    if (reset) begin 
      dataOut <= 1'h0; 
    end else if (deltaCntr > lastOne & _GEN_49 < _T_14) begin 
      dataOut <= 1'h0; 
    end else if (deltaCntr <= lastOne) begin 
      dataOut <= _GEN_19;
    end
    if (reset) begin 
      syncWord <= 1'h0; 
    end else begin
      syncWord <= _GEN_36;
    end
    if (reset) begin 
      zeroFlipped <= 1'h0; 
    end else if (deltaCntr > lastOne & _GEN_49 < _T_14) begin 
      zeroFlipped <= _GEN_22;
    end else if (change) begin 
      zeroFlipped <= 1'h0; 
    end
    if (reset) begin 
      syncFlipped <= 1'h0; 
    end else if (_GEN_49 >= _T_14) begin 
      syncFlipped <= _GEN_27;
    end else if (change) begin 
      syncFlipped <= 1'h0; 
    end
    if (reset) begin 
      syncFlipped1 <= 1'h0; 
    end else if (_GEN_49 >= _T_21) begin 
      syncFlipped1 <= _GEN_31;
    end else if (change) begin 
      syncFlipped1 <= 1'h0; 
    end
  end