  always @ (posedge DRP_CLK) begin
    DRP_ADD     <= (nextstate == ADDR_PHASE);
    DRP_CS      <= (nextstate == ADDR_PHASE) | (nextstate == DATA_PHASE);
    if (state == READY)
      DRP_BKST  <= use_broadcast;
  end