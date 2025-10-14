        end else begin
            assign is_mode_match_output = {{16-NO_OF_MODES_INT{1'b0}}, is_mode_match};
        end