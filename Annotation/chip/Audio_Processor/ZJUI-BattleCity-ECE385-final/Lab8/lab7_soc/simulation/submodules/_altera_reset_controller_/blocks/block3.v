    always @(posedge clk)
    begin
        case ({altera_reset_synchronizer_int_chain[RSTREQ_ASRT_SYNC_TAP], r_sync_rst_chain[1], r_sync_rst})
            3'b000:   r_sync_rst <= 1'b0; 
            3'b001:   r_sync_rst <= 1'b0;
            3'b010:   r_sync_rst <= 1'b0;
            3'b011:   r_sync_rst <= 1'b1;
            3'b100:   r_sync_rst <= 1'b1; 
            3'b101:   r_sync_rst <= 1'b1;
            3'b110:   r_sync_rst <= 1'b1;
            3'b111:   r_sync_rst <= 1'b1; 
            default:  r_sync_rst <= 1'b1;
        endcase

        case ({r_sync_rst_chain[1], r_sync_rst_chain[RESET_REQ_DRST_TAP] | reset_req_pre})
            2'b00:   r_early_rst <= 1'b0; 
            2'b01:   r_early_rst <= 1'b1; 
            2'b10:   r_early_rst <= 1'b0; 
            2'b11:   r_early_rst <= 1'b1; 
            default: r_early_rst <= 1'b1;
        endcase
    end