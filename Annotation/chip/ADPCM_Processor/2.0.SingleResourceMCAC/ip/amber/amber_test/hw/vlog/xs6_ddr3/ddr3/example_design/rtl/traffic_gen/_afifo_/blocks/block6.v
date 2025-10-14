always @ (posedge rd_clk )
begin
   if (rst)
        empty <= #TCQ 1'b1;
   else if ((buf_filled == 0) || (buf_filled == 1 && rd_strobe))
        empty <= #TCQ 1'b1;
   else
        empty <= #TCQ 1'b0;
end        