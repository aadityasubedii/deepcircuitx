    always @(posedge ck) begin

        if (we) begin
            ram[waddr] <= wdata;
        end

        if (re) begin
            rdata <= ram[raddr];
        end

    end