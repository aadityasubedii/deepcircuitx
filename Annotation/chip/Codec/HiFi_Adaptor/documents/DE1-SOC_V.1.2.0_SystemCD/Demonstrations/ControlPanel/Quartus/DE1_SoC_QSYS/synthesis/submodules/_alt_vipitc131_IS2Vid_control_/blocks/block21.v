        if(NO_OF_MODES_INT >= 16) begin
            assign is_mode_match_output = is_mode_match[15:0];
        end else begin