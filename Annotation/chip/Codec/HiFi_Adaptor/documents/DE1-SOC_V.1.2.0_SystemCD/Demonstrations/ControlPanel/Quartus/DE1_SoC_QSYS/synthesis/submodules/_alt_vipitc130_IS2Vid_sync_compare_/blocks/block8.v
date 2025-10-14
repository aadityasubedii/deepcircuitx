always @ (posedge rst or posedge clk) begin
    if(rst) begin
        h_count_repeat <= 14'd0;
        h_count_remove <= 14'd0;
        v_count_repeat <= 13'd0;
        v_count_repeat_valid <= 1'b0;
        v_count_remove <= 13'd0;
        v_count_remove_valid <= 1'b0;
        state <= `SC_IDLE;
        sync_lines0 <= 1'b0;
        sync_samples0 <= 1'b0;
        sync_compare_v_reset0 <= 13'd0;
        sync_compare_h_reset0 <= 14'd0;
        remove_repeatn0 <= 1'b0;
        genlocked0 <= 1'b0;
		  sync_lines1 <= 1'b0;
        sync_samples1 <= 1'b0;
        sync_compare_v_reset1 <= 13'd0;
        sync_compare_h_reset1 <= 14'd0;
        remove_repeatn1 <= 1'b0;
        genlocked1 <= 1'b0;
		  sync_lines <= 1'b0;
        sync_samples <= 1'b0;
        sync_compare_v_reset <= 13'd0;
        sync_compare_h_reset <= 14'd0;
        remove_repeatn <= 1'b0;
        genlocked <= 1'b0;
    end else begin
        if(sclr) begin
            h_count_repeat <= 14'd0;
            h_count_remove <= 14'd0;
            v_count_repeat <= 13'd0;
            v_count_repeat_valid <= 1'b0;
            v_count_remove <= 13'd0;
            v_count_remove_valid <= 1'b0;
            state <= `SC_IDLE;
        end else begin
            if(sclr_state) begin
                h_count_repeat <= 14'd0;
                h_count_remove <= 14'd0;
                v_count_repeat <= 13'd0;
                v_count_repeat_valid <= (14'd0 == h_count_repeat) && (13'd0 == v_count_repeat);
                v_count_remove <= 13'd0;
                v_count_remove_valid <= (14'd0 == h_count_remove) && (13'd0 == v_count_remove);
            end else begin
                if(state == `SC_CVI && next_state == `SC_CVO) begin
                    h_count_remove <= h_count;
                    v_count_remove <= v_count;
                    v_count_remove_valid <= (h_count == h_count_remove) && (v_count == v_count_remove);
                end
                if(state == `SC_CVO && next_state == `SC_CVI) begin
                    h_count_repeat <= h_count;
                    v_count_repeat <= v_count;
                    v_count_repeat_valid <= (h_count == h_count_repeat) && (v_count == v_count_repeat);
                end
            end
        
            state <= next_state;
        end
        
        if(sclr | ~valid) begin
            sync_lines0 <= 1'b0;
            sync_samples0 <= 1'b0;
            sync_compare_v_reset0 <= 13'd0;
            sync_compare_h_reset0 <= 14'd0;
            genlocked0 <= 1'b0;
        end else begin
            if(syncing_lines) begin
                sync_compare_v_reset0 <= sync_compare_v_reset_next;
                sync_lines0 <= 1'b1;
                
                sync_compare_h_reset0 <= sync_compare_h_reset_next;
                sync_samples0 <= 1'b1;
                
                genlocked0 <= 1'b0;
            end else begin
                sync_compare_v_reset0 <= 13'd0;
                sync_lines0 <= 1'b0;
                
                if(sync_compare_h_reset_next > divider_value) begin
                    sync_compare_h_reset0 <= sync_compare_h_reset_next;
                    sync_samples0 <= 1'b1;
                    
                    genlocked0 <= 1'b0;
                end else begin
                    sync_compare_h_reset0 <= 14'd0;
                    sync_samples0 <= 1'b0;
                    
                    genlocked0 <= 1'b1;
                end
            end
            
        end
        
        remove_repeatn0 <= remove_samples_next;
		  
		  sync_lines1 <= sync_lines0;
		  sync_samples1 <= sync_samples0;
        remove_repeatn1 <= remove_repeatn0;
        sync_compare_h_reset1 <= sync_compare_h_reset0;
        sync_compare_v_reset1 <= sync_compare_v_reset0;
        genlocked1 <= genlocked0;
		  
		  sync_lines <= sync_lines1;
		  sync_samples <= sync_samples1;
        remove_repeatn <= remove_repeatn1;
        sync_compare_h_reset <= sync_compare_h_reset1;
        sync_compare_v_reset <= sync_compare_v_reset1;
        genlocked <= genlocked1;
    end
end