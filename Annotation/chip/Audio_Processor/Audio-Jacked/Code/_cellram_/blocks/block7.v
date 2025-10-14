    always @(negedge adv_n) begin
        if (!adv_n) begin
            adv2dqr <= 1'b0;
            adv2dqr <= #(1) 1'b1;
        end
    end