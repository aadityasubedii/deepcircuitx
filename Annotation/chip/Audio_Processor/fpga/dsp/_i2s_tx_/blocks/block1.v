    always @(posedge ck) begin

        if (en) begin
            sd <= shift[15];

            if (frame == 0) begin
                shift <= left;
            end else if (frame == midpoint) begin
                shift <= right;
            end else begin
                shift <= shift << 1;
            end

        end

    end