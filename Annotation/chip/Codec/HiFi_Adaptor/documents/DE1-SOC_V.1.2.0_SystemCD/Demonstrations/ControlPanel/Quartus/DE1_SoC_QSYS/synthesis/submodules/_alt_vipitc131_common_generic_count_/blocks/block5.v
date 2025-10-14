            always @(posedge clk or negedge reset_n)
                if (!reset_n)
                    ticks <= {TICKS_WORD_LENGTH{1'b0}};
                else
                    ticks <= (restart_count) ? {TICKS_WORD_LENGTH{1'b0}} :
                             (enable) ? (ticks >= TICKS_PER_COUNT - 1) ? {TICKS_WORD_LENGTH{1'b0}} : ticks + 1'b1 : ticks;