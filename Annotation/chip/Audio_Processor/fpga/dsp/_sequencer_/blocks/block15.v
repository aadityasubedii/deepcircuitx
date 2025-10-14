    task capture(input [3:0] code);
        noop();
        case (code)
            0 : capture_out <= coef_data; 
            1 : capture_out <= { audio_in, pad, audio_raddr_0 }; 
            2 : capture_out <= { gain_2, audio }; 
            3 : capture_out <= mul_out; 

            5 : capture_out <= acc_out[31:0]; 
            6 : capture_out <= { 13'h0, out_addr, out_audio };
            7 : capture_out <= { 32'h12345678 };
        endcase
    endtask