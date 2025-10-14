    always @(posedge ck) begin
        acc_en <= fetching;
        req <= fetching;

        
        if (fetching & !req)
            clr <= 1;
        if (clr)
            clr <= 0;
    end