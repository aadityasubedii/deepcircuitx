    always @(posedge clk)
    begin
        if (idle)
            counter <= 0;
        else
        begin
            counter <= counter + 1;
            if (max)
                o_state <= ~o_state;
        end
    end