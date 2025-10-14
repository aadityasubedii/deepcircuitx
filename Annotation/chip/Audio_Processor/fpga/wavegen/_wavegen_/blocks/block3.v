    always @(posedge ck) begin
        if (prescale == 0)
            counter <= { counter[2:0], next };
    end