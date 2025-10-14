    always @(posedge ck) begin

        if (i2s_en) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end

    end