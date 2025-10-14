    always @(posedge ck) begin
        if (we) begin
            if (sel[0]) mem[addr][ 7: 0] <= wdata[ 7: 0];
            if (sel[1]) mem[addr][15: 8] <= wdata[15: 8];
            if (sel[2]) mem[addr][23:16] <= wdata[23:16];
            if (sel[3]) mem[addr][31:24] <= wdata[31:24];
        end
        rdata <= mem[addr];
    end