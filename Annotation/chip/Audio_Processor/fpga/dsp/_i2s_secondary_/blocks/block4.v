    always @(posedge ck) begin

        ws <= ext_ws;
        ws_0 <= ws;

        has_64_bits <= ext_frame_posn == 6'h3f;

        if (ext_okay) begin
            frames <= 0;
        end else if (local_sof) begin
            if (frames != 2'b11) begin
                frames <= frames + 1;
            end
        end

        if (local_sof) begin
            if (frames == 0) begin
                if (good_frames != 2'b11) begin
                    good_frames <= good_frames + 1;
                end
            end else begin
                good_frames <= 0;
            end
        end

    end