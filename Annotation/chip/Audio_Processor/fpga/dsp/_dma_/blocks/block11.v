    wire [31:0] status;
    assign status = { 29'h0, xfer_match, block_done, xfer_done };