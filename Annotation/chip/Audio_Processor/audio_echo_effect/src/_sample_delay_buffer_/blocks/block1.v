    always @(posedge clk or posedge reset) begin
        if (reset) begin
            buffer_ad <= 0;
            buffer_wd <= 0;
            buffer_we <= 1'b0;
            state <= 3'd0;
            i_ready <= 1'b1;
            o_audio <= 0;
            o_current <= 0;
            o_valid <= 1'b0;
            o_valid_processor <= 1'b0;
            i_ready_processor <= 1'b0;
        end else
            case (state)
            3'd0:
                begin
                    buffer_wd <= i_audio;
                    buffer_we <= 1'b1;
                    if (i_valid) begin
                        i_ready <= 1'b0;
                        state <= 3'd1;
                    end
                end
            3'd1:
                begin
                    buffer_we <= 1'b0;
                    buffer_ad <= next_buffer_ad;
                    if (buffer_ad == buffer_depth_last) begin
                        state <= 3'd2;
                    end else begin
                        o_audio <= buffer_wd;
                        o_valid <= 1'b1;
                        state <= 3'd7;
                    end
                end
            3'd7:
                if (o_ready) begin
                    o_valid <= 1'b0;
                    i_ready <= 1'b1;
                    state <= 3'd0;
                end
            3'd2:
                begin
                    i_ready <= 1'b1;
                    state <= 3'd3;
                end
            3'd3:
                begin
                    o_current <= i_audio;
                    if (i_valid) begin
                        i_ready <= 1'b0;
                        o_valid_processor <= 1'b1;
                        state <= 3'd4;
                    end
                end
            3'd4:
                if (o_ready_processor) begin
                    o_valid_processor <= 1'b0;
                    i_ready_processor <= 1'b1;
                    state <= 3'd5;
                end
            3'd5:
                begin
                    buffer_we <= 1'b1;
                    buffer_wd <= i_feedback;
                    o_audio <= i_current;
                    if (i_valid_processor) begin
                        i_ready_processor <= 1'b0;
                        o_valid_processor <= 1'b0;
                        o_valid <= 1'b1;
                        state <= 3'd6;
                    end
                end
            3'd6:
                begin
                    buffer_we <= 1'b0;
                    if (o_ready) begin
                        o_valid <= 1'b0;
                        buffer_ad <= next_buffer_ad;
                        state <= 3'd2;
                    end
                end
            endcase