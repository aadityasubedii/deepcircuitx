always @ (posedge clk_i)
begin
if ( mcb_cmd_en_o)
   if ( xfer_addr != mcb_cmd_addr_o)
      fifo_error <= #TCQ 1'b1;
   else
      fifo_error <= #TCQ 1'b0;

end