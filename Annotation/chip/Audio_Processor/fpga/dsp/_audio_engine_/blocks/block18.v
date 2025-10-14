    always @(posedge ck) begin
        if (seq_we) begin

            case (seq_wr_addr[1:0])
                LCHAN_0 :   left_0  <= seq_audio;
                RCHAN_0 :   right_0 <= seq_audio;
                LCHAN_1 :   left_1  <= seq_audio;
                RCHAN_1 :   right_1 <= seq_audio;
            endcase

        end
    end
