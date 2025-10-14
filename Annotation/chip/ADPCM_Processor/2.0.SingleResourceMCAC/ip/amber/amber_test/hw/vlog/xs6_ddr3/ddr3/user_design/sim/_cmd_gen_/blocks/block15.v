always @ (posedge clk_i) begin
if (rst_i[4])
    force_rd_counts <= #TCQ  'b0;
else if (instr_vld) begin
    force_rd_counts <= #TCQ  force_rd_counts + 1;
    end
end