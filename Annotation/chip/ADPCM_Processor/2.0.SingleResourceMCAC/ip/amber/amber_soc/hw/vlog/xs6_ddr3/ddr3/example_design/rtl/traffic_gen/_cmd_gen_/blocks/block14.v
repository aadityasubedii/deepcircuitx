always @ (posedge clk_i) begin
if (rst_i[4])
    force_rd <= #TCQ  1'b0;
else if (force_rd_counts[3])
    force_rd <= #TCQ  1'b1;
else
    force_rd <= #TCQ  1'b0;
end