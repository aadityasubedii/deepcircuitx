    end else begin
        assign is_valid = 1'b0;
        assign is_sop = 1'b0;
        assign is_eop = 1'b0;
        assign is_data = {DATA_WIDTH{1'b0}};
    end