always @ (posedge clk or posedge rst) begin
    if(rst) begin
        image_packet <= 1'b0;
        synced_int <= 1'b1;
        enable_synced_reg <= 1'b0;
    end else begin
        image_packet <= image_packet_nxt;
        synced_int <= synced_int_nxt;
        enable_synced_reg <= enable_synced;
    end
end