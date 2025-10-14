    always @(posedge ck) begin
        shift_0 <= offset;
        shift_1 <= shift_0;
        shift_2 <= shift_1;
        shift_3 <= shift_2;
    end