    generate if (OUTPUT_RESET_SYNC_EDGES == "none" && (RESET_REQUEST_PRESENT==0)) begin

        assign reset_out_pre = merged_reset;
        assign reset_req_pre = merged_reset_req_in;

    end else begin

        altera_reset_synchronizer
        #(
            .DEPTH      (SYNC_DEPTH),
            .ASYNC_RESET(RESET_REQUEST_PRESENT? 1'b1 : ASYNC_RESET)
        )
        alt_rst_sync_uq1
        (
            .clk        (clk),
            .reset_in   (merged_reset),
            .reset_out  (reset_out_pre)
        );

        altera_reset_synchronizer
        #(
            .DEPTH      (SYNC_DEPTH),
            .ASYNC_RESET(0)
        )
        alt_rst_req_sync_uq1
        (
            .clk        (clk),
            .reset_in   (merged_reset_req_in),
            .reset_out  (reset_req_pre)
        );

    end
    endgenerate