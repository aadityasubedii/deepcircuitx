    always @(posedge ck) begin

        if (rst) begin
            max <= 0;
        end

        if (peak_en & (uint >= max)) begin
            max <= uint;
        end 

        if (decay_en & (max > 0)) begin
            max <= max - 1;
        end

    end