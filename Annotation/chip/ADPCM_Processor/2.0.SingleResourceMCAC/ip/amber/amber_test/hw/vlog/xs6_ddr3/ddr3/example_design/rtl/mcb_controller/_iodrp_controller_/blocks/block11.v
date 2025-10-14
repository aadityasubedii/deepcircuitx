  always @ (posedge DRP_CLK) begin
     if(state == READY) begin
       memcell_addr_reg <= memcell_address;
       data_reg <= write_data;
       rd_not_write_reg <= rd_not_write;
     end
  end