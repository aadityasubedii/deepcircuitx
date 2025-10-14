    always @(posedge clk) begin 
        if (!adv_n) begin
            saddr2dqr <= 1'b0;
            saddr2dqr <= #(1) 1'b1;
        end
    end