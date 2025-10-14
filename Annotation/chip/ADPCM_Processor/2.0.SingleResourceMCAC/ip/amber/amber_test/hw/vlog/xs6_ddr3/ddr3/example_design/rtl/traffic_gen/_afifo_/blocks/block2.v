always @ (posedge wr_clk )
begin
   if (rst) 
        full <= #TCQ 1'b0;
   else if ((buf_avail == 0) || (buf_avail == 1 && wr_en))
        full <= #TCQ 1'b1;
   else
        full <= #TCQ 1'b0;
end        