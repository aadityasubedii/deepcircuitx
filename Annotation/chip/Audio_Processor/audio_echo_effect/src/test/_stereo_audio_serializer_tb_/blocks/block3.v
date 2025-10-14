    always @(posedge sclk or posedge reset) begin
        if (reset) begin
            aligned_o_ready <= 1'b1;
            encoder_audio <= 0;
            encoder_is_left <= 1'b0;
        end else begin
            if (aligned_o_valid && aligned_o_ready) begin
                encoder_audio <= aligned_o_audio;
                encoder_is_left <= aligned_o_is_left;
                $write("deodoer: is_left = %d / audio = %08h\n", aligned_o_is_left, aligned_o_audio);
                repeat (1) @(posedge sclk);
            end 
        end
    end