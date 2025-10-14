always @ (posedge clk_i)
begin
if (rst_ra[0])
    mcb_rd_empty_r <= #TCQ 1'b1;

else if (mcb_rd_fifo_counts <= 1)
    mcb_rd_empty_r <= #TCQ 1'b1;
else
    mcb_rd_empty_r <= #TCQ 1'b0;
end