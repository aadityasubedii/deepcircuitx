  always @ (posedge DRP_CLK) begin
    if(sync_rst) begin
      read_data   <= 8'h00;

    end
    else begin


      if(state == ALMOST_READY)
        read_data <= shift_through_reg;


    end
  end