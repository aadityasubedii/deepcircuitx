    always @(posedge ck) begin

        en <= start_sck;

        if (start_sck) begin
            frame_posn <= frame_posn + 1;
        end

        if (start_frame) begin
            frame_posn <= 0;
        end

    end