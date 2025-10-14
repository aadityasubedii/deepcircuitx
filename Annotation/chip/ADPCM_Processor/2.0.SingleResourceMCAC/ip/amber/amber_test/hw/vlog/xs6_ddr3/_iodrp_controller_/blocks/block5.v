  always @ (posedge DRP_CLK) begin
    if(sync_rst) begin
      AddressPhase  <= 1'b0;
    end
    else begin
      if (AddressPhase) begin
        
        AddressPhase <= AddressPhase && ~(state == ALMOST_READY);
      end
      else begin
        
        AddressPhase <= (state == ADDR_PHASE) && (bit_cnt == 3'b111);
      end
    end
  end