    always @(posedge ck) begin
        if (reset && !done_req)
            coef_addr <= coef_addr + 1;
        else
            coef_addr <= 0;
    end