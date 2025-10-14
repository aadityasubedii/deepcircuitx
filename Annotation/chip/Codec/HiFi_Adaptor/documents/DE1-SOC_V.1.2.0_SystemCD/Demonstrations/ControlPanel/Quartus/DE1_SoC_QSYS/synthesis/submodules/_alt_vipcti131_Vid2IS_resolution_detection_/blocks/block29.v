always @ (posedge rst or posedge clk) begin
    if(rst) begin
        current_field <= {INTERLACED, 1'b0};
        prev_field <= 2'b00;
        interlaced <= 1'b0;
        interlaced_valid <= 1'b0;
        start_new_field_sticky <= 1'b0;
        reset_line_count <= 1'b0;
        
        lines <= 3'b000;
        stable <= 1'b0;
        stable_reg <= 1'b0;
        
        active_line <= 1'b0;
        next_active_sample_count <= 14'd0;
        next_active_line_count <= 13'd0;
        next_total_sample_count <= 14'd0;
        next_total_line_count <= 13'd0;
        active_sample_count <= {H_ACTIVE_PIXELS, 1'b1};
        active_line_count_f0 <= {V_ACTIVE_LINES_F0, 1'b1};
        active_line_count_f1 <= (INTERLACED) ? {V_ACTIVE_LINES_F1, 1'b1} : 17'd0;
        total_sample_count <= 15'd0;
        total_line_count_f0 <= 14'd0;
        total_line_count_f1 <= 14'd0;
        total_line_count <= 14'd0;
        
        update <= 1'b0;
        first_start_new_field <= 1'b0;
        first_start_of_line <= 1'b0;
        second_active_line <= 1'b0;
        
        resolution_valid <= 1'b0;
        resolution_valid_reg <= 1'b0;
        resolution_change <= 1'b0;
    end else begin
        
        
        current_field <= (~vid_locked) ? {current_field[1], 1'b0} : (end_of_vsync) ? {f, 1'b1} : current_field;
        prev_field <= (~vid_locked) ? {prev_field[1], 1'b0} : (end_of_vsync) ? current_field : prev_field;
        interlaced <= current_field[1] | prev_field[1];
        interlaced_valid <= current_field[0] & prev_field[0];
        start_new_field_sticky <= (start_new_field | start_new_field_sticky) & ~start_new_line;
        reset_line_count <= reset_line_count_nxt;
        
        
        lines <= lines_next;
        stable <= stable_next;
        stable_reg <= stable;
        
        active_line <= (ap | active_line) & ~start_new_line;
        next_active_sample_count <= (end_of_active_line) ? 14'd0 : (ap_plus_1) ? next_active_sample_count + 14'd1 : next_active_sample_count;
        next_active_line_count <= (reset_line_count) ? 13'd0 : (end_of_active_line) ? next_active_line_count + 13'd1 : next_active_line_count;
        next_total_sample_count <= (start_new_line) ? {13'd0, count_sample} : (count_sample) ? next_total_sample_count + 14'd1 : next_total_sample_count;
        next_total_line_count <= (reset_line_count) ? 13'd0 : (start_new_line) ? next_total_line_count + 13'd1 : next_total_line_count;
        
        
        active_sample_count <= active_sample_count_nxt;
        active_line_count_f0 <= active_line_count_f0_nxt;
        active_line_count_f1 <= active_line_count_f1_nxt;
        total_sample_count <= total_sample_count_nxt;
        total_line_count_f0 <= total_line_count_f0_nxt;
        total_line_count_f1 <= total_line_count_f1_nxt;
        total_line_count[13:1] <= (~interlaced) ? total_line_count_f0_nxt[13:1] : total_line_count_f0_nxt[13:1] + total_line_count_f1_nxt[13:1];
        total_line_count[0] <= total_line_count_f0_nxt[0] & (~interlaced | total_line_count_f1_nxt[0]);
        
        update <= update ^ (field_update | stable_update | resolution_valid_update);
        first_start_of_line <= (start_new_line | first_start_of_line) & vid_locked;
        first_start_new_field <= (reset_line_count | first_start_new_field) & vid_locked;
        second_active_line <= (end_of_active_line | (second_active_line & ~start_new_line)) & vid_locked;  
                                                                                                           
        
        resolution_valid <= resolution_valid_nxt;
        resolution_valid_reg <= resolution_valid;
        resolution_change <= resolution_change ^ ((resolution_valid & resolution_valid_nxt & field_update) | (resolution_valid & ~resolution_valid_reg));
    end
end