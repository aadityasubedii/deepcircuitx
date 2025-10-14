always @ (posedge clk_i)
begin
if (rst_ra[0])
    mcb_wr_full_r1 <= #TCQ 1'b0;
else if (mcb_wr_fifo_counts >= 63) begin
    mcb_wr_full_r1 <= #TCQ 1'b1;
    mcb_wr_full_r2 <= #TCQ 1'b1;
    end
else begin
    mcb_wr_full_r1 <= #TCQ 1'b0;
    mcb_wr_full_r2 <= #TCQ 1'b0;
    end
end