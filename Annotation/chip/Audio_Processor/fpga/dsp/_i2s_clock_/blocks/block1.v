    always @(posedge ck) begin

        if (rst) begin

            prescale <= 0;
            frame_posn <= 0;
            en <= 0;
            ws <= 0;
            sck <= 0;

        end else begin

            if (prescale == (DIVIDER-1)) begin
                prescale <= 0;
                frame_posn <= frame_posn + 1;
                en <= 1;
            end else begin
                prescale <= prescale + 1;
                en <= 0;
            end

        end

        sck <= (prescale >= (DIVIDER/2)) ? 1 : 0;
        ws <= (frame_posn >= 32) ? 1 : 0;

    end