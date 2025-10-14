    always @(posedge ck) begin

        if (en) begin
            busy_start <= 1;
            addr <= 0;
        end

        if (busy_start) begin
            addr <= addr + 1;

            if (addr == (CHANS-1)) begin
                busy_start <= 0;
            end
        end 

    end