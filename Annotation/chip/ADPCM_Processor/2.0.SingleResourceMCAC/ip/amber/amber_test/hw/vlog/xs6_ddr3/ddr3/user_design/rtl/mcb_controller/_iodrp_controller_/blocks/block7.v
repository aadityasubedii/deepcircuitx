  always @ (posedge DRP_CLK) begin
    if (((state == ADDR_PHASE) | (state == DATA_PHASE)) & !sync_rst)
      bit_cnt <= bit_cnt + 1;
    else
      bit_cnt <= 3'b000;
  end