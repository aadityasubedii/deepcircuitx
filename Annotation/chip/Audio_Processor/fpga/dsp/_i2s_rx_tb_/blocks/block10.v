    task send(input [23:0] l, input [23:0] r);

        begin
            wait((frame_posn == 1) && tx_en);
            tx_shift <= { l, 8'h0, r, 8'h0 };
            wait(frame_posn == 2);
        end

    endtask