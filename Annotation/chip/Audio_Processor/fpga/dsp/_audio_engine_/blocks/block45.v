    always @(posedge ck) begin
        if (reset_req || frame_reset_req) begin
            resetx <= 0;
        end else begin
            if (resetx != 2'b10) begin
                resetx <= resetx + 1;
            end
        end
    end
