    always @(posedge wb_clk) begin
        prescale <= prescale + 1;
    end