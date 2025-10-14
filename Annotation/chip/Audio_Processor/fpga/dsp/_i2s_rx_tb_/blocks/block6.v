    task send_32(input [15:0] l, input [15:0] r);

        begin
            wait((frame_posn == 1) && tx_en);
            tx_shift_32 <= { l, r };
            wait(frame_posn == 2);
        end

    endtask
