always @ (posedge rst or posedge clk) begin
    if(rst) begin
        datavalid_reg <= 1'b0;
        needs_invert <= 1'b0;
        invert_sync <= 1'b0;
    end else begin
        datavalid_reg <= datavalid;
        needs_invert <= needs_invert_nxt & ~datavalid_negedge;
        invert_sync <= invert_sync_nxt;
    end
end