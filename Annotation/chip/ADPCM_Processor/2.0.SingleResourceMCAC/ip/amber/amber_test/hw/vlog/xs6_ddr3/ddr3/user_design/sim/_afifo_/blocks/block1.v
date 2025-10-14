always @ (posedge wr_clk )
begin
   if (rst) 
        almost_full <= #TCQ 1'b0;
   else if ((buf_avail == FIFO_DEPTH - 2 ) || ((buf_avail == FIFO_DEPTH -3) && wr_en))
        almost_full <= #TCQ 1'b1;
   else
        almost_full <= #TCQ 1'b0;
end        