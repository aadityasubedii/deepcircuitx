  always @(posedge clock) begin
    if (reset) begin 
      inBufr <= 2'h0; 
    end else if (io_INPUT) begin 
      if (inBufr < 2'h2) begin 
        inBufr <= _inBufr_T_1; 
      end
    end else if (~io_INPUT) begin 
      if (inBufr > 2'h0) begin 
        inBufr <= _inBufr_T_3; 
      end
    end
    if (reset) begin 
      inBufrPrev <= 2'h0; 
    end else if (io_INPUT) begin 
      if (inBufr < 2'h2) begin 
        inBufrPrev <= inBufr; 
      end
    end else if (~io_INPUT) begin 
      if (inBufr > 2'h0) begin 
        inBufrPrev <= inBufr; 
      end
    end
    if (reset) begin 
      rising <= 1'h0; 
    end else if (rising) begin 
      rising <= 1'h0; 
    end else if (inBufrPrev == 2'h2 & _T_5) begin 
      rising <= 1'h0; 
    end else begin
      rising <= _GEN_9;
    end
  end