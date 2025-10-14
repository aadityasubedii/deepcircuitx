    always @(posedge ck) begin

        if (sample) begin

            shift <= { shift[BITS-2:0], sd };

            if (frame == EOW_LEFT) begin
                left <= shift;
            end

            if (frame == EOW_RIGHT) begin
                right <= shift;
            end

        end

    end