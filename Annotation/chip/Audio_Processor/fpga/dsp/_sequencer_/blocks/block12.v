    always @(posedge ck) begin
        gain_1 <= gain_0;
        gain_2 <= gain_1;
    end