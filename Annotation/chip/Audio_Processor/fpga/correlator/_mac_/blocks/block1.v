    always @(posedge ck) begin
        if (clr || req || req_t1)
            done <= 0;
        else
            done <= 1;
    end