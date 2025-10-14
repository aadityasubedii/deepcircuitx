    always @(posedge ck) begin

        if(rst) begin
            prescale <= 0;
            tx_shift <= 0;
        end else begin

            prescale <= prescale + 1;
            if (frame_en) begin
                frame_posn <= frame_posn + 1;
            end
    
            if (frame_en) begin
                tx_shift <= { tx_shift[62:0], 1'b0 };
            end

        end

    end