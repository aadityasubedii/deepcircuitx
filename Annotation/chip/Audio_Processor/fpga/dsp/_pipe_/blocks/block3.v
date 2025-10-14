            always @(posedge ck) begin
                delay <= { delay[LENGTH-2:0], in };
            end