    always @(posedge ck) begin
        add_0 <= !(neg_x ^ neg_y);
        acc_add <= add_0;
    end