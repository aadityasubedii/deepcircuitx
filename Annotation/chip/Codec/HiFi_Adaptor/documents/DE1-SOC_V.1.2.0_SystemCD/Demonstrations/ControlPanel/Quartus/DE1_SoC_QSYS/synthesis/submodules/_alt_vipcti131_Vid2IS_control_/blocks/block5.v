always @ (posedge rst or posedge clk) begin
    if(rst) begin
        is_stable <= 1'b0;
        is_interlaced <= INTERLACED;
        is_active_sample_count <= {H_ACTIVE_PIXELS_F0, 1'b1};
        is_active_line_count_f0 <= {V_ACTIVE_LINES_F0, 1'b1};
        is_active_line_count_f1 <= (INTERLACED) ? {V_ACTIVE_LINES_F1, 1'b1} : 17'd0;
        is_total_sample_count <= 17'd0;
        is_total_line_count_f0 <= 17'd0;
        is_total_line_count_f1 <= 17'd0;
        is_resolution_valid <= 1'b0;
        
        is_update_reg <= 1'b0; 
     end else begin
        is_stable <= (is_update) ? stable : is_stable;
        is_interlaced <= (is_update) ? interlaced : is_interlaced;
        is_active_sample_count <= (is_update) ? {1'd0, active_sample_count} : is_active_sample_count;
        is_active_line_count_f0 <= (is_update) ? {2'd0, active_line_count_f0} : is_active_line_count_f0;
        is_active_line_count_f1 <= (is_update) ? {2'd0, active_line_count_f1} : is_active_line_count_f1;
        is_total_sample_count <= (is_update) ? {1'd0, total_sample_count} : is_total_sample_count;
        is_total_line_count_f0 <= (is_update) ? {2'd0, total_line_count_f0} : is_total_line_count_f0;
        is_total_line_count_f1 <= (is_update) ? {2'd0, total_line_count_f1} : is_total_line_count_f1;
        is_resolution_valid <= (is_update) ? resolution_valid : is_resolution_valid;
        
        is_update_reg <= update;
     end
end