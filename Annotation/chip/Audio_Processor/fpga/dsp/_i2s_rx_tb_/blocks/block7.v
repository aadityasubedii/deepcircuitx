    always @(posedge ck) begin

        if (rst) begin
            tx_shift_32 <= 0;
        end else begin
            if (frame_en) begin
                tx_shift_32 <= { tx_shift_32[30:0], 1'b0 };
            end
        end

    end