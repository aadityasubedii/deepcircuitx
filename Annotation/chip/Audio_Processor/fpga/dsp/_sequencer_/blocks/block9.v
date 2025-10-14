    always @(posedge ck) begin
        acc_add_0 <= acc_add_req;
        
        acc_add_1 <= acc_add_0;
        acc_add <= acc_add_1 ^ negative;
    end