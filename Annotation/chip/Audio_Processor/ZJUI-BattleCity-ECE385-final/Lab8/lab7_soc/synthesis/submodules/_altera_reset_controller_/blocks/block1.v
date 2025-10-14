    always @* begin
        reset_out = r_sync_rst;
        reset_req = r_early_rst;
    end