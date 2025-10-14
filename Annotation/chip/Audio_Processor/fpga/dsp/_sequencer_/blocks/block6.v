    always @(posedge ck) begin
        out_we <= shift_en;
    end