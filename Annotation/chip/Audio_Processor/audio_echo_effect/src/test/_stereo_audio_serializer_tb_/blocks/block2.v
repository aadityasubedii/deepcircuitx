    task out_data(input [audio_width-1:0] left, input [audio_width-1:0] right);
        begin
            aligned_i_left <= left;
            aligned_i_right <= right;
            aligned_i_valid <= 1'b1;
            wait (aligned_i_ready) @(posedge sclk);
            aligned_i_valid <= 1'b0;
            @(posedge sclk);
        end
    endtask