    altera_avalon_st_clock_crosser
    #(
        .SYMBOLS_PER_BEAT    (1),
        .BITS_PER_SYMBOL     (PAYLOAD_WIDTH),
        .FORWARD_SYNC_DEPTH  (VALID_SYNC_DEPTH),
        .BACKWARD_SYNC_DEPTH (READY_SYNC_DEPTH),
        .USE_OUTPUT_PIPELINE (USE_OUTPUT_PIPELINE)
    ) clock_xer (
        .in_clk    (in_clk      ),
        .in_reset  (in_reset    ),
        .in_ready  (in_ready    ),
        .in_valid  (in_valid    ),
        .in_data   (in_payload  ),
        .out_clk   (out_clk     ),
        .out_reset (out_reset   ),
        .out_ready (out_ready   ),
        .out_valid (out_valid   ),
        .out_data  (out_payload )
    );