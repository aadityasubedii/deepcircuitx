    initial begin
        sclk = 1'b0;
        forever begin
            #(SCLK_TIME / 2) sclk = ~sclk;
        end
    end