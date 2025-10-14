  always @(posedge clock) begin
    if (reset) begin 
      bitCntrTrans <= 8'h0; 
    end else if (CLK1EDGE_io_RISE) begin 
      bitCntrTrans <= _bitCntrTrans_T_1; 
    end else if (io_NEXT) begin 
      bitCntrTrans <= 8'h0; 
    end
    if (reset) begin 
      lrclk <= 1'h0; 
    end else if (CLK1EDGE_io_RISE) begin 
      if (bitCntrTrans > 8'h1f) begin 
        lrclk <= 1'h0; 
      end else begin
        lrclk <= _GEN_1;
      end
    end
    if (reset) begin 
      sdataO <= 1'h0; 
    end else if (CLK1EDGE_io_RISE) begin 
      if (bitCntrTrans > 8'h38) begin 
        sdataO <= 1'h0; 
      end else if (bitCntrTrans <= 8'h38 & _T_3) begin 
        sdataO <= _sdataO_T_9[0]; 
      end else begin
        sdataO <= _GEN_4;
      end
    end
  end