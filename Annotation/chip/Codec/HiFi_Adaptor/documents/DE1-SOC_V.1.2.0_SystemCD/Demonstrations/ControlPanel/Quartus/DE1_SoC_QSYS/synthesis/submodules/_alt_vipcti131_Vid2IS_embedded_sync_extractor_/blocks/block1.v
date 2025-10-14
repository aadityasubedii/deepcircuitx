always @ (posedge rst or posedge clk) begin
    if(rst) begin
        vid_data0 <= {DATA_WIDTH{1'b0}};
        vid_data1 <= {DATA_WIDTH{1'b0}};
        vid_data2 <= {DATA_WIDTH{1'b0}};
        
        h_reg <= 1'b0;
        h_delay <= 4'b000;
        v_delay <= 4'b000;
        f_delay <= 4'b000;
        
        anc_state <= ANC_IDLE;
        data_count <= 8'd0;
    end else begin
        vid_data0 <= (vid_enable) ? vid_data_in  : vid_data0;
        vid_data1 <= (vid_enable) ? vid_data0 : vid_data1;
        vid_data2 <= (vid_enable) ? vid_data1 : vid_data2;
        
        h_reg <= h_next;
        if(vid_enable) begin
            h_delay <= h_delay_nxt;
            v_delay <= v_delay_nxt;
            f_delay <= f_delay_nxt;
        end
        
        if(vid_locked) begin
            if(vid_enable) begin
                case(anc_state)
                    ANC_IDLE: begin
                        if(anc_nxt && !h_next && GENERATE_ANC == 1)
                            anc_state <= ANC_DATA_FLAG_1;
                    end
                    ANC_DATA_FLAG_1: begin
                        anc_state <= ANC_DATA_FLAG_2;
                    end
                    ANC_DATA_FLAG_2: begin
                        anc_state <= ANC_DATA_FLAG_3;
                    end
                    ANC_DATA_FLAG_3: begin
                        anc_state <= ANC_DID;
                    end
                    ANC_DID: begin
                        anc_state <= ANC_SID;
                    end
                    ANC_SID: begin
                        anc_state <= ANC_DATA_COUNT;
                    end
                    ANC_DATA_COUNT: begin
                        data_count <= data_count_next;
                        anc_state <= ANC_USER_WORDS;
                    end
                    ANC_USER_WORDS: begin
                        if(data_count == 8'd0 || !vid_v_sync)
                            if(anc_nxt)
                                anc_state <= ANC_DATA_FLAG_1;
                            else
                                anc_state <= ANC_IDLE;
                        else if(!vid_h_sync)
                              data_count <= data_count - 8'd1;
                    end
                endcase
            end
        end else begin
            anc_state <= ANC_IDLE;
        end
    end
end