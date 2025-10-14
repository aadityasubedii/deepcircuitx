    always @(posedge ck) begin
        if (en) begin
            shift <= in;
            bits <= 0;
            busy <= 1;
        end 

        if (busy && !en) begin
            if (shift[IN_W-1] != shift[IN_W-2]) begin
                
                busy <= 0;
            end else begin
                bits <= bits + 1;
                shift <= { shift[IN_W-1], shift[IN_W-2:0], !shift[IN_W-1] };
            end
        end
    end