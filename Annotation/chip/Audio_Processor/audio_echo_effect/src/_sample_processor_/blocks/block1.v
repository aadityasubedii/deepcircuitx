    always @(posedge clk or posedge reset) begin
        if (reset) begin
            i_ready_processor <= 1'b1;
            o_valid_processor <= 1'b0;
            o_current_left <= 0;
            o_current_right <= 0;
            o_feedback_left <= 0;
            o_feedback_right <= 0;
        end else begin
            if (i_valid_processor) begin
                o_current_left <=  ($signed(i_current_left) >>> 1) + ($signed(i_current_left) >>> 2) + ($signed(i_buffer_right) >>> 2);
                o_feedback_left <= ($signed(i_current_left) >>> 1) + ($signed(i_current_left) >>> 2) + ($signed(i_buffer_left) >>> 2);
                o_current_right <= ($signed(i_current_right) >>> 1) + ($signed(i_current_right) >>> 2) + ($signed(i_buffer_left) >>> 2);
                o_feedback_right <= ($signed(i_current_right) >>> 1) + ($signed(i_current_right) >>> 2) + ($signed(i_buffer_right) >>> 2);
                o_valid_processor <= 1'b1;
                i_ready_processor <= 1'b0;
            end else if (o_valid_processor && o_ready_processor) begin
                i_ready_processor <= 1'b1;
                o_valid_processor <= 1'b0;
            end
        end
    end