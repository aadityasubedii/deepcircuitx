    always @(posedge ck) begin
        addr <= { chan, frame + offset };
    end