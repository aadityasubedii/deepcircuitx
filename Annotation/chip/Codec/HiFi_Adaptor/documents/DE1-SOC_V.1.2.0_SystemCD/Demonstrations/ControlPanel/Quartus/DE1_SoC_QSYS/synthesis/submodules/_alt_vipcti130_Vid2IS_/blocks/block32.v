always @ (posedge rst_vid_clk or posedge vid_clk_int) begin
    if(rst_vid_clk) begin
        sync_count <= 2'b01;
        locked <= 1'b0;
	    enable_synced <= 1'b0;
        
        overflow_reg <= 1'b0;
        overflow_sticky <= 1'b0;
        vid_locked_reg <= 1'b0;
        
        h_sync_reg <= 1'b0;
        v_sync_reg <= 1'b0;
        ap_reg <= 1'b0;
        
        f_reg <= 1'b0;
        field_prediction <= 1'b0;
    end else begin
        if(~vid_locked | lost_vid_locked | overflowed) begin
            sync_count <= 2'b01;
            locked <= 1'b0;
            enable_synced <= 1'b0;
        end else begin
            sync_count <= sync_count_next;
            locked <= locked_next;
            enable_synced <= (frame_synch) ? enable_sync1 & locked_next : enable_synced;
        end
        
        h_sync_reg <= h_sync;
        v_sync_reg <= v_sync;
        ap_reg <= ap;
        
        overflow_reg <= overflow_nxt;
        overflow_sticky <= (overflow_nxt | overflow_sticky) & ~clear_overflow_sticky_sync1;
        vid_locked_reg <= vid_locked;
        
        f_reg <= f;
        field_prediction <= field_prediction_nxt;
    end
end