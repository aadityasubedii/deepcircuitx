generate begin : use_std_generate
    if(USE_STD) begin
        alt_vipcti130_common_sync #(CLOCKS_ARE_SAME, STD_WIDTH) vid_std_sync(
            .rst(rst),
            .sync_clock(is_clk),
            .data_in(vid_std),
            .data_out(vid_std_sync1));
    end else begin
        assign vid_std_sync1 = {STD_WIDTH{1'b0}};
    end
end endgenerate