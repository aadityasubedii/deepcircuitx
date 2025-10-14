    always @(posedge ck) begin
        if (reset && !done_req && (coef_addr != 0)) begin
            gain    <= coef_data[15:0];
            chan    <= coef_data[16+(CHAN_W-1):16];
            offset  <= coef_data[16+(CHAN_W+FRAME_W-1):16+(CHAN_W)];
            op_code <= coef_data[31:16+(CHAN_W+FRAME_W)];
        end else begin
            op_code <= 0;
        end
    end