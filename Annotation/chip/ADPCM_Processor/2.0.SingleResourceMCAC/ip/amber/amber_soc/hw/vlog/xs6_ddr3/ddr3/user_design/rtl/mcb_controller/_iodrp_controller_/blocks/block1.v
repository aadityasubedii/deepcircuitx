  always @ (posedge DRP_CLK) begin
    if(sync_rst)
      state <= READY;
    else
      state <= nextstate;
  end