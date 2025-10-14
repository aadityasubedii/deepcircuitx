    always @ (posedge CLK100MHZ)
    begin
        case(next_state)

            START: begin
                audio_reg <= audio_data;
                p1 <= audio_reg;
                p2 <= p1;
                p3 <= p2;
                p4 <= p3;
                p5 <= p4;
                p6 <= p5;
                p7 <= p6;
                p8 <= p7;
                p9 <= p8;
                p10 <= p9;
                p11 <= p10;
                p12 <= p11;
                p13 <= p12;
                p14 <= p13;
                p15 <= p14;
                p16 <= p15;
                p17 <= p16;
                p18 <= p17;
                p19 <= p18;
                p20 <= p19;
                p21 <= p20;
                p22 <= p21;
                p23 <= p22;
                p24 <= p23;
                p25 <= p24;
                p26 <= p25;
                p27 <= p26;
                p28 <= p27;
                p29 <= p28;
                p30 <= p29;
                p31 <= p30;
                p32 <= p31;
                next_state <= OVERDRIVE;
            end

            OVERDRIVE: begin
                if (sw[BTN_OVERDRIVE]==1)
                begin
                    if (audio_reg > CENTER_VAL+thresh) audio_reg <= (CENTER_VAL+thresh)+drive_amount;
                    else if(audio_reg < CENTER_VAL-thresh) audio_reg <= (CENTER_VAL-thresh)-drive_amount;
                end
                next_state <= CHORUS;
            end

            CHORUS: begin
                if (sw[BTN_CHORUS]==1)
                begin
                    audio_reg <= (audio_reg+p32)>>1; 
                end
                next_state <= TREMELO;
            end

            TREMELO: begin
                if (sw[BTN_TREMELO]==1)
                begin
                tremelo_count <= tremelo_count+1;
                if (tremelo_count == 32768) 
                    begin
                        if (tremelo_decrease == 1)
                            begin
                                tremelo_amplitude = tremelo_amplitude-1;
                                if (tremelo_amplitude == 0) tremelo_decrease = !tremelo_decrease;
                            end
                        else
                            begin
                                tremelo_amplitude = tremelo_amplitude+1;
                                if (tremelo_amplitude == 1024) tremelo_decrease = !tremelo_decrease;
                            end
                 end           
                 audio_reg <= (audio_reg*(1024+tremelo_amplitude)>>10);
                end
                next_state <= OUTPUT;
            end

            OUTPUT: begin
                PWM <= audio_reg;
                if (CLK_AUDIO == 1'b1) next_state <= START;
            end

            default: next_state <= START;

        endcase
    end
