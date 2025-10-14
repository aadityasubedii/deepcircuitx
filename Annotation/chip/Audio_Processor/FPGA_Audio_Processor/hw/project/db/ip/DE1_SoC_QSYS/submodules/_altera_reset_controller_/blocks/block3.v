    always @(posedge clk)
    begin
        if (altera_reset_synchronizer_int_chain[MIN_METASTABLE-1] == 1'b1)
        begin
            r_sync_rst_chain <= {ASSERTION_CHAIN_LENGTH{1'b1}};
    end
    else
    begin
        r_sync_rst_chain <= {1'b0, r_sync_rst_chain[ASSERTION_CHAIN_LENGTH-1:1]};
    end
    end