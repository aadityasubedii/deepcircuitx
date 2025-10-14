  always @ (posedge DRP_CLK) begin
    if(sync_rst)
      shift_through_reg <= 8'b0;
    else begin
      if (load_shift_n)     
        shift_through_reg <= data_out_mux;
      else
        shift_through_reg <= {DRP_SDO, shift_through_reg[7:1]};
    end
  end