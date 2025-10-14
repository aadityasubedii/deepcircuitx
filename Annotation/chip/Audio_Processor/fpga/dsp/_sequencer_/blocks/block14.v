    always @(posedge ck) begin
        if (reset) begin
            case (op_code)
                OP_NOOP     : noop();
                OP_CAPTURE  : capture(offset[3:0]);
                OP_MAC      : mac(0, 1);
                OP_MACN     : mac(0, 0);
                OP_MACZ     : mac(1, 1);
                OP_MACNZ    : mac(1, 0);
                OP_SAVE     : save();
                OP_HALT     : halt();
                default     : err();
            endcase
        end else begin
            noop();
            error <= 0;
            done_req <= 0;
        end
    end