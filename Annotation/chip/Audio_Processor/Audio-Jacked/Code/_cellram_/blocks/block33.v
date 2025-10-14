    always @(negedge adv_n or posedge ce_n) begin 
        sync_access <= 1'b0; 
    end