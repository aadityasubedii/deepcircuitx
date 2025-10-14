    generate
        if(TICKS_PER_COUNT == 1) begin
            assign start_count = 1'b1;
            assign enable_count = enable;
            assign cp_ticks = 1'b0;
        end else begin
            reg [TICKS_WORD_LENGTH-1:0] ticks;
            