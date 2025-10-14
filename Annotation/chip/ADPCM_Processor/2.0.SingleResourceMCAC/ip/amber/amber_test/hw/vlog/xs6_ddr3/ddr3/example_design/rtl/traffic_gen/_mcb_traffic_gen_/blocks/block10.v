always @ (posedge clk_i)
begin
if (rst_rb[0])
   rd_mdata_afull_set <= #TCQ 1'b0;
else if (rd_mdata_fifo_afull)
   rd_mdata_afull_set <= #TCQ 1'b1;
end