    generate 
        if (RESET_LOOP) begin
            reg [(RUN_SLOW ? 21 : 24):0] reseter = 0;
