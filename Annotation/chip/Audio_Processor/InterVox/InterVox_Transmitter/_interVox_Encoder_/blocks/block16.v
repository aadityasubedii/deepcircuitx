  always @(posedge clock) begin
    if (reset) begin 
      outReg <= 1'h0; 
    end else if (io_CLK) begin 
      if (enabled) begin 
        if (bitCntr_enc > 8'h5) begin 
          outReg <= _GEN_13;
        end else begin
          outReg <= _GEN_2;
        end
      end
    end
    if (reset) begin 
      stereoData <= 64'h0; 
    end else begin
      stereoData <= io_AUDIOINPUT; 
    end
    dspData <= _GEN_34[15:0]; 
    if (reset) begin 
      bitCntr_enc <= 8'h0; 
    end else if (io_CLK) begin 
      if (enabled) begin 
        if (bitCntr_enc == 8'h7f) begin 
          bitCntr_enc <= 8'h0; 
        end else begin
          bitCntr_enc <= _bitCntr_enc_T_1; 
        end
      end
    end
    if (reset) begin 
      hasNone <= 1'h0; 
    end else if (io_CLK) begin 
      if (enabled) begin 
        if (bitCntr_enc > 8'h5) begin 
          hasNone <= _GEN_14;
        end
      end
    end
    if (reset) begin 
      dataIndex <= 6'h0; 
    end else if (io_CLK) begin 
      if (enabled) begin 
        if (bitCntr_enc == 8'h7f) begin 
          dataIndex <= 6'h0; 
        end else begin
          dataIndex <= _GEN_16;
        end
      end
    end
    if (reset) begin 
      ndexR <= 1'h0; 
    end else if (io_CLK) begin 
      if (enabled) begin 
        if (bitCntr_enc > 8'h5) begin 
          ndexR <= ~ndexR; 
        end
      end
    end
    if (reset) begin 
      enabled <= 1'h0; 
    end else if (io_CLK) begin 
      if (enabled) begin 
        if (bitCntr_enc == 8'h7f) begin 
          enabled <= 1'h0; 
        end else begin
          enabled <= io_ENA; 
        end
      end else begin
        enabled <= io_ENA; 
      end
    end else begin
      enabled <= io_ENA; 
    end
  end