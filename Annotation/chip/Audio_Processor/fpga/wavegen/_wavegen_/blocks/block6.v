    always @(posedge ck) begin
        if (en && (frame_posn == 0)) begin
            addr <= addr + 1;
            frame <= frame + 1;
            pulse_period <= pulse_period + 1;
            case (state)
                0 : begin
                    signal_0 <= sin(addr);
                    signal_1 <= sin(addr << 1);
                    signal_2 <= sin(addr << 2);
                    signal_3 <= sin(addr << 3);
                end
                1 : begin
                    signal_0 <= sin(addr << 2);
                    signal_1 <= sin(addr << 3);
                    signal_2 <= sin(addr << 4);
                    signal_3 <= sin(addr << 5);
                end
                2 : begin
                    signal_0 <= sin(addr << 3);
                    signal_1 <= sin(addr << 4);
                    signal_2 <= sin(addr << 5);
                    signal_3 <= sin(addr << 6);
                end
                3 : begin
                    
                    if (pulse_period == 0) begin
                        signal_0 <= 16'h7ff0;
                        signal_1 <= 16'h8010;
                        signal_2 <= 16'h7ff0;
                        signal_3 <= 16'h8010;
                    end else begin
                        signal_0 <= 16'h0000;
                        signal_1 <= 16'h0000;
                        signal_2 <= 16'h0000;
                        signal_3 <= 16'h0000;
                    end
                end
            endcase
        end
    end