    always @(posedge ck) begin
        if (reset != 3)
            reset <= reset + 1;
    end
