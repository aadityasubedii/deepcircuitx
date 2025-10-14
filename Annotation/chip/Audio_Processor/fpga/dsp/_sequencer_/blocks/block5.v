    always @(posedge ck) begin
        out_addr_0 <= gain_1[(CHAN_W-1):0];
        out_addr_1 <= out_addr_0;
        out_addr_2 <= out_addr_1;
    end
